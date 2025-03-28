//Please make sure to:
//return FALSE: You are not going away, stop asking me to digest.
//return non-negative integer: Amount of nutrition/charge gained (scaled to nutrition, other end can multiply for charge scale).

// Ye default implementation.
/obj/item/proc/digest_act(atom/movable/item_storage = null, splashing=0) // RS Edit || Chomp Port
	if(istype(item_storage, /obj/item/device/dogborg/sleeper))
		if(istype(src, /obj/item/device/pda))
			var/obj/item/device/pda/P = src
			if(P.id)
				P.id = null

		for(var/mob/living/voice/V in possessed_voice) // Delete voices.
			V.Destroy() //Destroy the voice.
		for(var/mob/living/M in contents)//Drop mobs from objects(shoes) before deletion
			M.forceMove(item_storage)
		for(var/obj/item/O in contents)
			if(istype(O, /obj/item/weapon/storage/internal)) //Dump contents from dummy pockets.
				for(var/obj/item/SO in O)
					if(item_storage)
						SO.forceMove(item_storage)
					qdel(O)
			else if(item_storage)
				O.forceMove(item_storage)
		GLOB.items_digested_roundstat++
		qdel(src)
		return w_class

	var/g_damage = 1
	if(digest_stage == null)
		digest_stage = w_class

	if(isbelly(item_storage))
		var/obj/belly/B = item_storage
		if(splashing > 0) // Reagent bellies || RS Add || Chomp Port
			g_damage = 0.25 * splashing
		else
			g_damage = 0.25 * (B.digest_brute + B.digest_burn)
		if(g_damage <= 0) // Reagent bellies || RS Add || Chomp Port
			return FALSE
	if(digest_stage > 0)
		if(g_damage > digest_stage)
			g_damage = digest_stage
		digest_stage -= g_damage
	if(digest_stage <= 0)
		if(istype(src, /obj/item/device/pda))
			var/obj/item/device/pda/P = src
			if(P.id)
				P.id = null
		for(var/mob/living/voice/V in possessed_voice) // Delete voices.
			V.Destroy() //Destroy the voice.
		for(var/mob/living/M in contents)//Drop mobs from objects(shoes) before deletion
			M.forceMove(item_storage)
		for(var/obj/item/O in contents)
			if(istype(O,/obj/item/weapon/storage/internal)) //Dump contents from dummy pockets.
				for(var/obj/item/SO in O)
					if(item_storage)
						SO.forceMove(item_storage)
					qdel(O)
			else if(item_storage)
				O.forceMove(item_storage)
		if(istype(src,/obj/item/stack))
			var/obj/item/stack/S = src
			if(S.get_amount() <= 1)
				qdel(src)
			else
				S.use(1)
				digest_stage = w_class
		else
			GLOB.items_digested_roundstat++
			if(isbelly(item_storage)) //RS Edit start: Ports item digestion sounds || CHOMPStation PR 5858
				var/soundfile
				if(w_class >= 4)
					soundfile = pick('sound/vore/shortgurgles/gurgle_L1.ogg', 'sound/vore/shortgurgles/gurgle_L2.ogg', 'sound/vore/shortgurgles/gurgle_L3.ogg')
				else if(w_class >= 3)
					soundfile = pick('sound/vore/shortgurgles/gurgle_M1.ogg', 'sound/vore/shortgurgles/gurgle_M2.ogg', 'sound/vore/shortgurgles/gurgle_M3.ogg')
				else
					soundfile = pick('sound/vore/shortgurgles/gurgle_S1.ogg', 'sound/vore/shortgurgles/gurgle_S2.ogg', 'sound/vore/shortgurgles/gurgle_S3.ogg')
				playsound(src, soundfile, vary = 1, vol=75, falloff = VORE_SOUND_FALLOFF, preference = /datum/client_preference/digestion_noises, volume_channel = VOLUME_CHANNEL_VORE) //RS edit end
			qdel(src)
	if(g_damage > w_class)
		return w_class
	return g_damage

/////////////
// Some indigestible stuff
/////////////
/obj/item/weapon/hand_tele/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/device/aicard/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/device/paicard/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/gun/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/pinpointer/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/areaeditor/blueprints/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/weapon/disk/nuclear/digest_act(var/atom/movable/item_storage = null)
	return FALSE
/obj/item/device/perfect_tele_beacon/digest_act(var/atom/movable/item_storage = null)
	return FALSE //Sorta important to not digest your own beacons.
/obj/item/organ/internal/brain/slime/digest_act(var/atom/movable/item_storage = null)
	return FALSE //so prometheans can be recovered

/////////////
// Some special treatment
/////////////

/obj/item/weapon/card/id/digest_act(atom/movable/item_storage = null)
	desc = "A partially digested card that has seen better days. The damage appears to be only cosmetic."
	if(!sprite_stack || !istype(sprite_stack) || !(sprite_stack.len))
		icon = 'icons/obj/card_vr.dmi'
		icon_state = "[initial(icon_state)]_digested"
	else
		if(!sprite_stack.Find("digested"))
			sprite_stack += "digested"
	update_icon()
	return FALSE

/obj/item/weapon/reagent_containers/food/digest_act(atom/movable/item_storage = null)
	if(isbelly(item_storage))
		var/obj/belly/B = item_storage
		if(ishuman(B.owner))
			var/mob/living/carbon/human/H = B.owner
			reagents.trans_to_holder(H.ingested, (reagents.total_volume * 0.5), 1, 0)
		else if(isrobot(B.owner))
			var/mob/living/silicon/robot/R = B.owner
			R.cell.charge += 150
		qdel(src)
		return w_class
	. = ..()

/obj/item/weapon/holder/digest_act(atom/movable/item_storage = null)
	for(var/mob/living/M in contents)
		if(item_storage)
			M.forceMove(item_storage)
	held_mob = null

	. = ..()

/obj/item/organ/digest_act(atom/movable/item_storage = null)
	if((. = ..()))
		if(isbelly(item_storage))
			. *= 3
		else
			. += 30 //Organs give a little more

/obj/item/weapon/storage/digest_act(atom/movable/item_storage = null)
	for(var/obj/item/I in contents)
		I.screen_loc = null

	. = ..()

/////////////
// Some more complicated stuff
/////////////
/obj/item/device/mmi/digital/posibrain/digest_act(atom/movable/item_storage = null)
	//Replace this with a VORE setting so all types of posibrains can/can't be digested on a whim
	return FALSE

/obj/item/organ/internal/nano/digest_act(atom/movable/item_storage = null)
	//Make proteans recoverable too
	return FALSE

// Gradual damage measurement
/obj/item
	var/digest_stage = null
