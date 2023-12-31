/obj/item/weapon/gun/energy/ionrifle
	name = "ion rifle"
	desc = "The NT Mk60 EW Halicon is a man portable anti-armor weapon designed to disable mechanical threats, produced by NT. Not the best of its type."
	icon_state = "ionrifle"
	item_state = "ionrifle"
	wielded_item_state = "ionrifle-wielded"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 4)
	w_class = ITEMSIZE_LARGE
	force = 10
	flags =  CONDUCT
	slot_flags = SLOT_BACK
	projectile_type = /obj/item/projectile/ion

/obj/item/weapon/gun/energy/ionrifle/emp_act(severity)
	..(max(severity, 4)) //so it doesn't EMP itself, I guess

/obj/item/weapon/gun/energy/ionrifle/pistol
	name = "ion pistol"
	desc = "The NT Mk63 EW Pan is a man portable anti-armor weapon designed to disable mechanical threats, produced by NT. This model sacrifices capacity for portability."
	icon_state = "ionpistol"
	item_state = null
	w_class = ITEMSIZE_NORMAL
	force = 5
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	charge_cost = 480
	projectile_type = /obj/item/projectile/ion/pistol

/obj/item/weapon/gun/energy/phasegun
	name = "phase pistol"
	desc = "The NT Mk26 EW Apollo is an energy handgun, specifically designed for use against wildlife."
	icon_state = "phase"
	item_state = "taser"	//I don't have an in-hand sprite, taser will be fine
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 3, TECH_COMBAT = 4)
	charge_cost = 300
	projectile_type = /obj/item/projectile/energy/phase

/obj/item/weapon/gun/energy/decloner
	name = "biological demolecularisor"
	desc = "A gun that discharges high amounts of controlled radiation to slowly break a target into component elements."
	icon_state = "decloner"
	item_state = "decloner"
	fire_sound = 'sound/weapons/pulse3.ogg'
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4, TECH_POWER = 3)
	projectile_type = /obj/item/projectile/energy/declone

/obj/item/weapon/gun/energy/floragun
	name = "floral somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells."
	icon_state = "floramut100"
	item_state = "floramut"
	fire_sound = 'sound/effects/stealthoff.ogg'
	projectile_type = /obj/item/projectile/energy/floramut
	origin_tech = list(TECH_MATERIAL = 2, TECH_BIO = 3, TECH_POWER = 3)
	modifystate = "floramut"
	cell_type = /obj/item/weapon/cell/device/weapon/recharge
	battery_lock = 1
	var/decl/plantgene/gene = null

	uses = 1000

	firemodes = list(
		list(mode_name="induce mutations", projectile_type=/obj/item/projectile/energy/floramut, modifystate="floramut"),
		list(mode_name="increase yield", projectile_type=/obj/item/projectile/energy/florayield, modifystate="florayield"),
		list(mode_name="induce specific mutations", projectile_type=/obj/item/projectile/energy/floramut/gene, modifystate="floramut"),
		)

/obj/item/weapon/gun/energy/floragun/afterattack(obj/target, mob/user, adjacent_flag)
	//allow shooting into adjacent hydrotrays regardless of intent
	if(adjacent_flag && istype(target,/obj/machinery/portable_atmospherics/hydroponics))
		user.visible_message("<span class='danger'>\The [user] fires \the [src] into \the [target]!</span>")
		Fire(target,user)
		return
	..()

/obj/item/weapon/gun/energy/floragun/verb/select_gene()
	set name = "Select Gene"
	set category = "Object"
	set src in view(1)

	var/genemask = input("Choose a gene to modify.") as null|anything in plant_controller.plant_gene_datums

	if(!genemask)
		return

	gene = plant_controller.plant_gene_datums[genemask]

	to_chat(usr, "<span class='info'>You set the [src]'s targeted genetic area to [genemask].</span>")

	return

/obj/item/weapon/gun/energy/floragun/consume_next_projectile()
	. = ..()
	var/obj/item/projectile/energy/floramut/gene/G = .
	if(istype(G))
		G.gene = gene

/obj/item/weapon/gun/energy/meteorgun
	name = "meteor gun"
	desc = "For the love of god, make sure you're aiming this the right way!"
	icon_state = "riotgun"
	item_state = "c20r"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEMSIZE_LARGE
	projectile_type = /obj/item/projectile/meteor
	cell_type = /obj/item/weapon/cell/potato
	charge_cost = 100
	self_recharge = 1
	recharge_time = 5 //Time it takes for shots to recharge (in ticks)
	charge_meter = 0

/obj/item/weapon/gun/energy/meteorgun/pen
	name = "meteor pen"
	desc = "The pen is mightier than the sword."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "pen"
	item_state = "pen"
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_BELT


/obj/item/weapon/gun/energy/mindflayer
	name = "mind flayer"
	desc = "A custom-built weapon of some kind."
	icon_state = "xray"
	projectile_type = /obj/item/projectile/beam/mindflayer
	fire_sound = 'sound/weapons/Laser.ogg'

/obj/item/weapon/gun/energy/toxgun
	name = "phoron pistol"
	desc = "A specialized firearm designed to fire lethal bolts of phoron."
	icon_state = "toxgun"
	fire_sound = 'sound/effects/stealthoff.ogg'
	w_class = ITEMSIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_PHORON = 4)
	projectile_type = /obj/item/projectile/energy/phoron

/* Staves */

/obj/item/weapon/gun/energy/staff
	name = "staff of change"
	desc = "An artifact that spits bolts of coruscating energy which cause the target's very form to reshape itself."
	icon = 'icons/obj/gun.dmi'
	item_icons = null
	icon_state = "staffofchange"
	fire_sound = 'sound/weapons/emitter.ogg'
	flags =  CONDUCT
	slot_flags = SLOT_BACK
	w_class = ITEMSIZE_LARGE
	charge_cost = 480
	projectile_type = /obj/item/projectile/change
	origin_tech = null
	cell_type = /obj/item/weapon/cell/device/weapon/recharge
	battery_lock = 1
	charge_meter = 0

	uses = 500

/obj/item/weapon/gun/energy/staff/special_check(var/mob/user)
	if((user.mind && !wizards.is_antagonist(user.mind)))
		to_chat(usr, "<span class='warning'>You focus your mind on \the [src], but nothing happens!</span>")
		return 0

	return ..()

/obj/item/weapon/gun/energy/staff/handle_click_empty(mob/user = null)
	if (user)
		user.visible_message("*fizzle*", "<span class='danger'>*fizzle*</span>")
	else
		src.visible_message("*fizzle*")
	playsound(src.loc, 'sound/effects/sparks1.ogg', 100, 1)

/*
/obj/item/weapon/gun/energy/staff/animate
	name = "staff of animation"
	desc = "An artifact that spits bolts of life force, which causes objects which are hit by it to animate and come to life! This magic doesn't affect machines."
	projectile_type = /obj/item/projectile/animate
	charge_cost = 240
*/

obj/item/weapon/gun/energy/staff/focus
	name = "mental focus"
	desc = "An artifact that channels the will of the user into destructive bolts of force. If you aren't careful with it, you might poke someone's brain out."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "focus"
	slot_flags = SLOT_BACK
	projectile_type = /obj/item/projectile/forcebolt
	/*
	attack_self(mob/living/user as mob)
		if(projectile_type == "/obj/item/projectile/forcebolt")
			charge_cost = 400
			to_chat(user, "<span class='warning'>The [src.name] will now strike a small area.</span>")
			projectile_type = "/obj/item/projectile/forcebolt/strong"
		else
			charge_cost = 200
			to_chat(user, "<span class='warning'>The [src.name] will now strike only a single person.</span>")
			projectile_type = "/obj/item/projectile/forcebolt"
	*/

/obj/item/weapon/gun/energy/dakkalaser
	name = "suppression gun"
	desc = "A massive weapon designed to pressure the opposition by raining down a torrent of energy pellets."
	icon_state = "dakkalaser"
	item_state = "dakkalaser"
	fire_sound = 'sound/weapons/Laser.ogg'
	w_class = ITEMSIZE_HUGE
	charge_cost = 24 // 100 shots, it's a spray and pray (to RNGesus) weapon.
	projectile_type = /obj/item/projectile/energy/blue_pellet
	cell_type = /obj/item/weapon/cell/device/weapon/recharge
	battery_lock = 1
	accuracy = 75 // Suppressive weapons don't work too well if there's no risk of being hit.
	burst_delay = 1 // Burst faster than average.
	origin_tech = list(TECH_COMBAT = 6, TECH_MAGNET = 6, TECH_ILLEGAL = 6)

	firemodes = list(
		list(mode_name="single shot", burst = 1, burst_accuracy = list(75), dispersion = list(0), charge_cost = 24),
		list(mode_name="five shot burst", burst = 5, burst_accuracy = list(75,75,75,75,75), dispersion = list(1,1,1,1,1)),
		list(mode_name="ten shot burst", burst = 10, burst_accuracy = list(75,75,75,75,75,75,75,75,75,75), dispersion = list(2,2,2,2,2,2,2,2,2,2)),
		)

/obj/item/weapon/gun/energy/service_weapon
	name = "service weapon"
	desc = "A mysterious firearm that can change forms at will."
	icon_state = "service_weapon"
	fire_sound = 'sound/weapons/gunshot/gunshot_light.ogg'
	force = 5
	slot_flags = SLOT_BELT
	origin_tech = list(TECH_ARCANE = 5, TECH_COMBAT = 7, TECH_MATERIAL = 7, TECH_BLUESPACE = 4)
	projectile_type = /obj/item/projectile/bullet/pistol/medium
	charge_cost = 80
	cell_type = /obj/item/weapon/cell/device/weapon/recharge/captain
	battery_lock = 1
	fire_delay = 5
	w_class = ITEMSIZE_NORMAL
	var/current_form = "Grip"

/obj/item/weapon/gun/energy/service_weapon/update_icon() //override due to this being an energy weapon. we don't want any pesky partial charge states.

/obj/item/weapon/gun/energy/service_weapon/verb/morph_form()
	set name = "Shift Service Weapon Form"
	set category = "Object"
	set desc = "Exploit the non-euclidean nature of the Service Weapon to change its weapon form."
	set src in usr

	transmogrify(current_form)
	usr.visible_message("<span class='danger'>[usr]'s [src] morphs into a new form!</span>", \
			"<span class='danger'>Your [src] shifts into its [current_form] form.</span>")

/obj/item/weapon/gun/energy/service_weapon/proc/transmogrify(var/form)
	switch(form)
		if("Grip") //Transition to shotgun mode - Shatter
			desc = "A mysterious firearm that can change forms at will. It is currently in its 'Shatter' form."
			icon_state = "service_weapon_shatter"
			projectile_type = /obj/item/projectile/bullet/pellet/shotgun
			fire_delay = 10
			charge_cost = 160
			fire_sound = 'sound/weapons/gunshot/shotgun.ogg'
			current_form = "Shatter"
			return
		if("Shatter") //Transition to smg mode - Spin
			desc = "A mysterious firearm that can change forms at will. It is currently in its 'Spin' form."
			icon_state = "service_weapon_spin"
			projectile_type = /obj/item/projectile/bullet/pistol
			fire_delay = 2
			accuracy = -15 //rapid fire but inaccurate
			charge_cost = 48
			burst = 3
			burst_accuracy = list(0,-5,-10,-15,-15)
			dispersion = list(1,1,1,1,1)
			fire_sound = 'sound/weapons/gunshot/gunshot_smg.ogg'
			current_form = "Spin"
			return
		if("Spin") //Transition to piercing mode - Pierce
			desc = "A mysterious firearm that can change forms at will. It is currently in its 'Pierce' form."
			icon_state = "service_weapon_pierce"
			fire_delay = 15
			burst = 1
			dispersion = list(0)
			accuracy = 0
			charge_cost = 480
			fire_sound = 'sound/weapons/gunshot/gunshot_strong.ogg'
			current_form = "Pierce"
			return
		if("Pierce")
			desc = "A mysterious firearm that can change forms at will. It is currently in its 'Grip' form."
			icon_state = "service_weapon"
			fire_sound = 'sound/weapons/gunshot/gunshot_light.ogg'
			charge_cost = 48
			fire_delay = 5
			projectile_type = /obj/item/projectile/bullet/pistol/medium
			current_form = "Grip"
			return
		else
			to_chat(usr, "<span class='warning'>UH OH! THIS SHOULDN'T HAVE HAPPENED! Report it here: https://github.com/GeneriedJenelle/The-World-Server-Redux/issues</span>")
			return "FAILED"
/*		if("Mjolnir")
		if("Excalibur")
		if("Varunastra")		*/
