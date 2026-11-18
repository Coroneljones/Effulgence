//Internal
/obj/item/organ/internal/brain/slime
	name = "slime core"
	desc = "A complex, organic knot of jelly and crystalline particles."
	icon = 'mods/content/xenobiology/icons/slimes/slime_extract.dmi'
	icon_state = ICON_STATE_WORLD

/obj/item/organ/internal/brain/slime/can_recover()
	return 0

// External
/obj/item/organ/external/chest/unbreakable/slime
	max_damage = 50
	limb_flags = ORGAN_FLAG_HEALS_OVERKILL

/obj/item/organ/external/chest/unbreakable/slime/get_natural_attacks()
	return GET_DECL(/decl/natural_attack/slime_glomp)

/obj/item/organ/external/groin/unbreakable/slime
	max_damage = 30
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_HEALS_OVERKILL

/obj/item/organ/external/groin/unbreakable/slime/get_natural_attacks()
	return GET_DECL(/decl/natural_attack/slime_glomp)

/obj/item/organ/external/arm/unbreakable/slime
	max_damage = 15

/obj/item/organ/external/arm/right/unbreakable/slime
	max_damage = 15

/obj/item/organ/external/leg/unbreakable/slime
	max_damage = 15

/obj/item/organ/external/leg/right/unbreakable/slime
	max_damage = 15

/obj/item/organ/external/foot/unbreakable/slime
	max_damage = 5

/obj/item/organ/external/foot/right/unbreakable/slime
	max_damage = 5

/obj/item/organ/external/hand/unbreakable/slime
	max_damage = 5

/obj/item/organ/external/hand/right/unbreakable/slime
	max_damage = 5

/obj/item/organ/external/head/unbreakable/slime
	max_damage = 15
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_HEALS_OVERKILL
