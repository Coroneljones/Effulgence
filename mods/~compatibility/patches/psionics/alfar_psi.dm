/decl/species/alfar/handle_post_spawn(mob/living/human/H)
	. = ..()
	H.set_psi_rank(PSI_COERCION, PSI_RANK_OPERANT, take_larger = TRUE)
