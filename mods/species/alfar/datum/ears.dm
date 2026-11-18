/decl/sprite_accessory/ears/alfar
	abstract_type = /decl/sprite_accessory/ears/alfar
	icon = 'icons/mob/human_races/species/default_ears.dmi'
	species_allowed = list("species_alfar")

/decl/sprite_accessory/ears/alfar/pointed
	name = "Pointed Ears"
	icon_state = "ears_pointy"
	uid = "acc_ears_alfar_pointed"

/decl/sprite_accessory/ears/alfar/pointed_long
	name = "Long Pointed Ears"
	icon_state = "ears_pointy_long"
	uid = "acc_ears_alfar_pointed_long"

/decl/sprite_accessory/ears/alfar/pointed_long_down
	name = "Long Pointed Ears (Downturned)"
	icon_state = "ears_pointy_long_down"
	uid = "acc_ears_alfar_pointed_long_down"

/decl/sprite_accessory/ears/alfar/pointed_longest
	name = "Longest Pointed Ears"
	icon_state = "elfs"
	uid = "acc_ears_alfar_elven"

/decl/sprite_accessory/ears/none/accessory_is_available(mob/owner, decl/species/species, decl/bodytype/bodytype, list/traits)
	if(species?.uid == /decl/species/alfar::uid)
		return FALSE
	return ..()
