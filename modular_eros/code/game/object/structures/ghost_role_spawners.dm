//Ash walker eggs: Spawns in ash walker dens in lavaland. Ghosts become unbreathing lizards that worship the Necropolis and are advised to retrieve corpses to create more ash walkers.

/obj/effect/mob_spawn/human/ash_walker
	name = "ash walker egg"
	desc = "A man-sized yellow egg, spawned from some unfathomable creature. A humanoid silhouette lurks within."
	mob_name = "an ash walker"
	job_description = "Ashwalker"
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "ashwalker_egg"
	mob_species = /datum/species/lizard/ashwalker
	roundstart = FALSE
	death = FALSE
	anchored = FALSE
	move_resist = MOVE_FORCE_NORMAL
	density = FALSE
	short_desc = "You are an ash walker. Your tribe worships the Necropolis."
	flavour_text = "The wastes are sacred ground, its monsters a blessed bounty. You would never willingly leave your homeland behind. \
	You have seen lights in the distance... they foreshadow the arrival of outsiders to your domain.\
	Ensure your nest remains protected at all costs.\n\n"
	assignedrole = "Ash Walker"
	var/gender_bias

/obj/effect/mob_spawn/human/ash_walker/equip(mob/living/carbon/human/H)
	if(!isnull(gender_bias) && prob(80))
		H.gender = gender_bias
	return ..()
	
/obj/effect/mob_spawn/human/ash_walker/special(mob/living/new_spawn)
	new_spawn.real_name = random_unique_lizard_name(gender)

	new_spawn.remove_all_languages()
	new_spawn.grant_language(/datum/language/draconic)
	var/datum/language_holder/holder = new_spawn.get_language_holder()
	holder.selected_default_language = /datum/language/draconic

	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.undershirt = "Nude"
		H.socks = "Nude"
		H.update_body()

/obj/effect/mob_spawn/human/ash_walker/Initialize(mapload)
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("An ash walker egg is ready to hatch in \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE, ignore_key = POLL_IGNORE_ASHWALKER)

/obj/effect/mob_spawn/human/ash_walker/western
	mob_species = /datum/species/lizard/ashwalker/western

/obj/effect/mob_spawn/human/ash_walker/eastern
	mob_species = /datum/species/lizard/ashwalker/eastern


/datum/outfit/ashwalker
	name ="Ashwalker"
	head = /obj/item/clothing/head/helmet/gladiator
	uniform = /obj/item/clothing/under/gladiator/ash_walker
