/*
*	Here is where any supply packs
*	related to weapons live.
*/

/*

/datum/supply_pack/munitions
	group = "Munitions"
	spend_type = SPEND_WEAPONS

/datum/supply_pack/randomised/munitions
	group = "Munitions"
	spend_type = SPEND_WEAPONS

/datum/supply_pack/munitions/weapons
	name = "Weapons - Security basic equipment"
	contains = list(
			/obj/item/device/flash = 2,
			/obj/item/weapon/reagent_containers/spray/pepper = 2,
			/obj/item/weapon/melee/baton/loaded = 2,
			/obj/item/weapon/gun/energy/taser = 2,
			/obj/item/weapon/gun/projectile/colt/detective = 2,
			/obj/item/weapon/storage/box/flashbangs = 2
			)
	cost = 29500
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Security equipment crate"
	access = access_security

/datum/supply_pack/munitions/egunpistol
	name = "Weapons - Energy sidearms"
	contains = list(/obj/item/weapon/gun/energy/gun = 10)
	cost = 36000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Energy sidearms crate"
	access = access_security

/datum/supply_pack/munitions/flareguns
	name = "Weapons - Flare guns"
	contains = list(
			/obj/item/weapon/gun/projectile/sec/flash,
			/obj/item/ammo_magazine/m45/flash,
			/obj/item/weapon/gun/projectile/shotgun/doublebarrel/flare,
			/obj/item/weapon/storage/box/flashshells
			)
	cost = 9000
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "Flare gun crate"
	access = access_security

/datum/supply_pack/munitions/eweapons
	name = "Weapons - Experimental weapons crate"
	contains = list(
			/obj/item/weapon/gun/energy/xray = 2,
			/obj/item/weapon/shield/energy = 2)
	cost = 35000
	containertype = /obj/structure/closet/crate/secure/science
	containername = "Experimental weapons crate"
	access = access_armory

/datum/supply_pack/munitions/energyweapons
	name = "Weapons - Laser rifle crate"
	contains = list(/obj/item/weapon/gun/energy/laser = 10)
	cost = 45000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Energy weapons crate"
	access = access_armory

/datum/supply_pack/munitions/shotgun
	name = "Weapons - Shotgun crate"
	contains = list(
			/obj/item/weapon/storage/box/shotgunammo = 2,
			/obj/item/weapon/storage/box/shotgunshells = 2,
			/obj/item/weapon/gun/projectile/shotgun/doublebarrel = 5,
			/obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn = 5,
			/obj/item/weapon/gun/projectile/shotgun/pump/combat = 5
			)
	cost = 60000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Shotgun crate"
	access = access_armory

/datum/supply_pack/munitions/fourtyfive
	name = "Weapons - 45 crate"
	contains = list(
			/obj/item/weapon/gun/projectile/colt = 5,
			/obj/item/weapon/gun/projectile/sec = 5,
			/obj/item/weapon/gun/projectile/sec/wood = 5,
			/obj/item/weapon/gun/projectile/sec/flash = 5,
			)
	cost = 75000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "45 crate"
	access = access_armory

/datum/supply_pack/munitions/erifle
	name = "Weapons - Energy marksman"
	contains = list(/obj/item/weapon/gun/energy/sniperrifle = 5)
	cost = 50000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Energy marksman crate"
	access = access_armory

/datum/supply_pack/munitions/burstlaser
	name = "Weapons - Burst laser"
	contains = list(/obj/item/weapon/gun/energy/gun/burst = 5)
	cost = 75000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Burst laser crate"
	access = access_armory

/datum/supply_pack/munitions/ionweapons
	name = "Weapons - Electromagnetic Rifles"
	contains = list(
			/obj/item/weapon/gun/energy/ionrifle = 5,
			/obj/item/weapon/storage/box/empslite = 2
			)
	cost = 75000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Electromagnetic weapons crate"
	access = access_armory

/datum/supply_pack/munitions/ionpistols
	name = "Weapons - Electromagnetic pistols"
	contains = list(
			/obj/item/weapon/gun/energy/ionrifle/pistol = 5,
			/obj/item/weapon/storage/box/empslite = 2
			)
	cost = 50000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Electromagnetic weapons crate"
	access = access_armory

/datum/supply_pack/munitions/bsmg
	name = "Weapons - Ballistic SMGs"
	contains = list(/obj/item/weapon/gun/projectile/automatic/wt550 = 5)
	cost = 50000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Ballistic weapon crate"
	access = access_armory

/datum/supply_pack/munitions/brifle
	name = "Weapons - Ballistic Rifles"
	contains = list(/obj/item/weapon/gun/projectile/automatic/z8 = 5)
	cost = 75000
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "Ballistic weapon crate"
	access = access_armory

/datum/supply_pack/munitions/bolt_rifles_competitive
 	name = "Weapons - Competitive shooting rifles"
 	contains = list(
 			/obj/item/device/assembly/timer,
 			/obj/item/weapon/gun/projectile/shotgun/pump/rifle/practice = 2,
 			/obj/item/ammo_magazine/clip/c762/practice = 4,
 			/obj/item/target = 2,
 			/obj/item/target/alien = 2,
 			/obj/item/target/syndicate = 2
 			)
 	cost = 7000
 	containertype = /obj/structure/closet/crate/secure/weapon
 	containername = "Ballistic weapons crate"
 	access = access_security

/datum/supply_pack/munitions/shotgunammo
	name = "Ammunition - Shotgun shells"
	contains = list(
			/obj/item/weapon/storage/box/shotgunammo = 2,
			/obj/item/weapon/storage/box/shotgunshells = 2
			)
	cost = 100
	containertype = /obj/structure/closet/crate/secure
	containername = "Ballistic ammunition crate"
	access = access_armory

/datum/supply_pack/munitions/beanbagammo
	name = "Ammunition - Beanbag shells"
	contains = list(/obj/item/weapon/storage/box/beanbags = 3)
	cost = 100
	containertype = /obj/structure/closet/crate
	containername = "Ballistic ammunition crate"
	access = null

/datum/supply_pack/munitions/bsmgammo
	name = "Ammunition - 9mm top mounted lethal"
	contains = list(/obj/item/ammo_magazine/m9mmt = 6)
	cost = 100
	containertype = /obj/structure/closet/crate/secure
	containername = "Ballistic ammunition crate"
	access = access_armory

/datum/supply_pack/munitions/bsmgammorubber
	name = "Ammunition - 9mm top mounted rubber"
	contains = list(/obj/item/ammo_magazine/m9mmt/rubber = 6)
	cost = 100
	containertype = /obj/structure/closet/crate/secure
	containername = "Ballistic ammunition crate"
	access = access_security

/datum/supply_pack/munitions/brifleammo
	name = "Ammunition - 7.62mm lethal"
	contains = list(/obj/item/ammo_magazine/m762 = 6)
	cost = 100
	containertype = /obj/structure/closet/crate/secure
	containername = "Ballistic ammunition crate"
	access = access_armory

/datum/supply_pack/munitions/pcellammo
	name = "Ammunition - Power cell"
	contains = list(/obj/item/weapon/cell/device/weapon = 3)
	cost = 75
	containertype = /obj/structure/closet/crate/secure
	containername = "Energy ammunition crate"
	access = access_security

*/