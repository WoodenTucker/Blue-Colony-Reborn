/datum/game_mode/traitor
	name = "traitor"
	round_description = "There is a foreign agent or traitor in the city. Do not let the traitor succeed!"
	extended_round_description = "The Company's majority control of phoron in the system has marked the \
		city to be a highly valuable target for many competing organizations and individuals. The varied pasts \
		and experiences of your fellow civilians have left them susceptible to the vices and temptations of humanity. \
		Is Kiel City the safe workplace you once thought it was, or has it become a playground \
		for the evils of the colony? Who can you trust? Watch your front. Watch your sides. Watch your back. \
		The familiar faces that you've passed hundreds of times down the streets before can be hiding terrible \
		secrets and deceptions. Every corner is a mystery. Every conversation is a lie. You will be facing your \
		friends and family as they try to use your emotions and trust to their advantage, leaving you with nothing \
		but the painful reminder that Pollux is cruel and unforgiving."
	config_tag = "traitor"
	required_players = 1
	required_players_secret = 1
	required_enemies = 1
	end_on_antag_death = 0
	antag_tags = list(MODE_TRAITOR)
	antag_scaling_coeff = 8

/datum/game_mode/traitor/auto
	name = "autotraitor"
	config_tag = "autotraitor"
	antag_tags = list(MODE_AUTOTRAITOR)
	round_autoantag = 1
	required_players_secret = 0
	required_enemies = 0
	antag_scaling_coeff = 5
