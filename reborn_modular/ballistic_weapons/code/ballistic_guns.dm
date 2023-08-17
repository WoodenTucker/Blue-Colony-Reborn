/* /obj/item/weapon/gun/ballistic
	name = "gun"
	desc = "Its a gun. It's pretty terrible, though."
	icon = 'reborn_modular/ballistic_weapons/icon/guns.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi',
		)
	icon_state = "detective"
	item_state = "gun"
	flags =  CONDUCT
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	w_class = ITEMSIZE_NORMAL
	throwforce = 5
	throw_speed = 4
	throw_range = 5
	force = 5
	preserve_item = 1
	origin_tech = list(TECH_COMBAT = 1)
	attack_verb = list("struck", "hit", "bashed")
	zoomdevicename = "scope"

	automatic = 1
	burst = 1
	fire_delay = 6 	//delay after shooting before the gun can be used again
	burst_delay = 2	//delay between shots, if firing in bursts
	move_delay = 1
	fire_sound = 'sound/weapons/gunshot/gunshot1.ogg'
	fire_sound_text = "gunshot"
	fire_anim = null
	recoil = 0		//screen shake
	silenced = 0
	muzzle_flash = 3
	accuracy = 0   //Accuracy is measured in percents. +15 accuracy means that everything is effectively one tile closer for the purpose of miss chance, -15 means the opposite. launchers are not supported, at the moment.
	scoped_accuracy = null
	list/burst_accuracy = list(0) //allows for different accuracies for each shot in a burst. Applied on top of accuracy
	list/dispersion = list(0)
	mode_name = null
	projectile_type = /obj/item/projectile	//On ballistics, only used to check for the cham gun

	wielded_item_state
	one_handed_penalty = 0 // Penalty applied if someone fires a two-handed gun with one hand.
	obj/screen/auto_target/auto_target
	shooting = 0
	next_fire_time = 0

	sel_mode = 1 //index of the currently selected mode
	list/firemodes = list()

	//aiming system stuff
	keep_aim = 1 	//1 for keep shooting until aim is lowered
						//0 for one bullet after tarrget moves and aim is lowered
	multi_aim = 0 //Used to determine if you can target multiple people.
	tmp/list/mob/living/aim_targets //List of who yer targeting.
	tmp/mob/living/last_moved_mob //Used to fire faster at more than one person.
	tmp/told_cant_shoot = 0 //So that it doesn't spam them with the fact they cannot hit them.
	tmp/lock_time = -100

	dna_lock = 0				//whether or not the gun is locked to dna
	obj/item/dnalockingchip/attached_lock

	last_shot = 0			//records the last shot fired
	drop_sound = 'sound/items/drop/gun.ogg'

	usage_buffer = 5 // each gun is different and will have a variation of this amount on how many uses it has.
	uses = 100 // uses until this gun finally kicks the can


/obj/item/weapon/gun/ballistic/mp5
	name = "MP5"
	desc = "Its a gun. It's pretty terrible, though."
	icon = 'reborn_modular/ballistic_weapons/icon/guns.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi',
		)
	icon_state = "mp5"
	item_state = "gun"
	flags =  CONDUCT
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	w_class = ITEMSIZE_NORMAL
	throwforce = 5
	throw_speed = 4
	throw_range = 5
	force = 5
	preserve_item = 1
	origin_tech = list(TECH_COMBAT = 1)
	attack_verb = list("struck", "hit", "bashed")
	zoomdevicename = "scope"

	automatic = 1
	burst = 0
	fire_delay = 4 	//delay after shooting before the gun can be used again
	burst_delay = 2	//delay between shots, if firing in bursts
	move_delay = 0
	fire_sound = 'sound/weapons/gunshot/gunshot_smg.ogg'
	fire_sound_text = "gunshot"
	fire_anim = null
	recoil = 0		//screen shake
	silenced = 0
	muzzle_flash = 3
	accuracy = 0   //Accuracy is measured in percents. +15 accuracy means that everything is effectively one tile closer for the purpose of miss chance, -15 means the opposite. launchers are not supported, at the moment.
	scoped_accuracy = null
	list/burst_accuracy = list(0) //allows for different accuracies for each shot in a burst. Applied on top of accuracy
	list/dispersion = list(0)
	mode_name = null
	projectile_type = /obj/item/projectile	//On ballistics, only used to check for the cham gun

	one_handed_penalty = 0 // Penalty applied if someone fires a two-handed gun with one hand.
	obj/screen/auto_target/auto_target
	shooting = 0
	next_fire_time = 0

	sel_mode = 1 //index of the currently selected mode
	list/firemodes = list()

	//aiming system stuff
	keep_aim = 1 	//1 for keep shooting until aim is lowered
						//0 for one bullet after tarrget moves and aim is lowered
	multi_aim = 0 //Used to determine if you can target multiple people.

	dna_lock = 0				//whether or not the gun is locked to dna
	obj/item/dnalockingchip/attached_lock

	last_shot = 0			//records the last shot fired
	drop_sound = 'sound/items/drop/gun.ogg'

/obj/item/weapon/gun/ballistic/spas12
	name = "SPAS12"
	desc = "Not in the face, so as not to spoil the funeral"
	icon = 'reborn_modular/ballistic_weapons/icon/guns.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi',
		)
	icon_state = "spas12"
	item_state = "gun"
	flags =  CONDUCT
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	w_class = ITEMSIZE_NORMAL
	throwforce = 5
	throw_speed = 4
	throw_range = 5
	force = 8
	preserve_item = 1
	origin_tech = list(TECH_COMBAT = 1)
	attack_verb = list("struck", "hit", "bashed")
	zoomdevicename = "scope"

	automatic = 1
	burst = 0
	fire_delay = 2 	//delay after shooting before the gun can be used again
	burst_delay = 2	//delay between shots, if firing in bursts
	move_delay = 1
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'
	fire_sound_text = "gunshot"
	fire_anim = null
	recoil = 1		//screen shake
	silenced = 0
	muzzle_flash = 3
	accuracy = 0   //Accuracy is measured in percents. +15 accuracy means that everything is effectively one tile closer for the purpose of miss chance, -15 means the opposite. launchers are not supported, at the moment.
	scoped_accuracy = null
	list/burst_accuracy = list(0) //allows for different accuracies for each shot in a burst. Applied on top of accuracy
	list/dispersion = list(0)
	mode_name = null
	projectile_type = /obj/item/projectile	//On ballistics, only used to check for the cham gun

	one_handed_penalty = 0 // Penalty applied if someone fires a two-handed gun with one hand.
	obj/screen/auto_target/auto_target
	shooting = 0
	next_fire_time = 0

	sel_mode = 1 //index of the currently selected mode
	list/firemodes = list()

	//aiming system stuff
	keep_aim = 1 	//1 for keep shooting until aim is lowered
						//0 for one bullet after tarrget moves and aim is lowered
	multi_aim = 0 //Used to determine if you can target multiple people.

	dna_lock = 0				//whether or not the gun is locked to dna
	obj/item/dnalockingchip/attached_lock

	last_shot = 0			//records the last shot fired
	drop_sound = 'sound/items/drop/gun.ogg'