/mob/living/simple_mob/animal/giant_spider/corroder
	desc = "Slick and darkish blue, it makes you shudder to look at it. This one has brilliant cyan eyes, and a strange abdomen marking ."
	tt_desc = "X Brachypelma phorus vomitus"
	icon_state = "corroder"
	icon_living = "corroder"
	icon_dead = "corroder_dead"
	maxHealth = 120
	health = 120
	projectilesound = 'sound/effects/spray.ogg'
	projectiletype = /obj/item/projectile/energy/neurotoxin/advanced
	base_attack_cooldown = 15
	melee_damage_lower = 8
	melee_damage_upper = 15
	poison_per_bite = 10
	poison_type = "pacid"
	player_msg = "You can fire a deadly corrosive ranged attack by clicking on an enemy or tile at a distance."
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting
	movement_cooldown = 3.5

// Check if we should acid, or just shoot the pain ball
/mob/living/simple_mob/animal/giant_spider/corroder/should_special_attack(atom/A)
	if(ismob(A))
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			if(!H.legcuffed)
				return TRUE
	return FALSE

// Now we've got a running human in sight, time to throw the bola
/mob/living/simple_mob/animal/giant_spider/corroder/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)
	var/obj/item/projectile/energy/neurotoxin/advanced/B = new /obj/item/projectile/energy/neurotoxin/advanced(src.loc)
	playsound(src, 'sound/effects/spray.ogg', 100, 1)
	if(!B)
		return
	B.launch(A)
	set_AI_busy(FALSE)