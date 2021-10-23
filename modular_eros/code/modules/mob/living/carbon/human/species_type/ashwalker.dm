/*
 Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Ash Walker"
	id = "ashlizard"
	limbs_id = "lizard"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,DIGITIGRADE)
	inherent_traits = list(TRAIT_NOGUNS, TRAIT_NOTHIRST)
	mutantlungs = /obj/item/organ/lungs/ashwalker
	mutanteyes = /obj/item/organ/eyes/night_vision/ashen
	burnmod = 0.9
	brutemod = 0.9

/datum/species/lizard/ashwalker/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	C.dna.features["tail_lizard"] = "Smooth"
	C.dna.features["mcolor2"] = C.dna.features["mcolor"]
	C.dna.features["mcolor3"] = C.dna.features["mcolor"]
	C.dna.features["taur"] = "None"
	// to any person that comes to here for "muh oc"
	// i will personally shit down your throat if you make snowflake taur ashies with a tentacle 14 inch
	// or whatever stupid oc shit you come up with possible
	// my babies will stay pure even if it costs me my github account
	if(C.gender == MALE) 
		C.dna.features["has_cock"] = TRUE
		C.dna.features["has_balls"] = TRUE
		C.dna.features["cock_color"] = "A50021"
		C.dna.features["cock_girth"] = 0.78 + (0.01 * rand(-4, prob(10) ? 5 : 1)) //chance for a bigger pleasure
		C.dna.features["cock_shape"] = "Tapered"
		C.dna.features["cock_length"] = rand(4, prob(10) ? 9 : 7) + rand()
		C.dna.features["balls_shape"] = "Hidden"
	else
		C.dna.features["has_vag"] = TRUE
		C.dna.features["has_womb"] = TRUE
		C.dna.features["vag_color"] = C.dna.features["mcolor"]
		C.dna.features["vag_shape"] = "Cloaca"
	C.give_genitals(1)
	C.update_body()
	return ..()

/obj/item/organ/eyes/night_vision/ashen
	name = "ashen eyes"
	desc = "A walker of the ash, blind to the horrors of the station."

/datum/species/lizard/ashwalker/western //i could make it a seperate species but hyper code is already snuffed anyways
	name = "Western Ash Walker"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS)

/datum/species/lizard/ashwalker/western/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	C.dna.features["legs"] = "Normal Legs" //hyper code
	return ..()
	
/datum/species/lizard/ashwalker/eastern
	name = "Eastern Ash Walker"
	burnmod = 0.85
	brutemod = 0.85

/datum/species/lizard/ashwalker/western/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	C.dna.features["legs"] = "Digitigrade Legs" //just to be safe
	return ..()
