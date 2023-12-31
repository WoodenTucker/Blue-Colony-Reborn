/obj/item/weapon/gun/projectile/garand
	name = "\improper M1 Garand"
	desc = "This is the vintage semi-automatic rifle that famously helped win the second World War. Uses 7.62mm rounds."
	icon_state = "garand"
	item_state = "boltaction"
	w_class = ITEMSIZE_LARGE
	caliber = "7.62mm"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	fire_sound = 'sound/weapons/rifleshot.ogg'
	load_method = MAGAZINE // ToDo: Make it so MAGAZINE, SPEEDLOADER and SINGLE_CASING can all be used on the same gun.
	magazine_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/m762garand)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/garand_ping.ogg'

/obj/item/weapon/gun/projectile/garand/update_icon()
	if(ammo_magazine)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-e"
