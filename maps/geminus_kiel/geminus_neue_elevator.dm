// Elevator Areas.

//Science

/area/turbolift/science_north_top
	name = "Science Elevator 1"
	lift_floor_label = "Floor 1"
	lift_floor_name = "Administration"
	lift_announce_str = "Lift arriving at Administration, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/science_north_ground
	name = "Science Elevator 1"
	lift_floor_label = "Floor 2"
	lift_floor_name = "R&D Lab"
	lift_announce_str = "Lift arriving at Research & Development, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/science_north_lower_ground
	name = "Science Elevator 1"
	lift_floor_label = "Floor 3"
	lift_floor_name = "Xenobiology Lab"
	lift_announce_str = "Lift arriving at Xenobiology, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/science_south_top
	name = "Science Elevator 2"
	lift_floor_label = "Floor 1"
	lift_floor_name = "Administration"
	lift_announce_str = "Lift arriving at Administration, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/science_south_ground
	name = "Science Elevator 2"
	lift_floor_label = "Floor 2"
	lift_floor_name = "R&D Lab"
	lift_announce_str = "Lift arriving at Research & Development, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/science_south_lower_ground
	name = "Science Elevator 2"
	lift_floor_label = "Floor 3"
	lift_floor_name = "Xenobiology Lab"
	lift_announce_str = "Lift arriving at Xenobiology Lab, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

//Mining

/area/turbolift/elevator_north_ground
	name = "Elevator North"
	lift_floor_label = "Floor 2"
	lift_floor_name = "Sewers"
	lift_announce_str = "Lift arriving at Sewers, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/elevator_north_lower_ground
	name = "Elevator North"
	lift_floor_label = "Floor 1"
	lift_floor_name = "Kiel City Streets"
	lift_announce_str = "Lift arriving at Kiel City Streets, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/elevator_south_ground
	name = "Elevator South"
	lift_floor_label = "Floor 2"
	lift_floor_name = "Sewers"
	lift_announce_str = "Lift arriving at Sewers, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

/area/turbolift/elevator_south_lower_ground
	name = "Elevator South"
	lift_floor_label = "Floor 1"
	lift_floor_name = "Kiel City Streets"
	lift_announce_str = "Lift arriving at Kiel City Streets, please stand clear of the doors."
	base_turf = /turf/simulated/floor/tiled/steel_ridged

//Turbolift Holders.

//Science

/obj/turbolift_map_holder/science_north
	name = "Science Elevator 1"
	depth = 3
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	areas_to_use = list(
		/area/turbolift/science_north_lower_ground,
		/area/turbolift/science_north_ground,
		/area/turbolift/science_north_top
		)

/obj/turbolift_map_holder/science_south
	name = "Science Elevator 2"
	depth = 3
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	areas_to_use = list(
		/area/turbolift/science_south_lower_ground,
		/area/turbolift/science_south_ground,
		/area/turbolift/science_south_top
		)

//Mining

/obj/turbolift_map_holder/elevator_north
	name = "North Elevator"
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	areas_to_use = list(
		/area/turbolift/elevator_north_ground,
		/area/turbolift/elevator_north_lower_ground
		)

/obj/turbolift_map_holder/elevator_south
	name = "South Elevator"
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	areas_to_use = list(
		/area/turbolift/elevator_south_ground,
		/area/turbolift/elevator_south_lower_ground
		)