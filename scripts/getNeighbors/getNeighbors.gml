function getNeighbors(inst){
	middle_x = inst.x + 16;
	middle_y = inst.y + 16;
	
	temp_neighbors = [
		instance_position(middle_x, middle_y+tileSize, behavioral_objects),
		instance_position(middle_x, middle_y-tileSize, behavioral_objects),
		instance_position(middle_x+tileSize, middle_y, behavioral_objects),
		instance_position(middle_x-tileSize, middle_y, behavioral_objects)
	];
	
	show_debug_message(temp_neighbors)
	
	neighbors = [];
	for (k = 0; k < array_length(temp_neighbors); k++) {
		if (temp_neighbors[k] != noone) {
			array_push(neighbors, temp_neighbors[k]);
		}
	}
	
	return neighbors
}