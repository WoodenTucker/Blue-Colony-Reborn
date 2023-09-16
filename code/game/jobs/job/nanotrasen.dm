/datum/job/nanotrasen
	title = "Government Representative"
	flag = NANOTRASEN
	department = DEPT_NANOTRASEN
	head_position = 0
	department_flag = GOVLAW
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Nanotrasen and the President"
	selection_color = "#0F0F6F"
	idtype = /obj/item/weapon/card/id/nanotrasen/ntrep
	access = list(access_cent_general, access_cent_thunder, access_cent_medical, access_cent_living, access_cent_storage, access_cent_teleporter) 			//See get_access()
	minimal_access = list(access_cent_general, access_cent_thunder, access_cent_medical, access_cent_living, access_cent_storage, access_cent_teleporter) 	//See get_access()
	outfit_type = /decl/hierarchy/outfit/job/nanotrasen/representative

	alt_titles = list("Electoral Assistant" = /decl/hierarchy/outfit/job/nanotrasen/electoral,
                      "Nanotrasen Officer" = /decl/hierarchy/outfit/job/nanotrasen/officer)

	wage = 900
	minimum_character_age = 25 // Pushing it I guess, but possible
	ideal_character_age = 40
	req_admin_notify = 1

	hard_whitelisted = 1

	no_shuttle = TRUE


	description = "You represent Nanotrasen as a member of the democratic government project the charter brought forth - \
	this comes with various roles. \

	We're not quite sure why a huge megacorporation needs a democratic government, but perhaps it makes the \
	people feel safe. Because of this you are expected to keep a good image in public as you drain the funds. \
	What you represent? Getting paid for absolutely nothing, that's what."

	duties = list("Drain colony funds", "Pretend to be important", "Go home and roll in your money")

	portal_whitelist = "cabinet_govrep"

/datum/job/nanotrasen/get_access()
	return access + get_all_station_access()

/datum/job/nanotrasen/get_job_email()	// whatever this is set to will be the job's communal email. should be persistent.
	return using_map.rep_email

/datum/job/nanotrasen/governor // Renamed president to "governor"
	title = "Governor"
	flag = GOVERNOR
	department_flag = GOVLAW
	faction = "City"
	total_positions = 1
	spawn_positions = 1
	supervisors = "NanoTrasen"

	selection_color = "#1D1D4F"
	idtype = /obj/item/weapon/card/id/nanotrasen/president
	req_admin_notify = 1
	access = list(access_president, access_vice_president, access_advisor, access_governor, access_cent_general, access_cent_thunder, \
	access_cent_medical, access_cent_living, access_cent_storage, access_cent_teleporter)

	minimal_access = list(access_cent_general, access_president, access_vice_president, access_advisor, access_governor)
	minimal_player_age = 14

	wage = 9000
	alt_titles = list()

	minimum_character_age = 30
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/nanotrasen/president

	portal_whitelist = "cabinet_president"

/datum/job/nanotrasen/president/get_job_email()	// whatever this is set to will be the job's communal email. should be persistent.
	return using_map.president_email

/datum/job/nanotrasen/pdsi
	title = "PDSI Agent"
	flag = PDSI
	alt_titles = list(
		"PDSI Director", "PDSI Supervisory Agent", "PDSI Senior Agent")
	head_position = 0
	department_flag = GOVLAW
	faction = "City"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the PDSI Director"

	selection_color = "#0F0F6F"
	idtype = /obj/item/weapon/card/id/nanotrasen/pdsi
	alt_titles = list()


	outfit_type = /decl/hierarchy/outfit/job/nanotrasen/pdsi

	wage = 250
	minimum_character_age = 25 // Pushing it I guess, but possible
	ideal_character_age = 37
	req_admin_notify = 1

	description = "PDSI agents are a bit like the FBI, but less cool. They exist to control the corruption in the city council and the police."

	duties = list("Get police reports instead of corruption reports", "Drink coffee", "Roll eyes at reports")

/datum/job/nanotrasen/pdsi/get_access()
	return get_all_centcom_access()+get_all_station_access()

/datum/job/nanotrasen/pdsi/get_job_email()	// whatever this is set to will be the job's communal email. should be persistent.
	return using_map.investigation_email


/datum/job/nanotrasen/advisor
	flag = 0
	faction = null
	access = list(access_advisor, access_cent_general)
	minimal_access = list(access_advisor, access_cent_general)
	outfit_type = /decl/hierarchy/outfit/job/nanotrasen/advisor
	idtype = /obj/item/weapon/card/id/nanotrasen/advisor
	alt_titles = list()
	wage = 500
	description = "As an advisor, your goal is to advise the president. Yep, that's it."

/datum/job/nanotrasen/advisor/justice
	title = "Advisor of Justice"
	total_positions = 1
	spawn_positions = 1
	flag = ADVISORJUSTICE
	alt_titles = list("Advisor of Justice")

	faction = "City"

	portal_whitelist = "cabinet_justice"

/datum/job/nanotrasen/advisor/innovation
	title = "Advisor of Innovation"
	total_positions = 1
	spawn_positions = 1
	flag = ADVISORINNOVATION
	alt_titles = list("Advisor of Innovation")

	faction = "City"

	portal_whitelist = "cabinet_innovation"

/datum/job/nanotrasen/advisor/health
	title = "Advisor of Health"
	total_positions = 1
	spawn_positions = 1
	flag = ADVISORHEALTH
	alt_titles = list("Advisor of Health")
	faction = "City"

	portal_whitelist = "cabinet_health"

/datum/job/nanotrasen/advisor/finance
	title = "Advisor of Finance"
	total_positions = 1
	spawn_positions = 1
	flag = ADVISORFINANCE
	faction = "City"
	alt_titles = list("Advisor of Finance")

	portal_whitelist = "cabinet_finance"
