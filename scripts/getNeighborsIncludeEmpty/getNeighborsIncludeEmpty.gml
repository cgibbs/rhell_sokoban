function getNeighborsIncludeEmpty(inst){
	middle_x = inst.x + 16;
	middle_y = inst.y + 16;
	
	// this is where we include non-behavioral objects that still shouldn't be 
	// considered "empty" spaces
	// for now, don't clone the player; that needs additional work to make the
	// controls do what they're supposed to
	comparison_list = array_concat(behavioral_objects, [obj_wall, obj_player]);
	
	temp_neighbors = [
		// NESW
		instance_position(middle_x, middle_y-tileSize, comparison_list),
		instance_position(middle_x+tileSize, middle_y, comparison_list),
		instance_position(middle_x, middle_y+tileSize, comparison_list),
		instance_position(middle_x-tileSize, middle_y, comparison_list)
	];
	
	return temp_neighbors
}