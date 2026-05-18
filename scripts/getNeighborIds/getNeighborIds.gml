function getNeighborIds(){
	middle_x = x + 16;
	middle_y = y + 16;
	
	temp_neighbors = [
		instance_position(middle_x, middle_y+tileSize, Constant.All),
		instance_position(middle_x, middle_y-tileSize, Constant.All),
		instance_position(middle_x+tileSize, middle_y, Constant.All),
		instance_position(middle_x-tileSize, middle_y, Constant.All)
	];
	
	neighbors = [];
	for (i = 0; i < array_length(neighbors); i++) {
		if (neighbors[i] > 0) {
			array_push(neighbors, neighbors[i]);
		}
	}
	
	return neighbors
}