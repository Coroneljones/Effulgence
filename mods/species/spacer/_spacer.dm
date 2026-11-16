/decl/modpack/spacer
	name = "Spaver"

/decl/modpack/spacer/pre_initialize()
	..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/human/spacer::uid

/mob/living/human/spacer/Initialize(mapload, species_uid, datum/mob_snapshot/supplied_appearance)
	species_uid = /decl/species/human/spacer::uid
	. = ..()