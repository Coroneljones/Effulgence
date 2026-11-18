/datum/mob_controller/slime/assess_target(var/mob/living/target)
	if(istype(target, /mob/living/human) && target.get_species()?.uid == "species_promethean")
		return FALSE
	return ..()