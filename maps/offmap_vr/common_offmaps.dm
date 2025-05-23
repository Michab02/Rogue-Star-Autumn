/// Away Missions
#if AWAY_MISSION_TEST
#include "../expedition_vr/beach/beach.dmm"
#include "../expedition_vr/beach/cave.dmm"
#include "../expedition_vr/alienship/alienship.dmm"
#include "../expedition_vr/aerostat/aerostat.dmm"
#include "../expedition_vr/aerostat/surface.dmm"
#include "../expedition_vr/space/debrisfield.dmm"
#include "../expedition_vr/space/fueldepot.dmm"
#include "../expedition_vr/snowbase/snowbase.dmm"
#include "../expedition_vr/snowbase/snowbase_glacier.dmm"
#endif

#include "../expedition_vr/beach/_beach.dm"
/datum/map_template/common_lateload/away_beach
	name = "Desert Planet - Z1 Beach"
	desc = "The beach away mission."
	mappath = 'maps/expedition_vr/beach/beach.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_beach

/datum/map_z_level/common_lateload/away_beach
	name = "Away Mission - Desert Beach"
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/datum/map_z_level/common_lateload/away_beach/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_beach"]
	. = ..()	//RS ADD END

/datum/map_template/common_lateload/away_beach_cave
	name = "Desert Planet - Z2 Cave"
	desc = "The beach away mission's cave."
	mappath = 'maps/expedition_vr/beach/cave.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_beach_cave

/datum/map_template/common_lateload/away_beach_cave/on_map_loaded(z)
	. = ..()
	seed_submaps(list(using_map.z_list["z_beach_cave"]), 120, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)	//RS EDIT
	//seed_submaps(list(using_map.z_list["z_beach_cave"]), 70, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/deep)	//RS EDIT

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, using_map.z_list["z_beach_cave"], world.maxx - 4, world.maxy - 4)	//RS EDIT
	new /datum/random_map/noise/ore/beachmine(null, 1, 1, using_map.z_list["z_beach_cave"], 64, 64)	//RS EDIT

/datum/map_z_level/common_lateload/away_beach_cave
	name = "Away Mission - Desert Cave"
	base_turf = /turf/simulated/floor/outdoors/rocks/caves

/datum/map_z_level/common_lateload/away_beach_cave/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_beach_cave"]
	. = ..()	//RS EDIT END

/obj/effect/step_trigger/zlevel_fall/beach
	var/static/target_z


#include "../expedition_vr/alienship/_alienship.dm"
/datum/map_template/common_lateload/away_alienship
	name = "Alien Ship - Z1 Ship"
	desc = "The alien ship away mission."
	mappath = 'maps/expedition_vr/alienship/alienship.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_alienship

/datum/map_z_level/common_lateload/away_alienship
	name = "Away Mission - Alien Ship"

/datum/map_z_level/common_lateload/away_aerostat
	name = "Away Mission - Aerostat"
	base_turf = /turf/unsimulated/floor/sky/virgo2_sky

/datum/map_z_level/common_lateload/away_aerostat/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_aerostat"]
	. = ..()	//RS EDIT END

/datum/map_template/common_lateload/away_aerostat_surface
	name = "Remmi Aerostat - Z2 Surface"
	desc = "The surface from the Virgo 2 Aerostat."
	mappath = 'maps/expedition_vr/aerostat/surface.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_aerostat_surface

/datum/map_template/common_lateload/away_aerostat_surface/on_map_loaded(z)
	. = ..()
	seed_submaps(list(using_map.z_list["z_aerostat_surface"]), 120, /area/offmap/aerostat/surface/unexplored, /datum/map_template/virgo2)	//RS EDIT
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, using_map.z_list["z_aerostat_surface"], world.maxx - 4, world.maxy - 4)	//RS EDIT
	new /datum/random_map/noise/ore/virgo2(null, 1, 1, using_map.z_list["z_aerostat_surface"], 64, 64)	//RS EDIT

/datum/map_z_level/common_lateload/away_aerostat_surface
	name = "Away Mission - Aerostat Surface"
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/virgo2

/datum/map_z_level/common_lateload/away_aerostat_surface/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_aerostat_surface"]
	. = ..()	//RS ADD END

#include "../expedition_vr/space/_debrisfield.dm"
#include "../expedition_vr/space/_fueldepot.dm"
#include "../submaps/pois_vr/debris_field/_templates.dm"
#include "../submaps/pois_vr/debris_field/debrisfield_things.dm"
/datum/map_template/common_lateload/away_debrisfield
	name = "Debris Field - Z1 Space"
	desc = "The Virgo 3 Debris Field away mission."
	mappath = 'maps/expedition_vr/space/debrisfield.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_debrisfield

/datum/map_template/common_lateload/away_debrisfield/on_map_loaded(z)
	. = ..()
	//Commented out until we actually get POIs
	seed_submaps(list(using_map.z_list["z_debrisfield"]), 400, /area/space, /datum/map_template/debrisfield)	//RS EDIT

/datum/map_z_level/common_lateload/away_debrisfield
	name = "Away Mission - Debris Field"

/datum/map_z_level/common_lateload/away_debrisfield/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_debrisfield"]
	. = ..()	//RS ADD END

/datum/map_template/common_lateload/away_fueldepot
	name = "Fuel Depot - Z1 Space"
	desc = "An unmanned fuel depot floating in space."
	mappath = 'maps/expedition_vr/space/fueldepot.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_fueldepot

/datum/map_z_level/common_lateload/away_fueldepot
	name = "Away Mission - Fuel Depot"

/datum/map_z_level/common_lateload/away_fueldepot/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_fueldepot"]
	. = ..()	//RS ADD END

///////////////////////////////////////////////////////////////////////////////////////
//Snowbase

#include "../expedition_vr/snowbase/snowbase.dm"
/datum/map_template/common_lateload/away_snowbase
	name = "Virgo 5"
	desc = "A small research outpost owned by NT on Virgo 5."
	mappath = 'maps/expedition_vr/snowbase/snowbase.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_snowbase

/datum/map_z_level/common_lateload/away_snowbase
	name = "Virgo 5"

/datum/map_z_level/common_lateload/away_snowbase/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_snowbase"]
	. = ..()	//RS ADD END

/datum/map_template/common_lateload/away_snowbase/on_map_loaded(z)
	. = ..()
	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, using_map.z_list["z_snowbase"], world.maxx - 4, world.maxy - 4)	//RS EDIT
	new /datum/random_map/noise/ore/snowbasemine(null, 1, 1, using_map.z_list["z_snowbase"], 64, 64)	//RS EDIT

//The glacier, which is mostly POIs and mining
/datum/map_template/common_lateload/away_snowbase_glacier
	name = "Virgo 5 Glacier"
	desc = "A strange glacier near the NT outpost."
	mappath = 'maps/expedition_vr/snowbase/snowbase_glacier.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_snowbase_glacier

/datum/map_z_level/common_lateload/away_snowbase_glacier
	name = "Virgo 5 Glacier"

/datum/map_z_level/common_lateload/away_snowbase_glacier/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_glacier"]
	. = ..()	//RS ADD END

/datum/map_template/common_lateload/away_snowbase_glacier/on_map_loaded(z)
	. = ..()
	seed_submaps(list(using_map.z_list["z_glacier"]), 120, /area/tether_away/snowbase/outside/glacier/unexplored, /datum/map_template/surface/glacier)	//RS EDIT

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, using_map.z_list["z_glacier"], world.maxx - 4, world.maxy - 4)	//RS EDIT
	new /datum/random_map/noise/ore/snowbasemine(null, 1, 1, using_map.z_list["z_glacier"], 64, 64)	//RS EDIT

//////////////////////////////////////////////////////////////////////////////////////
// Gateway submaps go here

/obj/effect/overmap/visitable/sector/common_gateway
	name = "Unknown"
	desc = "Approach and perform a scan to obtain further information."
	icon_state = "object" //or "globe" for planetary stuff
	known = FALSE

/datum/map_template/common_lateload/gateway
	name = "Gateway Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = /datum/map_z_level/common_lateload/gateway_destination

/datum/map_z_level/common_lateload/gateway_destination
	name = "Gateway Destination"

/datum/map_z_level/common_lateload/gateway_destination/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_gateway"]
	. = ..()	//RS ADD END

/*			// Removed due to heavy merc presence
#include "../gateway_vr/snow_outpost.dm"
/datum/map_template/common_lateload/gateway/snow_outpost
	name = "Snow Outpost"
	desc = "Big snowy area with various outposts."
	mappath = 'maps/gateway_vr/snow_outpost.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/gateway_destination
*/
#include "../gateway_vr/zoo.dm"
/datum/map_template/common_lateload/gateway/zoo
	name = "Gateway - Zoo"
	desc = "Gigantic space zoo"
	mappath = 'maps/gateway_vr/zoo_b.dmm'

#include "../gateway_vr/carpfarm.dm"
/datum/map_template/common_lateload/gateway/carpfarm
	name = "Gateway - Carp Farm"
	desc = "Asteroid base surrounded by carp"
	mappath = 'maps/gateway_vr/carpfarm.dmm'

#include "../gateway_vr/snowfield.dm"
/datum/map_template/common_lateload/gateway/snowfield
	name = "Gateway - Snow Field"
	desc = "An old base in middle of snowy wasteland"
	mappath = 'maps/gateway_vr/snowfield.dmm'

#include "../gateway_vr/listeningpost.dm"
/datum/map_template/common_lateload/gateway/listeningpost
	name = "Gateway - Listening Post"
	desc = "Asteroid-bound mercenary listening post"
	mappath = 'maps/gateway_vr/listeningpost.dmm'

#include "../gateway_vr/variable/honlethhighlands.dm"
/datum/map_template/common_lateload/gateway/honlethhighlands_a
	name = "Gateway - Honleth Highlands A"
	desc = "The cold surface of some planet."
	mappath = 'maps/gateway_vr/variable/honlethhighlands_a.dmm'

/datum/map_template/common_lateload/gateway/honlethhighlands_b
	name = "Gateway - Honleth Highlands B"
	desc = "The cold surface of some planet."
	mappath = 'maps/gateway_vr/variable/honlethhighlands_b.dmm'


#include "../gateway_vr/variable/arynthilake.dm"
/datum/map_template/common_lateload/gateway/arynthilake
	name = "Gateway - Arynthi Lake A"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilake_a.dmm'

/datum/map_template/common_lateload/gateway/arynthilakeunderground
	name = "Gateway - Arynthi Lake Underground A"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilakeunderground_a.dmm'

/datum/map_template/common_lateload/gateway/arynthilake_b
	name = "Gateway - Arynthi Lake B"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilake_b.dmm'

/datum/map_template/common_lateload/gateway/arynthilakeunderground_b
	name = "Gateway - Arynthi Lake Underground B"
	desc = "A grassy surface with some abandoned structures."
	mappath = 'maps/gateway_vr/variable/arynthilakeunderground_b.dmm'

#include "../gateway_vr/wildwest.dm"
/datum/map_template/common_lateload/gateway/wildwest
	name = "Gateway - Wild West"
	desc = "A classic."
	mappath = 'maps/gateway_vr/wildwest.dmm'

#include "../gateway_vr/lucky_7.dm"

/////////////////////////////////////////////////////////////////////////////////////

/datum/map_template/common_lateload/om_adventure
	name = "OM Adventure Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = null

/datum/map_z_level/common_lateload/om_adventure_destination
	name = "OM Adventure Destination"

/datum/map_z_level/common_lateload/om_adventure_destination/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_om_adventure"]
	. = ..()	//RS ADD END

#include "../om_adventure/grasscave.dm"
/datum/map_template/common_lateload/om_adventure/grasscave
	name = "Grass Cave"
	desc = "Looks like a cave with some grass in it."
	mappath = 'maps/om_adventure/grasscave.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/om_adventure_destination

/datum/map_template/common_lateload/om_adventure/grasscave/on_map_loaded(z)
	. = ..()
	seed_submaps(list(z), 60, /area/om_adventure/grasscave/unexplored, /datum/map_template/om_adventure/outdoor)
	seed_submaps(list(z), 60, /area/om_adventure/grasscave/rocks, /datum/map_template/om_adventure/cave)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, z, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/grasscave(null, 1, 1, z, 64, 64)

//////////////////////////////////////////////////////////////////////////////////////

/datum/map_template/common_lateload/redgate
	name = "Redgate Submap"
	desc = "Please do not use this."
	mappath = null
	associated_map_datum = /datum/map_z_level/common_lateload/redgate_destination

/datum/map_z_level/common_lateload/redgate_destination
	name = "Redgate Destination"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED

/datum/map_z_level/common_lateload/redgate_destination/New(datum/map/map, mapZ)	//RS ADD START - Map swap related
	z = using_map.z_list["z_redgate"]
	. = ..()	//RS ADD END

/datum/map_template/common_lateload/redgate/on_map_loaded(z)
	. = ..()
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, using_map.z_list["z_redgate"], world.maxx, world.maxy)	//RS EDIT
	new /datum/random_map/noise/ore(null, 1, 1, using_map.z_list["z_redgate"], 64, 64)	//RS EDIT

/datum/map_template/common_lateload/redgate/teppi_ranch
	name = "Redgate - Teppi Ranch"
	desc = "An abandoned teppi ranch!"
	mappath = 'maps/redgate/teppiranch.dmm'

/datum/map_template/common_lateload/redgate/innland
	name = "Redgate - Innland"
	desc = "Caves and grass and a tavern, woah!"
	mappath = 'maps/redgate/innland.dmm'

/datum/map_template/common_lateload/redgate/abandonedisland
	name = "Redgate - Abandoned Island"
	desc = "It seems like it used to be people here!"
	mappath = 'maps/redgate/abandonedisland.dmm'

/datum/map_template/common_lateload/redgate/darkadventure
	name = "Redgate - Dark Adventure"
	desc = "This place seems broken!"
	mappath = 'maps/redgate/darkadventure2.dmm'

/datum/map_template/common_lateload/redgate/stardog
	name = "Redgate - Star Dog"
	desc = "That's a big dog!"
	mappath = 'maps/redgate/stardog.dmm'

#include "../redgate/eggnogtown.dm"
/datum/map_template/common_lateload/redgate/eggnogtown
	name = "Redgate - Eggnog Town"
	desc = "A comfortable snowy town."
	mappath = 'maps/redgate/eggnogtown.dmm'

/datum/map_template/common_lateload/redgate/eggnogtownunderground
	name = "Redgate - Eggnog Town Underground"
	desc = "A comfortable snowy town."
	mappath = 'maps/redgate/eggnogtownunderground.dmm'

/datum/map_template/common_lateload/redgate/hotsprings
	name = "Redgate - Hotsprings"
	desc = "This place is rather cosy for somewhere so abandoned!"
	mappath = 'maps/redgate/hotsprings.dmm'

/datum/map_template/common_lateload/redgate/cybercity
	name = "Redgate - Rain City"
	desc = "A strange city on lockdown."
	mappath = 'maps/redgate/cybercity.dmm'

/datum/map_template/common_lateload/redgate/islands
	name = "Redgate - Islands"
	desc = "A series of islands out in the ocean."
	mappath = 'maps/redgate/islands.dmm'

/datum/map_template/common_lateload/redgate/islands_underwater
	name = "Redgate - Islands Underwater"
	desc = "A series of islands out in the ocean."
	mappath = 'maps/redgate/islands_underwater.dmm'

/obj/effect/landmark/map_data/islands
	height = 2

/datum/map_template/common_lateload/redgate/train
	name = "Redgate - Moving Train"
	desc = "A long train travelling to who-knows-where."
	mappath = 'maps/redgate/train.dmm'

/datum/map_template/common_lateload/redgate/train_upper
	name = "Redgate - Moving Train Upper Level"
	desc = "A long train travelling to who-knows-where."
	mappath = 'maps/redgate/train_upper.dmm'

/obj/effect/landmark/map_data/train
	height = 2

/datum/map_template/common_lateload/redgate/fantasy
	name = "Redgate - Fantasy Town"
	desc = "A fantasy town full of low tech stuff."
	mappath = 'maps/redgate/fantasy.dmm'

/datum/map_template/common_lateload/redgate/fantasy_dungeon
	name = "Redgate - Fantasy Dungeon"
	desc = "A fantasy dungeon with lots of monsters and loot."
	mappath = 'maps/redgate/fantasy_dungeon.dmm'

/obj/effect/landmark/map_data/fantasy
	height = 2
// RS EDIT START
/datum/map_template/common_lateload/redgate/snowglobe
	name = "Redgate - Snowglobe"
	desc = "Avery normal snowglobe!"
	mappath = 'maps/redgate/snowglobe-b.dmm'

/datum/map_template/common_lateload/redgate/petisland
	name = "Redgate - Pet Island"
	desc = "A cozy island with a bunch of potential pets on it!"
	mappath = 'maps/redgate/petisland.dmm'

/datum/map_template/common_lateload/redgate/northstar
	name = "Redgate - North Star"
	desc = "A mysterious gloomy land."
	mappath = 'maps/redgate/da2ns.dmm'

/datum/map_template/common_lateload/redgate/pizzaria
	name = "Redgate - Pizzaria"
	desc = "It doesn't look anything like a pizzaria..."
	mappath = 'maps/redgate/pizzaria/spooky2.dmm'

// RS EDIT END

//////////////////////////////////////////////////////////////////////////////////////
// Admin-use z-levels for loading whenever an admin feels like
#if AWAY_MISSION_TEST
#include "../submaps/admin_use_vr/spa.dmm"
#endif
#include "../submaps/admin_use_vr/fun.dm"
/datum/map_template/common_lateload/fun/spa
	name = "Space Spa"
	desc = "A pleasant spa located in a spaceship."
	mappath = 'maps/submaps/admin_use_vr/spa.dmm'

	associated_map_datum = /datum/map_z_level/common_lateload/fun/spa

/datum/map_z_level/common_lateload/fun/spa
	name = "Spa"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED

//////////////////////////////////////////////////////////////////////////////////////
// Code Shenanigans for Tether lateload maps
/datum/map_template/common_lateload
	allow_duplicates = FALSE
//	var/associated_map_datum //RS REMOVE

/datum/map_template/common_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_z_level/common_lateload
	z = 0

/datum/map_z_level/common_lateload/New(var/datum/map/map, mapZ)
	if(mapZ && !z)
		z = mapZ
	return ..(map)

/obj/effect/step_trigger/zlevel_fall //Don't ever use this, only use subtypes.Define a new var/static/target_z on each
	affect_ghosts = 1

/obj/effect/step_trigger/zlevel_fall/Initialize()
	. = ..()

	if(istype(get_turf(src), /turf/simulated/floor))
		src:target_z = z
		return INITIALIZE_HINT_QDEL

/obj/effect/step_trigger/zlevel_fall/Trigger(var/atom/movable/A) //mostly from /obj/effect/step_trigger/teleporter/planetary_fall, step_triggers.dm L160
	if(!src:target_z)
		return

	var/attempts = 100
	var/turf/simulated/T
	while(attempts && !T)
		var/turf/simulated/candidate = locate(rand(5,world.maxx-5),rand(5,world.maxy-5),src:target_z)
		if(candidate.density)
			attempts--
			continue

		T = candidate
		break

	if(!T)
		return

	if(isobserver(A))
		A.forceMove(T) // Harmlessly move ghosts.
		return

	A.forceMove(T)
	if(isliving(A)) // Someday, implement parachutes.  For now, just turbomurder whoever falls.
		message_admins("\The [A] fell out of the sky.")
		var/mob/living/L = A
		L.fall_impact(T, 42, 90, FALSE, TRUE)	//You will not be defibbed from this.

/////////////////////////////
/obj/tether_away_spawner
	name = "RENAME ME, JERK"
	desc = "Spawns the mobs!"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	invisibility = 101
	mouse_opacity = 0
	density = 0
	anchored = 1

	//Weighted with values (not %chance, but relative weight)
	//Can be left value-less for all equally likely
	var/list/mobs_to_pick_from

	//When the below chance fails, the spawner is marked as depleted and stops spawning
	var/prob_spawn = 100	//Chance of spawning a mob whenever they don't have one
	var/prob_fall = 5		//Above decreases by this much each time one spawns

	//Settings to help mappers/coders have their mobs do what they want in this case
	var/faction				//To prevent infighting if it spawns various mobs, set a faction
	var/atmos_comp			//TRUE will set all their survivability to be within 20% of the current air
	//var/guard				//# will set the mobs to remain nearby their spawn point within this dist

	//Internal use only
	var/mob/living/simple_mob/my_mob
	var/depleted = FALSE

/obj/tether_away_spawner/Initialize()
	. = ..()

	if(!LAZYLEN(mobs_to_pick_from))
		error("Mob spawner at [x],[y],[z] ([get_area(src)]) had no mobs_to_pick_from set on it!")
		initialized = TRUE
		return INITIALIZE_HINT_QDEL
	START_PROCESSING(SSobj, src)

/obj/tether_away_spawner/process()
	if(my_mob && my_mob.stat != DEAD)
		return //No need

	for(var/mob/living/L in view(src,world.view))
		if(L.client)
			return //I'll wait.

	if(prob(prob_spawn))
		prob_spawn -= prob_fall
		var/picked_type = pickweight(mobs_to_pick_from)
		my_mob = new picked_type(get_turf(src))
		my_mob.low_priority = TRUE

		if(faction)
			my_mob.faction = faction

		if(atmos_comp)
			var/turf/T = get_turf(src)
			var/datum/gas_mixture/env = T.return_air()
			if(env)
				if(my_mob.minbodytemp > env.temperature)
					my_mob.minbodytemp = env.temperature * 0.8
				if(my_mob.maxbodytemp < env.temperature)
					my_mob.maxbodytemp = env.temperature * 1.2

				var/list/gaslist = env.gas
				if(my_mob.min_oxy)
					my_mob.min_oxy = gaslist["oxygen"] * 0.8
				if(my_mob.min_tox)
					my_mob.min_tox = gaslist["phoron"] * 0.8
				if(my_mob.min_n2)
					my_mob.min_n2 = gaslist["nitrogen"] * 0.8
				if(my_mob.min_co2)
					my_mob.min_co2 = gaslist["carbon_dioxide"] * 0.8
				if(my_mob.max_oxy)
					my_mob.max_oxy = gaslist["oxygen"] * 1.2
				if(my_mob.max_tox)
					my_mob.max_tox = gaslist["phoron"] * 1.2
				if(my_mob.max_n2)
					my_mob.max_n2 = gaslist["nitrogen"] * 1.2
				if(my_mob.max_co2)
					my_mob.max_co2 = gaslist["carbon_dioxide"] * 1.2
/* //VORESTATION AI TEMPORARY REMOVAL
		if(guard)
			my_mob.returns_home = TRUE
			my_mob.wander_distance = guard
*/
		return
	else
		STOP_PROCESSING(SSobj, src)
		depleted = TRUE
		return

//Shadekin spawner. Could have them show up on any mission, so it's here.
//Make sure to put them away from others, so they don't get demolished by rude mobs.
/obj/tether_away_spawner/shadekin
	name = "Shadekin Spawner"
	icon = 'icons/mob/vore_shadekin.dmi'
	icon_state = "spawner"

	faction = "shadekin"
	prob_spawn = 1
	prob_fall = 1
	//guard = 10 //Don't wander too far, to stay alive.
	mobs_to_pick_from = list(
		/mob/living/simple_mob/shadekin
	)

//////////////////////////////////////////////////////////////////////////////
//Antag/Event/ERT Areas

#include "../submaps/admin_use_vr/ert.dm"
#include "../submaps/admin_use_vr/mercship.dm"
#include "../submaps/admin_use_vr/salamander_trader.dm"

/datum/map_template/admin_use/ert
	name = "Special Area - ERT"
	desc = "It's the ERT ship! Lorge."
	mappath = 'maps/submaps/admin_use_vr/ert.dmm'

/datum/map_template/admin_use/trader
	name = "Special Area - Trader"
	desc = "Big trader ship."
	mappath = 'maps/submaps/admin_use_vr/tradeship.dmm'

/datum/map_template/admin_use/salamander_trader
	name = "Special Area - Salamander Trader"
	desc = "Modest trader ship."
	mappath = 'maps/submaps/admin_use_vr/salamander_trader.dmm'

/datum/map_template/admin_use/mercenary
	name = "Special Area - Merc Ship"
	desc = "Prepare tae be boarded, arr!"
	mappath = 'maps/submaps/admin_use_vr/kk_mercship.dmm'

/datum/map_template/admin_use/skipjack
	name = "Special Area - Skipjack Base"
	desc = "Stinky!"
	mappath = 'maps/submaps/admin_use_vr/skipjack.dmm'

/datum/map_template/admin_use/thunderdome
	name = "Special Area - Thunderdome"
	desc = "Thunderrrrdomeee"
	mappath = 'maps/submaps/admin_use_vr/thunderdome.dmm'

/datum/map_template/admin_use/wizardbase
	name = "Special Area - Wizard Base"
	desc = "Wingardium Levosia"
	mappath = 'maps/submaps/admin_use_vr/wizard.dmm'

/datum/map_template/admin_use/dojo
	name = "Special Area - Ninja Dojo"
	desc = "Sneaky"
	mappath = 'maps/submaps/admin_use_vr/dojo.dmm'

//////////////////////////////////////////////////////////////////////////////
//Overmap ship spawns

#include "../offmap_vr/om_ships/hybridshuttle.dm"
#include "../offmap_vr/om_ships/screebarge.dm"
#include "../offmap_vr/om_ships/aro.dm"
#include "../offmap_vr/om_ships/aro2.dm"
#include "../offmap_vr/om_ships/aro3.dm"
#include "../offmap_vr/om_ships/bearcat.dm"
#include "../offmap_vr/om_ships/cruiser.dm"
#include "../offmap_vr/om_ships/vespa.dm"
#include "../offmap_vr/om_ships/generic_shuttle.dm"
#include "../offmap_vr/om_ships/salamander.dm"
#include "../offmap_vr/om_ships/geckos.dm"
#include "../offmap_vr/om_ships/mackerels.dm"
#include "../offmap_vr/om_ships/mercenarybase.dm"
#include "../offmap_vr/om_ships/mercship.dm"
#include "../offmap_vr/om_ships/curashuttle.dm"
#include "../offmap_vr/om_ships/itglight.dm"
#include "../offmap_vr/om_ships/abductor.dm"
#include "../offmap_vr/om_ships/lunaship.dm"
#include "../offmap_vr/om_ships/sdf_corvettes.dm"

//////////////////////////////////////////////////////////////////////////////
//Capsule deployed ships
#include "../offmap_vr/om_ships/shelter_5.dm"
#include "../offmap_vr/om_ships/shelter_6.dm"

//////////////////////////////////////////////////////////////////////////////
//Offmap Spawn Locations
#include "../offmap_vr/talon/talon_v2.dm"
#include "../offmap_vr/talon/talon_v2_areas.dm"

#if MAP_TEST
#include "../offmap_vr/talon/talon_v2.dmm"
#endif

/datum/map_template/common_lateload/offmap/talon_v2
	name = "Offmap Ship - Talon V2"
	desc = "Offmap spawn ship, the Talon."
	mappath = 'maps/offmap_vr/talon/talon_v2.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/talon_v2

/datum/map_z_level/common_lateload/talon_v2
	name = "Talon"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_PERSIST|MAP_LEVEL_MAPPABLE
	base_turf = /turf/space

/datum/map_z_level/common_lateload/talon_v2/New(datum/map/map, mapZ)		//RS ADD START - Map swap related
	z = using_map.z_list["z_offmap1"]
	. = ..()

/datum/planet/virgo3b/New()
	expected_z_levels = list(
		using_map.z_list["z_centcom"]
	)

	if(using_map.name == "StellarDelight")
		expected_z_levels += list(Z_LEVEL_SPACE_ROCKS)
	. = ..()

/datum/planet/virgo4/New()
	expected_z_levels = list(
		using_map.z_list["z_beach"]
	)
	. = ..()

/datum/planet/snowbase/New()
	expected_z_levels = list(
		using_map.z_list["z_snowbase"],
		using_map.z_list["z_glacier"]
	)
	. = ..()

/////FOR CENTCOMM (at least)/////
/obj/effect/overmap/visitable/sector/virgo3b
	name = "Virgo 3B"
	desc = "Full of phoron, and home to the NSB Adephagia."
	scanner_desc = @{"[i]Registration[/i]: NSB Adephagia
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen Base, authorized personnel only"}
	known = TRUE
	in_space = TRUE

	icon = 'icons/obj/overmap_vr.dmi'
	icon_state = "virgo3b"

	skybox_icon = 'icons/skybox/virgo3b.dmi'
	skybox_icon_state = "small"
	skybox_pixel_x = 0
	skybox_pixel_y = 0

	initial_restricted_waypoints = list("Central Command Shuttlepad" = list("cc_shuttlepad"))

	extra_z_levels = list(Z_LEVEL_SPACE_ROCKS)
	var/mob_announce_cooldown = 0

/////SD Starts at V3b to pick up crew refuel and repair (And to make sure it doesn't spawn on hazards)
/obj/effect/overmap/visitable/sector/virgo3b/Initialize()
	. = ..()
	if(using_map.name == "StellarDelight")
		initial_generic_waypoints = list("sr-c","sr-n","sr-s")
		for(var/obj/effect/overmap/visitable/ship/stellar_delight/sd in world)
			sd.forceMove(loc, SOUTH)

/obj/effect/overmap/visitable/sector/virgo3b/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/virgo3b/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)

/obj/effect/overmap/visitable/sector/virgo3b/proc/announce_atc(var/atom/movable/AM, var/going = FALSE)
	if(istype(AM, /obj/effect/overmap/visitable/ship/simplemob))
		if(world.time < mob_announce_cooldown)
			return
		else
			mob_announce_cooldown = world.time + 5 MINUTES
	var/message = "Sensor contact for vessel '[AM.name]' has [going ? "left" : "entered"] ATC control area."
	//For landables, we need to see if their shuttle is cloaked
	if(istype(AM, /obj/effect/overmap/visitable/ship/landable))
		var/obj/effect/overmap/visitable/ship/landable/SL = AM //Phew
		var/datum/shuttle/autodock/multi/shuttle = SSshuttles.shuttles[SL.shuttle]
		if(!istype(shuttle) || !shuttle.cloaked) //Not a multishuttle (the only kind that can cloak) or not cloaked
			atc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		atc.msg(message)

/obj/effect/overmap/visitable/sector/virgo3b/get_space_zlevels()
	if(using_map.name == "StellarDelight")
		return list(Z_LEVEL_SPACE_ROCKS)
	. = ..()

//RS ADD END
