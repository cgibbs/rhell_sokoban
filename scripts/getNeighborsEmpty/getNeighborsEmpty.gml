function getNeighborsIncludeEmpty(inst){
	middle_x = inst.x + 16;
	middle_y = inst.y + 16;
	
	temp_neighbors = [
		// NESW
		instance_position(middle_x, middle_y-tileSize, behavioral_objects),
		instance_position(middle_x+tileSize, middle_y, behavioral_objects),
		instance_position(middle_x, middle_y+tileSize, behavioral_objects),
		instance_position(middle_x-tileSize, middle_y, behavioral_objects)
	];
	
	return temp_neighbors
}