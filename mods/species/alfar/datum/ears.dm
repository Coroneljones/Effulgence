/decl/sprite_accessory/ears/alfar
	abstract_type = /decl/sprite_accessory/ears/alfar
	icon = 'icons/mob/human_races/species/default_ears.dmi'
	species_allowed = list("species_alfar")

/decl/sprite_accessory/ears/alfar/Initialize()
	. = ..()
	LAZYREMOVE(accessory_metadata_types, SAM_COLOR)

/decl/sprite_accessory/ears/alfar/get_cached_accessory_icon_key(var/obj/item/organ/external/organ, var/list/metadata)
	. = ..()
	. += "_skin_tone_[organ.skin_tone]"

/decl/sprite_accessory/ears/alfar/get_cached_accessory_icon(var/obj/item/organ/external/organ, var/list/metadata)
	var/icon/ear_icon = ..(organ, list())
	if(!ear_icon)
		return ear_icon

	ear_icon = new(ear_icon)
	var/decl/bodytype/icon_bodytype = organ.get_organ_appearance_bodytype()
	if(istype(icon_bodytype))
		ear_icon = icon_bodytype.apply_limb_colouration(organ, ear_icon)
	if(organ.skin_tone)
		if(organ.skin_tone > 0)
			ear_icon.Blend(rgb(organ.skin_tone, organ.skin_tone, organ.skin_tone), ICON_ADD)
		else
			ear_icon.Blend(rgb(-organ.skin_tone, -organ.skin_tone, -organ.skin_tone), ICON_SUBTRACT)
	return ear_icon

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
