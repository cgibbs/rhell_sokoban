function behavior3(beh_inst) {
	if (beh_inst.countdown > 0) {
		beh_inst.countdown -= 1;
		image_index = beh_inst.countdown;
		
		with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
		countdown = beh_inst.countdown;	
	}
	} else {
		with(beh_inst) {
			
		}
	}
}

function behaviorWood(beh_inst) {
	neighbors = getNeighbors(beh_inst);
	newObjType = obj_wood;
	newTimeToBurn = -1;
	for (j = 0; j < array_length(neighbors); j++) {
		neighbor = neighbors[j];
		if (neighbor.behavior_type == "fire") {
			if (beh_inst.timeToBurn == 0) {
				newObjType = obj_fire;
				newTimeToBurn = woodTimeToStayBurning;
			}
			else {
				newTimeToBurn = beh_inst.timeToBurn - 1;
			}
		} else {
			
		}
	}
	if (array_length(neighbors) < 1) {
		newTimeToBurn = woodTimeUntilBurn;
	}
	with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",newObjType)) {
		if (other.newTimeToBurn > -1) timeToBurn = other.newTimeToBurn;
	}
}


function behaviorFire(beh_inst) {
	with (beh_inst) {
		if (timeToBurn > 0) {
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_fire)) {
				timeToBurn = beh_inst.timeToBurn - 1;
			}
		} else if (timeToBurn == 0) {
			
		} else {
			// keep on burnin' baby	
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_fire)) {
				timeToBurn = -1;
			}
		}
	}
	return;
}

function behaviorCloner(beh_inst) {
	show_debug_message("cloning time");
	if (beh_inst.usesRemaining == 0) {
		show_debug_message("empty cloner");
		return;	
	}
	newUsesRemaining = beh_inst.usesRemaining;
	// get neighbors
	neighbors = getNeighbors(beh_inst);
	show_debug_message(neighbors);
	// get first neighbor (starting from north going clockwise), clone it to first empty spot
	if (array_length(neighbors) > 0) {
		emptyNeighbors = getNeighborsIncludeEmpty(beh_inst);
		emptyCount = 0;
		for (ec = 0; ec < array_length(emptyNeighbors); ec++) {
			if (emptyNeighbors[ec] == noone) emptyCount++;
		}
		if (
		//array_length(emptyNeighbors) > 0
		emptyCount > 0
		) {
			enIndex = -1;
			for (en = 0; en < array_length(emptyNeighbors); en++) {
				if ((emptyNeighbors[en] == noone) && enIndex == -1) enIndex = en;
			}
			clone_x = beh_inst.x;
			clone_y = beh_inst.y;
			switch (enIndex) {
			    case 0:
			        // N
					clone_y -= tileSize; 
			        break;
				case 1:
			        // E
					clone_x += tileSize;
			        break;
				case 2:
			        // S
					clone_y += tileSize;
			        break;
				case 3:
			        // W
					clone_x -= tileSize;
			        break;
			    default:
			        // code here
			        break;
			}
			newUsesRemaining -= 1;
			with (instance_create_layer(clone_x, clone_y, "Instances", neighbors[0].object_index)) {
				// do stuff? can I clone any arbitrary values on the cloned block?
			}
		}
		
	}
	with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
		if (beh_inst.usesRemaining > 0) {
			usesRemaining = other.newUsesRemaining;
		}
	}
}

function doBehavior(beh_inst){
	switch (beh_inst.behavior_type) {
	    case "3":
	        behavior3(beh_inst);
			break;
		case "fire":
			behaviorFire(beh_inst);
			break;
		case "wood":
			behaviorWood(beh_inst);
			break;
		case "cloner":
			behaviorCloner(beh_inst);
			break;
	    default:
	        break;
	}
}