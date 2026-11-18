/decl/modpack/promethean
	name = "Promethean Species"
	tabloid_headlines = list(
		"TENTACLE DENS: PROMETHEAN EXPLOITATION?",
		"NEW SOPHONTS FOUND DISTURBINGLY OKAY WITH EATING PINEAPPLE ON PIZZA"
	)

/decl/modpack/promethean/pre_initialize()
	..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/promethean::uid

/mob/living/human/promethean/Initialize(mapload, species_uid, datum/mob_snapshot/supplied_appearance)
	species_uid = /decl/species/promethean::uid
	. = ..()