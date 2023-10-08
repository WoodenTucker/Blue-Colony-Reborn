
var/list/dreams = list(
	"an ID card","a bottle","a familiar face","a civilian","a toolbox","a Police Officer","the Mayor",
	"voices from all around","deep space","a doctor","the engine","a traitor","an ally","darkness",
	"light","a scientist","a monkey","a catastrophe","a loved one","a gun","warmth","freezing","the sun",
	"a hat","the moon of Castor","a ruined station","a corpse","phoron","air","the hospital","the townhall","blinking lights",
	"a blue light","an abandoned laboratory","NanoTrasen","mercenaries","blood","healing","power","respect",
	"riches","space","a crash","happiness","pride","a fall","water","flames","ice","melons","flying","the eggs","money",
	"the City Clerk","the Head of Security","the Chief Engineer","the Research Director","the Chief Medical Officer",
	"the Detective","the Warden","an Internal Affairs Agent","a City Engineer","the Janitor","a Nurse",
	"the Quartermaster","a Cargo Technician","a Botanist","a Shaft Miner","a Psychologist","the Chemist","a Geneticist",
	"the republic","the Roboticist","the Chef","a Bartender","the Chaplain","the Journalist","a mouse","an ERT member",
	"a beach","the holodeck","a smoky room","a voice","the cold","a mouse","an operating table","a bar","the rain","a spider",
	"an Expat","a creep","the city Intelligence core","the mining station","the research lab","a beaker of strange liquid",
	"a Teshari", "a Diona nymph","the government","Major Bill","a Morpheus ship with a ridiculous name","the Exodus","a star",
	"a Dionaea gestalt","the chapel","a distant scream","endless chittering noises","glowing eyes in the shadows","an empty glass",
	"a disoriented creature","towers of plastic","a Gygax","a synthetic","a Man-Machine Interface","maintenance drones","everflowing energy",
	"unintelligible writings","a Fleet ship","Pollux","Kiel","Old Geminus","a PDSI agent","a man in a white shirt","a thing of contraband",
	"a red light","the sub-continent of Ocral Spax","the continent of Cascington","the cold snow","Glace Gria","Glace Grace","the star Vetra","Mars", "Venus",
	"Sol","Benard's Star","the planet Gamma","the planet Alzirr","the planet Theta","the planet Propus","the planet Tejat","Deviancy","An asteroid","A carp","Corruption", "A conspiracy", "a riot",
	)

mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			src << "<font color='blue'><i>... [pick(dreams)] ...</i></font>"
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0
