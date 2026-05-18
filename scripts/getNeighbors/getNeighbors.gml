function getNeighbors(inst){
	middle_x = inst.x + 16;
	middle_y = inst.y + 16;
	
	temp_neighbors = [
		// NESW
		instance_position(middle_x, middle_y-tileSize, behavioral_objects),
		instance_position(middle_x+tileSize, middle_y, behavioral_objects),
		instance_position(middle_x, middle_y+tileSize, behavioral_objects),
		instance_position(middle_x-tileSize, middle_y, behavioral_objects)
	];
	
	neighbors = [];
	for (k = 0; k < array_length(temp_neighbors); k++) {
		if (temp_neighbors[k] != noone && temp_neighbors[k].processing == true) {
			array_push(neighbors, temp_neighbors[k]);
		}
	}
	
	return neighbors
}