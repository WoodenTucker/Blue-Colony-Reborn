/obj/structure/closet/secure_closet/guncabinet
	name = "gun cabinet"
	req_one_access = list(access_armory)
	icon = 'icons/obj/guncabinet.dmi'
	icon_state = "base"
	icon_off ="base"
	icon_broken ="base"
	icon_locked ="base"
	icon_closed ="base"
	icon_opened = "base"

/obj/structure/closet/secure_closet/guncabinet/New()
	..()
	update_icon()

/obj/structure/closet/secure_closet/guncabinet/toggle()
	..()
	update_icon()

/obj/structure/closet/secure_closet/guncabinet/update_icon()
	overlays.Cut()
	if(opened)
		overlays += icon(icon,"door_open")
	else
		var/lazors = 0
		var/shottas = 0
		for (var/obj/item/weapon/gun/G in contents)
			if (istype(G, /obj/item/weapon/gun/energy))
				lazors++
			if (istype(G, /obj/item/weapon/gun/projectile/))
				shottas++
		for (var/i = 0 to 2)
			if(lazors || shottas) // only make icons if we have one of the two types.
				var/image/gun = image(icon(src.icon))
				if (lazors > shottas)
					lazors--
					gun.icon_state = "laser"
				else if (shottas)
					shottas--
					gun.icon_state = "projectile"
				gun.pixel_x = i*4
				overlays += gun

		overlays += icon(src.icon, "door")

		if(welded)
			overlays += icon(src.icon,"welded")

		if(broken)
			overlays += icon(src.icon,"broken")
		else if (locked)
			overlays += icon(src.icon,"locked")
		else
			overlays += icon(src.icon,"open")


/obj/structure/closet/secure_closet/guncabinet/bodyguard
	name = "bodyguard's gun cabinet"
	req_access = list(access_bodyguard)
	req_one_access = list(access_bodyguard)
	dont_save = TRUE

	New()
		..()
		var/list/items_to_spawn = list(
		 	/obj/item/clothing/glasses/sunglasses/sechud,
			/obj/item/taperoll/police,
		 	/obj/item/weapon/reagent_containers/spray/pepper,
		 	/obj/item/weapon/storage/belt/security,
		 	/obj/item/device/flash,
		 	/obj/item/weapon/melee/baton/loaded,
		 	/obj/item/weapon/gun/energy/gun,
		 	/obj/item/weapon/melee/telebaton,
		 	/obj/item/clothing/under/suit_jacket/charcoal,
		 	/obj/item/clothing/under/suit_jacket/female/skirt,
		 	/obj/item/clothing/accessory/holster/hip,
		 	/obj/item/weapon/handcuffs,
		 	/obj/item/weapon/handcuffs
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

