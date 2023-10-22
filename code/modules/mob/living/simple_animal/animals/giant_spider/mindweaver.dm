//Mindweavers are quick, extremely fragile, but have the ability to break the minds of players.
//Code is WIP

/mob/living/simple_mob/animal/giant_spider/mindweaver
	desc = "Slick and grey, it makes you shudder to look at it. This one has sparkling magenta eyes."
	icon_state = "mindweaver"
	icon_living = "mindweaver"
	icon_dead =  "mindweaver_dead"

	maxHealth = 95
	health = 95

	poison_chance = 50
	poison_type = "mindbreaker"
	poison_per_bite = 15
	melee_damage_lower = 6
	melee_damage_upper = 10

	movement_cooldown = 0.25
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
	say_list_type = /datum/say_list/mindweaver

/datum/say_list/mindweaver
	speak = list("Chez!","Y'ch!","E'yo!","T'k!")
	emote_hear = list("citters","utters")

/mob/living/simple_mob/animal/giant_spider/mindweaver/handle_special()
	if(!stat && prob(2)) // sbookie
		var/mob/observer/dead/spook = locate() in range(src, 5)
		if(spook)
			var/turf/T = get_turf(spook)
			var/list/visible = list()
			for(var/obj/O in T.contents)
				if(!O.invisibility && O.name)
					visible += O
			if(visible.len)
				var/atom/A = pick(visible)
				visible_emote("suddenly stops and glares at something unseen[istype(A) ? " near [A]":""].")
