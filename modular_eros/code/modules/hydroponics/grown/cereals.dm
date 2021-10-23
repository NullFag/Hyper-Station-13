/obj/item/seeds/wheat/ashen
	name = "ashen hair seeds"
	desc = "Brought over by the western ash tribe, these seeds grow into ashen hair."
	icon_state = "seed-ashhair"
	species = "ashhair"
	plantname = "Ashen Hair"
	product = /obj/item/reagent_containers/food/snacks/grown/wheat/ashen
	production = 1
	yield = 4
	potency = 15
	icon_dead = "ashhair-dead"
	mutatelist = list()
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.04)

/obj/item/reagent_containers/food/snacks/grown/wheat/ashen
	seed = /obj/item/seeds/wheat/ashen
	name = "ashen hair"
	desc = "A westerners' delicacy."
	gender = PLURAL
	icon_state = "ashhair"
	filling_color = "#4f4f4f"
	bitesize_mod = 2
	foodtype = VEGETABLES
	grind_results = list(/datum/reagent/consumable/flour = 0)
	tastes = list("ash" = 3, "plant" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/beer
