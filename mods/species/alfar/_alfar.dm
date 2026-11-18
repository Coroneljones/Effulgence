/decl/modpack/alfar
	name = "Alfar Species"

/decl/modpack/alfar/pre_initialize()
	. = ..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/alfar::uid

/mob/living/human/alfar/Initialize(mapload, species_uid, datum/mob_snapshot/supplied_appearance)
	. = ..(mapload, /decl/species/alfar::uid, supplied_appearance)