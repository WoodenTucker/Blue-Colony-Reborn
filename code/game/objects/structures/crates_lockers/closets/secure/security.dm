/obj/structure/closet/secure_closet/captains
	name = "mayor's locker"
	req_access = list(access_captain)
	icon_state = "capsecure1"
	icon_closed = "capsecure"
	icon_locked = "capsecure1"
	icon_opened = "capsecureopen"
	icon_broken = "capsecurebroken"
	icon_off = "capsecureoff"

	New()
		..()
		var/list/items_to_spawn = list(
		 	/obj/item/weapon/storage/backpack/dufflebag/captain,
			/obj/item/clothing/head/helmet,
			/obj/item/clothing/suit/storage/vest,
			/obj/item/weapon/cartridge/captain,
			/obj/item/weapon/storage/lockbox/medal,
			/obj/item/device/radio/headset/heads/captain,
			/obj/item/device/radio/headset/heads/captain/alt,
			/obj/item/weapon/gun/energy/gun,
			/obj/item/weapon/melee/telebaton,
			/obj/item/device/flash,
			/obj/item/weapon/storage/box/ids
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1



/obj/structure/closet/secure_closet/hop
	name = "city clerk's locker"
	req_access = list(access_hop)
	icon_state = "hopsecure1"
	icon_closed = "hopsecure"
	icon_locked = "hopsecure1"
	icon_opened = "hopsecureopen"
	icon_broken = "hopsecurebroken"
	icon_off = "hopsecureoff"

	New()
		..()
		var/list/items_to_spawn = list(
		 	/obj/item/clothing/suit/storage/vest,
			/obj/item/clothing/head/helmet,
			/obj/item/weapon/cartridge/hop,
			/obj/item/device/radio/headset/heads/hop,
			/obj/item/device/radio/headset/heads/hop/alt,
			/obj/item/weapon/storage/box/ids,
			/obj/item/weapon/storage/box/ids,
			/obj/item/weapon/gun/energy/gun,
			/obj/item/weapon/gun/projectile/sec/flash,
			/obj/item/device/flash,
			/obj/item/weapon/storage/box/gun_permits,
			/obj/item/weapon/storage/box/social_service_cards,
			/obj/item/weapon/storage/box/social_service_cards,
			/obj/item/weapon/storage/lockbox/passport
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/hop2
	name = "city clerk's attire"
	req_access = list(access_hop)
	icon_state = "hopsecure1"
	icon_closed = "hopsecure"
	icon_locked = "hopsecure1"
	icon_opened = "hopsecureopen"
	icon_broken = "hopsecurebroken"
	icon_off = "hopsecureoff"

	New()
		..()
		var/list/items_to_spawn = list(
			 /obj/item/clothing/under/rank/head_of_personnel,
			 /obj/item/clothing/under/dress/dress_hop,
			 /obj/item/clothing/under/dress/dress_hr,
			 /obj/item/clothing/under/lawyer/female,
			 /obj/item/clothing/under/lawyer/black,
			 /obj/item/clothing/under/lawyer/black/skirt,
			 /obj/item/clothing/under/lawyer/red,
			 /obj/item/clothing/under/lawyer/red/skirt,
			 /obj/item/clothing/under/lawyer/oldman,
			 /obj/item/clothing/shoes/brown,
			 /obj/item/clothing/shoes/black,
			 /obj/item/clothing/shoes/leather,
			 /obj/item/clothing/shoes/white,
			 /obj/item/clothing/under/rank/head_of_personnel_whimsy,
			 /obj/item/clothing/head/caphat/hop,
			 /obj/item/clothing/under/gimmick/rank/head_of_personnel/suit,
			 /obj/item/clothing/under/gimmick/rank/head_of_personnel/suit/skirt,
			 /obj/item/clothing/glasses/sunglasses
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1



/obj/structure/closet/secure_closet/hos
	name = "chief of police's locker"
	req_access = list(access_hos)
	icon_state = "hossecure1"
	icon_closed = "hossecure"
	icon_locked = "hossecure1"
	icon_opened = "hossecureopen"
	icon_broken = "hossecurebroken"
	icon_off = "hossecureoff"
	storage_capacity = 2.5 * MOB_MEDIUM

	New()
		..()
		
		if(prob(50))
			new /obj/item/weapon/storage/backpack/security{dont_save = 1}(src)
		else
			new /obj/item/weapon/storage/backpack/satchel/sec{dont_save = 1}(src)
		if(prob(50))
			new /obj/item/weapon/storage/backpack/dufflebag/sec{dont_save = 1}(src)
			
		var/list/items_to_spawn = list(
			 /obj/item/clothing/head/helmet/police,
			 /obj/item/clothing/under/rank/policechiefalt,
			 /obj/item/clothing/head/police/policechiefcap,
			 /obj/item/clothing/head/soft/policechief,
			 /obj/item/clothing/head/beret/policegold,
			 /obj/item/clothing/suit/armor/pcarrier/medium/police,	
			 /obj/item/clothing/head/helmet/dermal,
			 /obj/item/clothing/suit/storage/toggle/policejacket,
			 /obj/item/weapon/cartridge/hos,
			 /obj/item/weapon/gun/projectile/police,
			 /obj/item/device/radio/headset/heads/hos,
			 /obj/item/device/radio/headset/heads/hos/alt,
			 /obj/item/clothing/glasses/sunglasses/sechud,
			 /obj/item/taperoll/police,
			 /obj/item/weapon/bodycam,
			 /obj/item/weapon/shield/riot,
			 /obj/item/weapon/shield/riot/tele,
			 /obj/item/weapon/storage/box/holobadge/hos,
			 /obj/item/clothing/accessory/badge/holo/hos,
			 /obj/item/weapon/reagent_containers/spray/pepper,
			 /obj/item/weapon/storage/belt/security,
			 /obj/item/device/flash,
			 /obj/item/weapon/melee/baton/loaded,
			 /obj/item/weapon/gun/energy/gun,
			 /obj/item/weapon/cell/device/weapon,
			 /obj/item/clothing/accessory/holster/waist,
			 /obj/item/weapon/melee/telebaton,
			 /obj/item/clothing/head/beret/sec/corporate/hos,
			 /obj/item/clothing/suit/storage/hooded/wintercoat/security,
			 /obj/item/clothing/shoes/boots/winter/security,
			 /obj/item/device/flashlight/maglight,
			 /obj/item/weapon/stamp/hos
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/warden
	name = "prison warden's locker"
	req_access = list(access_armory)
	icon_state = "wardensecure1"
	icon_closed = "wardensecure"
	icon_locked = "wardensecure1"
	icon_opened = "wardensecureopen"
	icon_broken = "wardensecurebroken"
	icon_off = "wardensecureoff"

	New()
		..()
		if(prob(50))
			new /obj/item/weapon/storage/backpack/security(src)
		else
			new /obj/item/weapon/storage/backpack/satchel/sec(src)
		if(prob(50))
			new	/obj/item/weapon/storage/backpack/dufflebag/sec(src)
			
		var/list/items_to_spawn = list(
			/obj/item/clothing/suit/armor/pcarrier/medium/police,
			/obj/item/clothing/head/beret/policegold,
			/obj/item/clothing/head/soft/policewarden,
			/obj/item/clothing/head/police/policewardencap,
			/obj/item/clothing/under/rank/wardenalt,
			/obj/item/clothing/suit/storage/vest/wardencoat,
			/obj/item/clothing/suit/storage/vest/wardencoat/alt,
			/obj/item/clothing/suit/storage/toggle/policejacket,
			/obj/item/clothing/head/helmet/dermal,
			/obj/item/clothing/head/helmet/police,
			/obj/item/weapon/cartridge/security,
			/obj/item/device/radio/headset/headset_sec,
			/obj/item/device/radio/headset/headset_sec/alt,
			/obj/item/clothing/glasses/sunglasses/sechud,
			/obj/item/taperoll/police,
			/obj/item/weapon/bodycam,
			/obj/item/clothing/accessory/badge/holo/warden,
			/obj/item/weapon/storage/box/flashbangs,
			/obj/item/weapon/storage/belt/security,
			/obj/item/weapon/reagent_containers/spray/pepper,
			/obj/item/weapon/melee/baton/loaded,
			/obj/item/weapon/gun/energy/gun,
			/obj/item/weapon/cell/device/weapon,
			/obj/item/weapon/storage/box/holobadge,
			/obj/item/clothing/shoes/boots/winter/security,
			/obj/item/device/flashlight/maglight,
			/obj/item/device/megaphone,
			/obj/item/clothing/mask/gas/half,
			/obj/item/weapon/grenade/flashbang/clusterbang/geminus,
			/obj/item/weapon/grenade/flashbang/clusterbang/geminus
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1




/obj/structure/closet/secure_closet/security
	name = "police officer's locker"
	req_access = list(access_brig)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_broken = "secbroken"
	icon_off = "secoff"

	New()
		..()
		if(prob(50))
			new /obj/item/weapon/storage/backpack/security(src)
		else
			new /obj/item/weapon/storage/backpack/satchel/sec(src)
		if(prob(50))
			new /obj/item/weapon/storage/backpack/dufflebag/sec(src)
		if(prob(50))
			new /obj/item/clothing/accessory/badge/holo(src)
		else
			new /obj/item/clothing/accessory/badge/holo/cord(src)
			
		var/list/items_to_spawn = list(
			 /obj/item/clothing/suit/storage/vest/officer,
			 /obj/item/clothing/head/helmet,
			 /obj/item/weapon/cartridge/security,
			 /obj/item/device/radio/headset/headset_sec,
			 /obj/item/device/radio/headset/headset_sec/alt,
			 /obj/item/weapon/storage/belt/security,
			 /obj/item/device/flash,
			 /obj/item/weapon/reagent_containers/spray/pepper,
	// 		 /obj/item/weapon/grenade/flashbang, // Get it from vending or armory
			 /obj/item/weapon/melee/baton/loaded,
			 /obj/item/clothing/glasses/sunglasses/sechud,
			 /obj/item/taperoll/police,
			 /obj/item/device/hailer,
			 /obj/item/weapon/bodycam,
			 /obj/item/device/flashlight/flare,
			 /obj/item/clothing/accessory/storage/black_vest,
			 /obj/item/clothing/head/soft/sec,
			 /obj/item/clothing/head/soft/sec/corp,
			 /obj/item/clothing/under/rank/security/corp,
	//		 /obj/item/weapon/gun/projectile/police, //added to armory instead.
	//		 /obj/item/ammo_magazine/m45,
	//		 /obj/item/ammo_magazine/m45,
			 /obj/item/weapon/cell/device/weapon,
			 /obj/item/clothing/suit/storage/hooded/wintercoat/security,
			 /obj/item/clothing/shoes/boots/winter/security,
			 /obj/item/device/flashlight/maglight,
			 /obj/item/weapon/gun/energy/taser,
			 /obj/item/device/holowarrant
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1


/obj/structure/closet/secure_closet/security/cargo

	New()
		..()

		var/list/items_to_spawn = list(
			/obj/item/clothing/accessory/armband/cargo,
			/obj/item/device/encryptionkey/headset_cargo
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/security/engine

	New()
		..()

		var/list/items_to_spawn = list(
			/obj/item/clothing/accessory/armband/engine
			/obj/item/device/encryptionkey/headset_eng
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/security/science

	New()
		..()

		var/list/items_to_spawn = list(
			/obj/item/clothing/accessory/armband/science
			/obj/item/device/encryptionkey/headset_sci
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/security/med

	New()
		..()

		var/list/items_to_spawn = list(
			/obj/item/clothing/accessory/armband/medblue
			/obj/item/device/encryptionkey/headset_med
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1


/obj/structure/closet/secure_closet/detective
	name = "detective's cabinet"
	req_access = list(access_forensics_lockers)
	icon_state = "cabinetdetective_locked"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_opened = "cabinetdetective_open"
	icon_broken = "cabinetdetective_broken"
	icon_off = "cabinetdetective_broken"

	New()
		..()

		var/list/items_to_spawn = list(
		 	/obj/item/clothing/accessory/badge/holo/detective,
			/obj/item/clothing/gloves/black,
			/obj/item/weapon/gun/projectile/revolver/deckard/rubber,
		 	/obj/item/ammo_magazine/s38,
		 	/obj/item/ammo_magazine/s38,
		 	/obj/item/weapon/storage/belt/detective,
		 	/obj/item/weapon/storage/box/evidence,
		 	/obj/item/device/radio/headset/headset_sec,
		 	/obj/item/device/radio/headset/headset_sec/alt,
		 	/obj/item/clothing/suit/storage/vest/detective,
		 	/obj/item/taperoll/police,
		 	/obj/item/clothing/accessory/holster/armpit,
		 	/obj/item/device/flashlight/maglight,
		 	/obj/item/weapon/reagent_containers/food/drinks/flask/detflask,
		 	/obj/item/weapon/storage/briefcase/crimekit,
			/obj/item/weapon/storage/box/csi_markers,
		 	/obj/item/device/taperecorder,
		 	/obj/item/device/tape/random,
		 	/obj/item/device/tape/random
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/detective/update_icon()
	if(broken)
		icon_state = icon_broken
	else
		if(!opened)
			if(locked)
				icon_state = icon_locked
			else
				icon_state = icon_closed
		else
			icon_state = icon_opened

/obj/structure/closet/secure_closet/injection
	name = "lethal injections locker"
	req_access = list(access_captain)

	New()
		..()

		var/list/items_to_spawn = list(
			/obj/item/weapon/reagent_containers/syringe/ld50_syringe/choral(src)
			/obj/item/weapon/reagent_containers/syringe/ld50_syringe/choral(src)
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1




/obj/structure/closet/secure_closet/brig
	name = "brig locker"
	req_access = list(access_brig)
	anchored = 1
	var/id = null

	New()
		..()

		var/list/items_to_spawn = list(
			/obj/item/clothing/under/color/orange
			/obj/item/clothing/shoes/orange
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1



/obj/structure/closet/secure_closet/courtroom
	name = "courtroom locker"
	req_access = list(access_lawyer)

	New()
		..()

		var/list/items_to_spawn = list(
			 /obj/item/clothing/shoes/brown,
			 /obj/item/weapon/paper/Court,
			 /obj/item/weapon/paper/Court,
			 /obj/item/weapon/paper/Court,
			 /obj/item/weapon/pen,
			 /obj/item/clothing/suit/judgerobe,
			 /obj/item/clothing/head/powdered_wig,
			 /obj/item/weapon/storage/briefcase
		)
		for(var/item_type in items_to_spawn)
			var/obj/item/I = new item_type(src)
			I.dont_save = 1

/obj/structure/closet/secure_closet/wall
	name = "wall locker"
	req_access = list(access_security)
	icon_state = "wall-locker1"
	density = 1
	icon_closed = "wall-locker"
	icon_locked = "wall-locker1"
	icon_opened = "wall-lockeropen"
	icon_broken = "wall-lockerbroken"
	icon_off = "wall-lockeroff"

	//too small to put a man in
	large = 0

/obj/structure/closet/secure_closet/wall/update_icon()
	if(broken)
		icon_state = icon_broken
	else
		if(!opened)
			if(locked)
				icon_state = icon_locked
			else
				icon_state = icon_closed
		else
			icon_state = icon_opened
