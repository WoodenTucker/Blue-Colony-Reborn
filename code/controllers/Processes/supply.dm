//Config stuff
#define SUPPLY_DOCKZ 2				//Z-level of the Dock.
#define SUPPLY_STATIONZ 1			//Z-level of the Station.
#define SUPPLY_STATION_AREATYPE "/area/supply/station"	//Type of the supply shuttle area for station
#define SUPPLY_DOCK_AREATYPE "/area/supply/dock"	//Type of the supply shuttle area for dock

//Supply packs are in /code/datums/supplypacks
//Computers are in /code/game/machinery/computer/supply.dm

/datum/supply_order
	var/ordernum							// Unfabricatable index
	var/index								// Fabricatable index
	var/datum/supply_pack/object = null
	var/cost								// Cost of the supply pack (Fabricatable) (Changes not reflected when purchasing supply packs, this is cosmetic only)
	var/name								// Name of the supply pack datum (Fabricatable)
	var/ordered_by = null					// Who requested the order
	var/comment = null						// What reason was given for the order
	var/approved_by = null					// Who approved the order
	var/ordered_at							// Date and time the order was requested at
	var/approved_at						// Date and time the order was approved at
	var/status							// [Requested, Accepted, Denied, Shipped]
	var/bank_id							// bank id of the person ordering.
	var/dept_uid							// unique id of department card - if card is still around, it will deduct from its spending balance if approved

/datum/exported_crate
	var/name
	var/value
	var/list/contents

var/datum/controller/supply/supply_controller = new()

/datum/controller/supply
	//supply points
	var/points_per_slip = 2
	var/points_per_money = 0.02 // 1 point for $50
	//control
	var/ordernum
	var/list/shoppinglist = list()			// Approved orders
	var/list/supply_pack = list()			// All supply packs
	var/list/exported_crates = list()		// Crates sent from the station
	var/list/order_history = list()			// History of orders, showing edits made by users
	var/list/adm_order_history = list() 	// Complete history of all orders, for admin use
	var/list/adm_export_history = list()	// Complete history of all crates sent back on the shuttle, for admin use
	//shuttle movement
	var/movetime = 1200
	var/datum/shuttle/ferry/supply/shuttle


/datum/controller/supply/New()
	ordernum = rand(1,9000)

	for(var/typepath in subtypesof(/datum/supply_pack))
		var/datum/supply_pack/P = new typepath()
		supply_pack[P.name] = P

/datum/controller/process/supply/setup()
	name = "supply controller"
	schedule_interval = 300 // every 30 seconds

//To stop things being sent to CentCom which should not be sent to centcomm. Recursively checks for these types.
/datum/controller/supply/proc/forbidden_atoms_check(atom/A)
	if(isliving(A))
		return 1
	if(istype(A,/obj/item/weapon/disk/nuclear))
		return 1
	if(istype(A,/obj/machinery/nuclearbomb))
		return 1
	if(istype(A,/obj/item/device/radio/beacon))
		return 1

	for(var/atom/B in A.contents)
		if(.(B))
			return 1

//Selling
/datum/controller/supply/proc/sell()
	var/area/area_shuttle = shuttle.get_location_area()
	if(!area_shuttle)
		return

	if(!config.allow_exports)
		return

	callHook("sell_shuttle", list(area_shuttle));

	for(var/atom/movable/MA in area_shuttle)
		if(MA.anchored)
			continue

		var/datum/exported_crate/EC = new /datum/exported_crate()
		EC.name = "\proper[MA.name]"
		EC.value = 0
		EC.contents = list()

		// Must be in a crate!
		if(istype(MA,/obj/structure/closet/crate))
			var/obj/structure/closet/crate/CR = MA
			callHook("sell_crate", list(CR, area_shuttle))

			adjust_dept_funds(DEPT_FACTORY, CR.points_per_crate)

			for(var/atom/A in CR)
				EC.contents[++EC.contents.len] = list(
						"object" = "\proper[A.name]",
						"value" = 0,
						"quantity" = 1
					)


				var/obj/sold = A
				EC.contents[EC.contents.len]["value"] = sold.get_item_cost(TRUE)
				EC.contents[EC.contents.len]["quantity"] = 1
				EC.value += EC.contents[EC.contents.len]["value"]



		// Make a log of it, but it wasn't shipped properly, and so isn't worth anything
		else
			EC.contents = list(
					"error" = "Error: Product was improperly packaged. Payment rendered null under terms of agreement."
				)

		exported_crates += EC
		adjust_dept_funds(DEPT_FACTORY, EC.value, "Crate: [EC.name]")

		// Duplicate the receipt for the admin-side log
		var/datum/exported_crate/adm = new()
		adm.name = EC.name
		adm.value = EC.value
		adm.contents = deepCopyList(EC.contents)
		adm_export_history += adm

		qdel(MA)

//Buying
/datum/controller/supply/proc/buy()
	var/list/shoppinglist = list()
	for(var/datum/supply_order/SO in order_history)
		if(SO.status == SUP_ORDER_APPROVED)
			shoppinglist += SO

	if(!shoppinglist.len)
		return

	var/orderedamount = shoppinglist.len

	var/area/area_shuttle = shuttle.get_location_area()
	if(!area_shuttle)
		return

	var/list/clear_turfs = list()

	for(var/turf/T in area_shuttle)
		if(T.density)
			continue
		var/contcount
		for(var/atom/A in T.contents)
			if(!A.simulated)
				continue
			contcount++
		if(contcount)
			continue
		clear_turfs += T

	for(var/datum/supply_order/SO in shoppinglist)
		if(!clear_turfs.len)
			break

		var/i = rand(1,clear_turfs.len)
		var/turf/pickedloc = clear_turfs[i]
		clear_turfs.Cut(i,i+1)

		SO.status = SUP_ORDER_SHIPPED
		var/datum/supply_pack/SP = SO.object

		var/obj/A = new SP.containertype(pickedloc)
		A.name = "[SP.containername] [SO.comment ? "([SO.comment])":"" ]"

		//supply manifest generation begin
		var/obj/item/weapon/paper/manifest/slip
		if(!SP.contraband)
			slip = new /obj/item/weapon/paper/manifest(A)
			slip.is_copy = 0
			slip.info = "<h3>[command_name()] Shipping Manifest</h3><hr><br>"
			slip.info +="Order #[SO.ordernum]<br>"
			slip.info +="Destination: [station_name()]<br>"
			slip.info +="[orderedamount] PACKAGES IN THIS SHIPMENT<br>"
			slip.info +="CONTENTS:<br><ul>"

		//spawn the stuff, finish generating the manifest while you're at it
		if(SP.access)
			if(isnum(SP.access))
				A.req_access = list(SP.access)
			else if(islist(SP.access))
				var/list/L = SP.access // access var is a plain var, we need a list
				A.req_access = L.Copy()
			else
				log_debug("<span class='danger'>Supply pack with invalid access restriction [SP.access] encountered!</span>")

		var/list/contains
		if(istype(SP,/datum/supply_pack/randomised))
			var/datum/supply_pack/randomised/SPR = SP
			contains = list()
			if(SPR.contains.len)
				for(var/j=1,j<=SPR.num_contained,j++)
					contains += pick(SPR.contains)
		else
			contains = SP.contains

		for(var/typepath in contains)
			if(!typepath)
				continue

			var/number_of_items = max(1, contains[typepath])
			for(var/j = 1 to number_of_items)
				var/atom/B2 = new typepath(A)
				if(slip)
					slip.info += "<li>[B2.name]</li>" //add the item to the manifest

		//manifest finalisation
		if(slip)
			slip.info += "</ul><br>"
			slip.info += "CHECK CONTENTS AND STAMP BELOW THE LINE TO CONFIRM RECEIPT OF GOODS<hr>"

	return

// Will attempt to purchase the specified order, returning TRUE on success, FALSE on failure
/datum/controller/supply/proc/approve_order(var/datum/supply_order/O, var/mob/user)

	var/obj/item/weapon/card/department/DC

	if(O.dept_uid)
		DC = get_deptcard_by_id(O.dept_uid)

		if(!DC || O.object.cost > DC.spending_limit)
			to_chat(user, "<span class='warning'>ERROR: Issue with associated department card, either does not exist or lacks funds for this purchase.</span>")
			return FALSE

	var/datum/money_account/M = get_account(O.bank_id)

	if(!M)
		to_chat(user, "<span class='warning'>ERROR: Bank ID of order is incorrect or invalid.</span>")
		return FALSE

	if(O.object.cost > M.money)
		to_chat(user, "<span class='warning'>ERROR: Associated order bank account lacks sufficient funds for this order. Payment can not continue.</span>")
		return FALSE

	if(M.suspended)
		to_chat(user, "<span class='warning'>ERROR: Associated order bank account is suspended. Payment can not continue.</span>")
		return FALSE

	if(!charge_to_account(O.bank_id, "Supply Systems[DC ? " (via [DC])" : ""]", "[O.object.name]", "Port Computer" , -O.object.cost))
		to_chat(user, "<span class='warning'>ERROR: Unable to charge bank account associated with provided order bank details.</span>")
		return FALSE


	// Based on the current model, there shouldn't be any entries in order_history, requestlist, or shoppinglist, that aren't matched in adm_order_history
	var/datum/supply_order/adm_order
	for(var/datum/supply_order/temp in adm_order_history)
		if(temp.ordernum == O.ordernum)
			adm_order = temp
			break

	var/idname = "*None Provided*"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		idname = H.get_authentification_name()
	else if(issilicon(user))
		idname = user.real_name

	// Update order status
	O.status = SUP_ORDER_APPROVED
	O.approved_by = idname
	O.approved_at = stationdate2text() + " - " + stationtime2text()
	// Update admin-side mirror
	adm_order.status = SUP_ORDER_APPROVED
	adm_order.approved_by = idname
	adm_order.approved_at = stationdate2text() + " - " + stationtime2text()

	// Deduct cost
	adjust_dept_funds(DEPT_FACTORY, O.object.cost, "[O.ordernum]: [O.object.name] | Ordered by: [O.ordered_by] | Approved by: [O.approved_by]")
	if(DC)
		DC.spending_limit -= O.object.cost

	return TRUE

// Will deny the specified order. Only useful if the order is currently requested, but available at any status
/datum/controller/supply/proc/deny_order(var/datum/supply_order/O, var/mob/user)
	// Based on the current model, there shouldn't be any entries in order_history, requestlist, or shoppinglist, that aren't matched in adm_order_history
	var/datum/supply_order/adm_order
	for(var/datum/supply_order/temp in adm_order_history)
		if(temp.ordernum == O.ordernum)
			adm_order = temp
			break

	var/idname = "*None Provided*"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		idname = H.get_authentification_name()
	else if(issilicon(user))
		idname = user.real_name

	// Update order status
	O.status = SUP_ORDER_DENIED
	O.approved_by = idname
	O.approved_at = stationdate2text() + " - " + stationtime2text()
	// Update admin-side mirror
	adm_order.status = SUP_ORDER_DENIED
	adm_order.approved_by = idname
	adm_order.approved_at = stationdate2text() + " - " + stationtime2text()
	return

// Will deny all requested orders
/datum/controller/supply/proc/deny_all_pending(var/mob/user)
	for(var/datum/supply_order/O in order_history)
		if(O.status == SUP_ORDER_REQUESTED)
			deny_order(O, user)

// Will delete the specified order from the user-side list
/datum/controller/supply/proc/delete_order(var/datum/supply_order/O, var/mob/user)
	// Making sure they know what they're doing
	if(alert(user, "Are you sure you want to delete this record? If it has been approved, cargo points will NOT be refunded!", "Delete Record","No","Yes") == "Yes")
		if(alert(user, "Are you really sure? There is no way to recover the order once deleted.", "Delete Record", "No", "Yes") == "Yes")
			log_admin("[key_name(user)] has deleted supply order \ref[O] [O] from the user-side order history.")
			supply_controller.order_history -= O
	return

// Will generate a new, requested order, for the given supply pack type
/datum/controller/supply/proc/create_order(var/datum/supply_pack/S, var/mob/user, var/reason, var/bank_id, var/dept_card_uid)
	var/datum/supply_order/new_order = new()
	var/datum/supply_order/adm_order = new() // Admin-recorded order must be a separate copy in memory, or user-made edits will corrupt it

	var/idname = "*None Provided*"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		idname = H.get_authentification_name()
	else if(issilicon(user))
		idname = user.real_name



	new_order.ordernum = ++ordernum // Ordernum is used to track the order between the playerside list of orders and the adminside list
	new_order.index = new_order.ordernum // Index can be fabricated, or falsified. Ordernum is a permanent marker used to track the order
	new_order.object = S
	new_order.name = S.name
	new_order.cost = S.cost
	new_order.ordered_by = idname
	new_order.comment = reason
	new_order.ordered_at = stationdate2text() + " - " + stationtime2text()
	new_order.status = SUP_ORDER_REQUESTED
	new_order.bank_id = bank_id

	adm_order.ordernum = new_order.ordernum
	adm_order.index = new_order.index
	adm_order.object = new_order.object
	adm_order.name = new_order.name
	adm_order.cost = new_order.cost
	adm_order.ordered_by = new_order.ordered_by
	adm_order.comment = new_order.comment
	adm_order.ordered_at = new_order.ordered_at
	adm_order.status = new_order.status
	adm_order.status = new_order.bank_id

	if(dept_card_uid)
		new_order.dept_uid = dept_card_uid
		adm_order.dept_uid = dept_card_uid

	order_history += new_order
	adm_order_history += adm_order

	return new_order

// Will delete the specified export receipt from the user-side list
/datum/controller/supply/proc/delete_export(var/datum/exported_crate/E, var/mob/user)
	// Making sure they know what they're doing
	if(alert(user, "Are you sure you want to delete this record?", "Delete Record","No","Yes") == "Yes")
		if(alert(user, "Are you really sure? There is no way to recover the receipt once deleted.", "Delete Record", "No", "Yes") == "Yes")
			log_admin("[key_name(user)] has deleted export receipt \ref[E] [E] from the user-side export history.")
			supply_controller.exported_crates -= E
	return

// Will add an item entry to the specified export receipt on the user-side list
/datum/controller/supply/proc/add_export_item(var/datum/exported_crate/E, var/mob/user)
	var/new_name = input(user, "Name", "Please enter the name of the item.") as null|text
	if(!new_name)
		return

	var/new_quantity = input(user, "Name", "Please enter the quantity of the item.") as null|num
	if(!new_quantity)
		return

	var/new_value = input(user, "Name", "Please enter the value of the item.") as null|num
	if(!new_value)
		return

	E.contents[++E.contents.len] = list(
			"object" = new_name,
			"quantity" = new_quantity,
			"value" = new_value
		)
