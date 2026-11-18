/decl/bodytype/human/promethean
	name = "feminine"
	uid = "bodytype_promethean_fem"
	icon_base = 'icons/mob/human_races/species/human/body_female.dmi'
	icon_deformed = 'icons/mob/human_races/species/human/deformed_body_female.dmi'
	associated_gender = FEMALE
	onmob_state_modifiers = list((slot_w_uniform_str) = "f")
	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | RADIATION_GLOWS
	base_color = "#05fffb"
	base_eye_color = "#05fffb"
	body_flags = BODY_FLAG_NO_DNA
	age_descriptor = /datum/appearance_descriptor/age/promethean
	override_limb_types = list(
		BP_CHEST = /obj/item/organ/external/chest/unbreakable/slime,
		BP_GROIN = /obj/item/organ/external/groin/unbreakable/slime,
		BP_HEAD = /obj/item/organ/external/head/unbreakable/slime,
		BP_L_ARM = /obj/item/organ/external/arm/unbreakable/slime,
		BP_R_ARM = /obj/item/organ/external/arm/right/unbreakable/slime,
		BP_L_LEG = /obj/item/organ/external/leg/unbreakable/slime,
		BP_R_LEG = /obj/item/organ/external/leg/right/unbreakable/slime,
		BP_L_HAND = /obj/item/organ/external/hand/unbreakable/slime,
		BP_R_HAND = /obj/item/organ/external/hand/right/unbreakable/slime,
		BP_L_FOOT = /obj/item/organ/external/foot/unbreakable/slime,
		BP_R_FOOT = /obj/item/organ/external/foot/right/unbreakable/slime
	)
	has_organ = list(
		BP_BRAIN = /obj/item/organ/internal/brain/slime
	)

/decl/bodytype/human/promethean/masculine
	name = "masculine"
	uid = "bodytype_promethean_masc"
	icon_base = 'icons/mob/human_races/species/human/body_male.dmi'
	icon_deformed = 'icons/mob/human_races/species/human/deformed_body_male.dmi'
	associated_gender = MALE
	onmob_state_modifiers = null
