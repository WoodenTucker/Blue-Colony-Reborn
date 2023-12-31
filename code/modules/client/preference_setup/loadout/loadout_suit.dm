// Suit slot
/datum/gear/suit
	display_name = "apron, blue"
	path = /obj/item/clothing/suit/storage/apron
	slot = slot_wear_suit
	sort_category = "Suits and Overwear"
	cost = 2

/datum/gear/suit/coat
	display_name = "coat"
	path = /obj/item/clothing/suit/storage/toggle/coat

/datum/gear/suit/coat/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)


/datum/gear/suit/greatcoat
	display_name = "greatcoat"
	path = /obj/item/clothing/suit/greatcoat

/datum/gear/suit/leather_coat
	display_name = "leather coat"
	path = /obj/item/clothing/suit/leathercoat

/datum/gear/suit/puffer_coat
	display_name = "puffer coat"
	path = /obj/item/clothing/suit/jacket/puffer

/datum/gear/suit/puffer_vest
	display_name = "puffer vest"
	path = /obj/item/clothing/suit/jacket/puffer/vest

/datum/gear/suit/bomber
	display_name = "bomber jacket"
	path = /obj/item/clothing/suit/storage/toggle/bomber

/datum/gear/suit/bomber_alt
	display_name = "bomber jacket 2"
	path = /obj/item/clothing/suit/storage/bomber/alt

/datum/gear/suit/leather_jacket
	display_name = "leather jacket, black"
	path = /obj/item/clothing/suit/storage/toggle/leather_jacket

/datum/gear/suit/leather_jacket_sleeveless
	display_name = "leather vest, black"
	path = /obj/item/clothing/suit/storage/toggle/leather_jacket/sleeveless

/datum/gear/suit/leather_jacket_alt
	display_name = "leather jacket 2, black"
	path = /obj/item/clothing/suit/storage/leather_jacket_alt

/datum/gear/suit/leather_jacket_nt
	display_name = "leather jacket, corporate, black"
	path = /obj/item/clothing/suit/storage/toggle/leather_jacket/nanotrasen

/datum/gear/suit/leather_jacket_nt/sleeveless
	display_name = "leather vest, corporate, black"
	path = /obj/item/clothing/suit/storage/toggle/leather_jacket/nanotrasen/sleeveless

/datum/gear/suit/brown_jacket
	display_name = "leather jacket, brown"
	path = /obj/item/clothing/suit/storage/toggle/brown_jacket

/datum/gear/suit/brown_jacket_sleeveless
	display_name = "leather vest, brown"
	path = /obj/item/clothing/suit/storage/toggle/brown_jacket/sleeveless

/datum/gear/suit/brown_jacket_nt
	display_name = "leather jacket, corporate, brown"
	path = /obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen

/datum/gear/suit/brown_jacket_nt/sleeveless
	display_name = "leather vest, corporate, brown"
	path = /obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen/sleeveless

/datum/gear/suit/mil
	display_name = "military jacket"
	path = /obj/item/clothing/suit/storage/miljacket

/datum/gear/suit/mil/alt
	display_name = "military jacket, alt"
	path = /obj/item/clothing/suit/storage/miljacket/alt

/datum/gear/suit/mil/green
	display_name = "military jacket, green"
	path = /obj/item/clothing/suit/storage/miljacket/green

/datum/gear/suit/greyjacket
	display_name = "grey jacket"
	path = /obj/item/clothing/suit/storage/greyjacket

/datum/gear/suit/brown_trenchcoat
	display_name = "trenchcoat, brown"
	path = /obj/item/clothing/suit/storage/trench

/datum/gear/suit/grey_trenchcoat
	display_name = "trenchcoat, grey"
	path = /obj/item/clothing/suit/storage/trench/grey

/datum/gear/suit/duster
	display_name = "cowboy duster"
	path = /obj/item/clothing/suit/storage/duster

/datum/gear/suit/duster/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/suit/duster/alt
	display_name = "modern coat"
	path = /obj/item/clothing/suit/storage/duster/alt


/datum/gear/suit/hazard_vest
	display_name = "hazard vest selection"
	path = /obj/item/clothing/suit/storage/hazardvest

/datum/gear/suit/hazard_vest/New()
	..()
	var/list/hazards = list()
	for(var/hazard_style in typesof(/obj/item/clothing/suit/storage/hazardvest))
		var/obj/item/clothing/suit/storage/hazardvest/hazardvest = hazard_style
		hazards[initial(hazardvest.name)] = hazardvest
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(hazards))

/datum/gear/suit/hoodie
	display_name = "hoodie selection"
	path = /obj/item/clothing/suit/storage/toggle/hoodie

/datum/gear/suit/hoodie/New()
	..()
	var/list/hoodies = list()
	for(var/hoodie_style in typesof(/obj/item/clothing/suit/storage/toggle/hoodie))
		var/obj/item/clothing/suit/storage/toggle/hoodie/hoodie = hoodie_style
		hoodies[initial(hoodie.name)] = hoodie
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(hoodies))

/datum/gear/suit/labcoat
	display_name = "labcoat"
	path = /obj/item/clothing/suit/storage/toggle/labcoat

/datum/gear/suit/labcoat/blue
	display_name = "labcoat, blue"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/blue

/datum/gear/suit/labcoat/blue_edge
	display_name = "labcoat, blue-edged"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/blue_edge

/datum/gear/suit/labcoat/green
	display_name = "labcoat, green"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/green

/datum/gear/suit/labcoat/orange
	display_name = "labcoat, orange"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/orange

/datum/gear/suit/labcoat/purple
	display_name = "labcoat, purple"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/purple

/datum/gear/suit/labcoat/pink
	display_name = "labcoat, pink"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/pink

/datum/gear/suit/labcoat/red
	display_name = "labcoat, red"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/red

/datum/gear/suit/labcoat/yellow
	display_name = "labcoat, yellow"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/yellow

/datum/gear/suit/labcoat/emt
	display_name = "labcoat, EMT (Medical)"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/emt
	allowed_roles = list("Physician","Medical Director","Chemist","Paramedic","Geneticist", "Psychiatrist")

/datum/gear/suit/roles/surgical_apron
	display_name = "surgical apron"
	path = /obj/item/clothing/suit/surgicalapron
	allowed_roles = list("Physician","Chief Medical Officer")

/datum/gear/suit/overalls
	display_name = "overalls"
	path = /obj/item/clothing/suit/storage/apron/overalls
	cost = 1

/datum/gear/suit/poncho
	display_name = "poncho selection"
	path = /obj/item/clothing/accessory/poncho
	cost = 1

/datum/gear/suit/poncho/New()
	..()
	var/list/ponchos = list()
	for(var/poncho_style in (typesof(/obj/item/clothing/accessory/poncho) - typesof(/obj/item/clothing/accessory/poncho/roles)))
		var/obj/item/clothing/accessory/poncho/poncho = poncho_style
		ponchos[initial(poncho.name)] = poncho
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(ponchos))

/datum/gear/suit/roles/poncho/security
	display_name = "poncho, security"
	path = /obj/item/clothing/accessory/poncho/roles/security

/datum/gear/suit/roles/poncho/medical
	display_name = "poncho, medical"
	path = /obj/item/clothing/accessory/poncho/roles/medical

/datum/gear/suit/roles/poncho/engineering
	display_name = "poncho, engineering"
	path = /obj/item/clothing/accessory/poncho/roles/engineering

/datum/gear/suit/roles/poncho/science
	display_name = "poncho, science"
	path = /obj/item/clothing/accessory/poncho/roles/science

/datum/gear/suit/roles/poncho/cargo
	display_name = "poncho, cargo"
	path = /obj/item/clothing/accessory/poncho/roles/cargo

/datum/gear/suit/roles/poncho/cloak/hos
	display_name = "cloak, chief of police"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/hos
	allowed_roles = list("Chief of Police")

/datum/gear/suit/roles/poncho/cloak/cmo
	display_name = "cloak, medical director"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/cmo
	allowed_roles = list("Medical Director")

/datum/gear/suit/roles/poncho/cloak/ce
	display_name = "cloak, chief engineer"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/ce
	allowed_roles = list("Chief Engineer")

/datum/gear/suit/roles/poncho/cloak/rd
	display_name = "cloak, research director"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/rd
	allowed_roles = list("Research Director")

/datum/gear/suit/roles/poncho/cloak/qm
	display_name = "cloak, quartermaster"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/qm
	allowed_roles = list("Port Manager")

/datum/gear/suit/roles/poncho/cloak/captain
	display_name = "cloak, mayor"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/captain
	allowed_roles = list("Mayor")

/datum/gear/suit/roles/poncho/cloak/hop
	display_name = "cloak, city clerk"
	path = /obj/item/clothing/accessory/poncho/roles/cloak/hop
	allowed_roles = list("City Clerk")

/datum/gear/suit/unathi_robe
	display_name = "roughspun robe"
	path = /obj/item/clothing/suit/unathi/robe
	cost = 1

/datum/gear/suit/black_lawyer_jacket
	display_name = "suit jacket, black"
	path = /obj/item/clothing/suit/storage/toggle/internalaffairs

/datum/gear/suit/blue_lawyer_jacket
	display_name = "suit jacket, blue"
	path = /obj/item/clothing/suit/storage/toggle/lawyer/bluejacket

/datum/gear/suit/purple_lawyer_jacket
	display_name = "suit jacket, purple"
	path = /obj/item/clothing/suit/storage/toggle/lawyer/purpjacket

/datum/gear/suit/suspenders
	display_name = "suspenders"
	path = /obj/item/clothing/suit/suspenders

/datum/gear/suit/forensics
	display_name = "forensics long, red"
	path = /obj/item/clothing/suit/storage/forensics/red/long
	allowed_roles = list("Detective")

/datum/gear/suit/forensics/blue
	display_name = "forensics long, blue"
	path = /obj/item/clothing/suit/storage/forensics/blue/long
	allowed_roles = list("Detective")

/datum/gear/suit/forensics/blue/short
	display_name = "forensics, blue"
	path = /obj/item/clothing/suit/storage/forensics/blue
	allowed_roles = list("Detective")

/datum/gear/suit/forensics/red/short
	display_name = "forensics, red"
	path = /obj/item/clothing/suit/storage/forensics/red
	allowed_roles = list("Detective")

/datum/gear/suit/police/policejacket
	display_name = "Police Jacket"
	path = /obj/item/clothing/suit/storage/toggle/policejacket
	allowed_roles = list("Police Officer", "Chief of Police", "Prison Warden", "Detective")

/datum/gear/suit/police/policehivis
	display_name = "Police High vis vest"
	path = /obj/item/clothing/suit/storage/toggle/hazardvest/brightgreen
	allowed_roles = list("Police Officer", "Chief of Police", "Prison Warden", "Detective")

/datum/gear/suit/wintercoat
	display_name = "winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat

/datum/gear/suit/wintercoat/captain
	display_name = "winter coat, mayor"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/captain
	allowed_roles = list("Mayor")

/datum/gear/suit/wintercoat/medical
	display_name = "winter coat, medical"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/medical
	allowed_roles = list("Physician","Medical Director","Chemist","Paramedic","Geneticist", "Psychiatrist")

/datum/gear/suit/wintercoat/science
	display_name = "winter coat, science"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/science
	allowed_roles = list("Research Director","Scientist", "Roboticist", "Xenobiologist")

/datum/gear/suit/wintercoat/engineering
	display_name = "winter coat, engineering"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/engineering
	allowed_roles = list("Chief Engineer","Firefighter", "Station Engineer")

/datum/gear/suit/wintercoat/atmos
	display_name = "winter coat, atmospherics"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos
	allowed_roles = list("Chief Engineer", "Firefighter")

/datum/gear/suit/wintercoat/hydro
	display_name = "winter coat, hydroponics"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/hydro
	allowed_roles = list("Botanist", "Xenobiologist")

/datum/gear/suit/wintercoat/cargo
	display_name = "winter coat, cargo"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/cargo
	allowed_roles = list("Port Manager","Port Operator")

/datum/gear/suit/wintercoat/miner
	display_name = "winter coat, mining"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/miner
	allowed_roles = list("Shaft Miner")

/datum/gear/suit/varsity
	display_name = "varsity jacket selection"
	path = /obj/item/clothing/suit/varsity

/datum/gear/suit/varsity/New()
	..()
	var/list/varsities = list()
	for(var/varsity_style in typesof(/obj/item/clothing/suit/varsity))
		var/obj/item/clothing/suit/varsity/varsity = varsity_style
		varsities[initial(varsity.name)] = varsity
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(varsities))

/datum/gear/suit/track
	display_name = "track jacket selection"
	path = /obj/item/clothing/suit/storage/toggle/track

/datum/gear/suit/track/New()
	..()
	var/list/tracks = list()
	for(var/track_style in typesof(/obj/item/clothing/suit/storage/toggle/track))
		var/obj/item/clothing/suit/storage/toggle/track/track = track_style
		tracks[initial(track.name)] = track
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(tracks))

/datum/gear/suit/flannel
	display_name = "grey flannel"
	path = /obj/item/clothing/suit/storage/flannel

/datum/gear/suit/flannel/red
	display_name = "red flannel"
	path = /obj/item/clothing/suit/storage/flannel/red

/datum/gear/suit/flannel/aqua
	display_name = "aqua flannel"
	path = /obj/item/clothing/suit/storage/flannel/aqua

/datum/gear/suit/flannel/brown
	display_name = "brown flannel"
	path = /obj/item/clothing/suit/storage/flannel/brown

/datum/gear/suit/denim_jacket
	display_name = "denim jacket"
	path = /obj/item/clothing/suit/storage/toggle/denim_jacket

/datum/gear/suit/denim_jacket/corporate
	display_name = "denim jacket, corporate"
	path = /obj/item/clothing/suit/storage/toggle/denim_jacket/nanotrasen

/datum/gear/suit/denim_vest
	display_name = "denim vest"
	path = /obj/item/clothing/suit/storage/toggle/denim_jacket/sleeveless

/datum/gear/suit/denim_vest/corporate
	display_name = "denim vest, corporate"
	path = /obj/item/clothing/suit/storage/toggle/denim_jacket/nanotrasen/sleeveless

/datum/gear/suit/miscellaneous/kimono
	display_name = "kimono"
	path = /obj/item/clothing/suit/kimono

/datum/gear/suit/miscellaneous/kimono/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/suit/miscellaneous/sec_dep_jacket
	display_name = "department jacket, security"
	path = /obj/item/clothing/suit/storage/toggle/sec_dep_jacket

/datum/gear/suit/miscellaneous/engi_dep_jacket
	display_name = "department jacket, engineering"
	path = /obj/item/clothing/suit/storage/toggle/engi_dep_jacket

/datum/gear/suit/miscellaneous/supply_dep_jacket
	display_name = "department jacket, supply"
	path = /obj/item/clothing/suit/storage/toggle/supply_dep_jacket

/datum/gear/suit/miscellaneous/sci_dep_jacket
	display_name = "department jacket, science"
	path = /obj/item/clothing/suit/storage/toggle/sci_dep_jacket

/datum/gear/suit/miscellaneous/med_dep_jacket
	display_name = "department jacket, medical"
	path = /obj/item/clothing/suit/storage/toggle/med_dep_jacket

/datum/gear/suit/miscellaneous/peacoat
	display_name = "peacoat"
	path = /obj/item/clothing/suit/storage/toggle/peacoat

/datum/gear/suit/miscellaneous/peacoat/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/suit/snowsuit
	display_name = "snowsuit"
	path = /obj/item/clothing/suit/storage/snowsuit

/datum/gear/suit/snowsuit/command
	display_name = "snowsuit, command"
	path = /obj/item/clothing/suit/storage/snowsuit/command
	allowed_roles = list("Mayor","Research Director","City Clerk","Chief of Police","Chief Engineer","City Hall Guard")

/datum/gear/suit/snowsuit/security
	display_name = "snowsuit, security"
	path = /obj/item/clothing/suit/storage/snowsuit/security
	allowed_roles = list("Police Officer", "Chief of Police", "Prison Warden", "Detective")

/datum/gear/suit/snowsuit/medical
	display_name = "snowsuit, medical"
	path = /obj/item/clothing/suit/storage/snowsuit/medical
	allowed_roles = list("Physician","Medical Director","Chemist","Paramedic","Geneticist", "Psychiatrist")

/datum/gear/suit/snowsuit/science
	display_name = "snowsuit, science"
	path = /obj/item/clothing/suit/storage/snowsuit/science
	allowed_roles = list("Research Director","Scientist", "Roboticist", "Xenobiologist")

/datum/gear/suit/snowsuit/engineering
	display_name = "snowsuit, engineering"
	path = /obj/item/clothing/suit/storage/snowsuit/engineering
	allowed_roles = list("Chief Engineer","Firefighter", "Station Engineer")

/datum/gear/suit/snowsuit/cargo
	display_name = "snowsuit, supply"
	path = /obj/item/clothing/suit/storage/snowsuit/cargo
	allowed_roles = list("Port Manager","shaft Miner","Port Operator","City Clerk")

/datum/gear/suit/miscellaneous/kamishimo
	display_name = "kamishimo"
	path = /obj/item/clothing/suit/kamishimo

/datum/gear/suit/miscellaneous/cardigan
	display_name = "cardigan"
	path = /obj/item/clothing/suit/storage/toggle/cardigan

/datum/gear/suit/miscellaneous/cardigan/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/suit/tailcoat
	display_name = "tailcoat"
	path = /obj/item/clothing/suit/tailcoat

/datum/gear/suit/tailcoat/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/suit/ladies_tailcoat
	display_name = "ladies tailcoat (black)"
	path = /obj/item/clothing/suit/tailcoat/ladies

/datum/gear/suit/ladies_tailcoat/red
	display_name = "ladies tailcoat (red)"
	path = /obj/item/clothing/suit/tailcoat/ladies/red

/datum/gear/suit/hartcoat
	display_name = "fur-lined greatcoat"
	path = /obj/item/clothing/suit/storage/toggle/hartcoat

/datum/gear/suit/synthleatherjacket
	display_name = "synth-leather jacket"
	path = /obj/item/clothing/suit/storage/toggle/synthleatherjacket

/datum/gear/suit/synthleatherjacket/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)

/datum/gear/suit/poshblazer
	display_name = "posh blazer"
	path = /obj/item/clothing/suit/storage/poshblazer

/datum/gear/suit/formalblazer
	display_name = "formal blazer"
	path = /obj/item/clothing/suit/storage/formalblazer

/datum/gear/suit/formalblazer/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)


/datum/gear/suit/peterpanblazer
	display_name = "peter pan blazer"
	path = /obj/item/clothing/suit/storage/peterpanblazer


/datum/gear/suit/peterpanblazer/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)


/datum/gear/suit/colorsuit
	display_name = "colorable suit"
	path = /obj/item/clothing/suit/storage/toggle/lawyer/whitejacket


/datum/gear/suit/colorsuit/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)
