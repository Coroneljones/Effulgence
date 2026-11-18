/datum/appearance_descriptor/age/promethean
	chargen_min_index = 1
	chargen_max_index = 5
	standalone_value_descriptors = list(
		"a newly formed slime" = 1,
		"a young slime" = 2,
		"a mature slime" = 3,
		"an old slime" = 4,
		"an ancient slime" = 5
	)

/decl/species/promethean
	uid = "species_promethean"
	name = "Promethean"
	name_plural = "Prometheans"
	description = "Gelatinous people created by experiments with mutagenic slimes, Prometheans are resilient, regenerative, and highly sensitive to water."
	hidden_from_codex = FALSE
	show_ssd = "totally quiescent"
	death_message = "rapidly loses cohesion, splattering across the ground..."
	knockout_message = "collapses inwards, forming a disordered puddle of goo."
	remains_type = /obj/effect/decal/cleanable/ash
	primitive_form = null

	flesh_color = "#05fffb"
	blood_volume = 600
	brute_mod = 0.5
	burn_mod = 2
	oxy_mod = 0
	shock_vulnerability = -1
	total_health = 240
	rarity_value = 5
	hunger_factor = DEFAULT_HUNGER_FACTOR
	breath_type = null
	poison_types = null
	body_temperature = null
	gluttonous = GLUT_TINY | GLUT_SMALLER | GLUT_ITEM_ANYTHING | GLUT_PROJECTILE_VOMIT
	bump_flag = SLIME
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	species_flags = SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_ABSORB_ELECTRICITY
	spawn_flags = SPECIES_IS_RESTRICTED | SPECIES_CAN_JOIN

	available_pronouns = list(
		/decl/pronouns/pseudoplural,
		/decl/pronouns/female,
		/decl/pronouns/male
	)
	available_bodytypes = list(
		/decl/bodytype/human/promethean,
		/decl/bodytype/human/promethean/masculine
	)
	base_external_prosthetics_model = null
	preview_outfit = null

/decl/species/promethean/handle_death(var/mob/living/human/H)
	if(istype(H))
		addtimer(CALLBACK(H, /mob/proc/gib), 0)

/decl/species/promethean/handle_environment_special(var/mob/living/human/H)
	if(!istype(H))
		return

	var/turf/T = H.loc
	if(istype(T))
		for(var/obj/effect/decal/cleanable/C in T)
			if(H.nutrition < 300)
				H.adjust_nutrition(rand(10,20))
			qdel(C)

	for(var/obj/item/organ/internal/I in H.get_internal_organs())
		if(I.get_organ_damage() > 0)
			I.adjust_organ_damage(-5)
			if(prob(5))
				to_chat(H, SPAN_NOTICE("You feel a soothing sensation within your [I.name]..."))
			return

	var/decl/bodytype/root_bodytype = H.get_bodytype()
	if(istype(root_bodytype))
		for(var/limb_type in root_bodytype.has_limbs)
			var/obj/item/organ/external/limb = GET_EXTERNAL_ORGAN(H, limb_type)
			if(limb && !limb.is_usable() && !(limb.limb_flags & ORGAN_FLAG_HEALS_OVERKILL))
				H.remove_organ(limb)
				qdel(limb)
				limb = null
			if(!limb)
				var/list/organ_data = root_bodytype.has_limbs[limb_type]
				var/limb_path = organ_data["path"]
				limb = new limb_path(H)
				H.add_organ(limb, GET_EXTERNAL_ORGAN(H, limb.parent_organ), FALSE, FALSE)
				to_chat(H, SPAN_NOTICE("You feel a slithering sensation as your [limb.name] reforms."))
				H.update_body(TRUE)
				return

	if(H.getBruteLoss() || H.getFireLoss() || H.getOxyLoss() || H.getToxLoss())
		H.adjustBruteLoss(-5)
		H.adjustFireLoss(-5)
		H.adjustOxyLoss(-5)
		H.adjustToxLoss(-5)

/decl/species/promethean/get_species_blood_color(var/mob/living/human/H)
	return H ? H.get_skin_colour() : "#05ff9b"

/decl/species/promethean/get_species_flesh_color(var/mob/living/human/H)
	return H ? H.get_skin_colour() : flesh_color

/decl/species/promethean/get_additional_examine_text(var/mob/living/human/H)
	var/shock = global.stored_shock_by_ref["\ref[H]"]
	if(!shock)
		return
	switch(shock)
		if(1 to 10)
			return "\nThey are flickering gently with a little electrical activity."
		if(11 to 20)
			return "\nThey are glowing gently with moderate levels of electrical activity."
		if(21 to 35)
			return "\n" + SPAN_WARNING("They are glowing brightly with high levels of electrical activity.")
		else
			return "\n" + SPAN_DANGER("They are radiating massive levels of electrical activity!")
