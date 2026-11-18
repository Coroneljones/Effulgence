/decl/bodytype/human/alfar
	name = "feminine"
	uid = "bodytype_alfar_fem"
	associated_gender = FEMALE
	hardiness = 0.95
	onmob_state_modifiers = list((slot_w_uniform_str) = "f")
	appearance_descriptors = list(
		/datum/appearance_descriptor/height/alfar = 1,
		/datum/appearance_descriptor/build = 1
	)
	default_sprite_accessories = list(
		SAC_EARS = list(/decl/sprite_accessory/ears/alfar/pointed = list())
	)

/decl/bodytype/human/alfar/masculine
	name = "masculine"
	uid = "bodytype_alfar_masc"
	associated_gender = MALE
	onmob_state_modifiers = null

/mob/living/human/get_icon_scale_mult()
	. = ..()
	if(species?.uid == /decl/species/alfar::uid)
		.[1] *= 0.90
		.[2] *= 0.90
