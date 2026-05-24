function behavior3(beh_inst) {
	if (beh_inst.countdown > 0) {
		beh_inst.countdown -= 1;
		image_index = beh_inst.countdown;
		
		with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
			behavior_type = beh_inst.behavior_type;
			countdown = beh_inst.countdown;	
		}
	} else {
		with(beh_inst) {
			
		}
	}
}

function behaviorAntimatter(beh_inst) {
	neighbors = getNeighbors(beh_inst);
	if (array_length(neighbors) > 0) {
		copy_x = neighbors[0].x;
		copy_y = neighbors[0].y;
		copy_ind = neighbors[0].object_index;
		with (neighbors[0]) {
			if (object_index == obj_player) {
				deathScreen();
				return;	
			}
			instance_destroy();	
		}
		copies = instance_place(copy_x, copy_y, all);
		if (copies != noone) {
			with(copies) {
				instance_destroy();	
			}
		}
		if (beh_inst.object_index == obj_player) {
			deathScreen();
			return;	
		}
	} else {
		with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
			behavior_type = beh_inst.behavior_type;	
		}
	}
}

function behaviorWood(beh_inst) {
	neighbors = getNeighbors(beh_inst);
	newObjType = beh_inst.object_index;
	newTimeToBurn = -1;
	water_count = 0;
	fire_count = 0;
	for (fn = 0; fn < array_length(neighbors); fn++) {
		if (neighbors[fn].behavior_type == "water") {
			water_count += 1;
		} else if (neighbors[fn].behavior_type == "fire") {
			fire_count += 1;
		}
	}
	// if no fire around and at least 1 water around, make wet wood
	if ((fire_count == 0) and water_count > 0) {
		newObjType = obj_wetWood;
	} 
	// if fire and water and fire is greater, do nothing
	else if ((fire_count > 0) and water_count > 0) {
		newObjType = obj_wood;
	}
	// if fire and no water, do the normal fire stuff
	else if ((fire_count > 0) and water_count == 0) {
		if (beh_inst.timeToBurn - 1 == 0) {
			newObjType = obj_fire;
			newTimeToBurn = woodTimeToStayBurning;
		}
		else {
			newTimeToBurn = beh_inst.timeToBurn - 1;
		}
	}

	if (array_length(neighbors) < 1) {
		newTimeToBurn = woodTimeUntilBurn;
	}
	with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",newObjType)) {
		if (other.newTimeToBurn > -1) timeToBurn = other.newTimeToBurn;
		//behavior_type = beh_inst.behavior_type;	
	}
}

function behaviorFire(beh_inst) {
	with (beh_inst) {
		neighbors = getNeighbors(beh_inst);
		water_count = 0;
		for (fn = 0; fn < array_length(neighbors); fn++) {
			if (neighbors[fn].behavior_type == "water") {
				water_count += 1;
			}
		}
		// if more than two neighbors are water, destroy fire
		if (water_count > 1) {
			instance_destroy();
		} else if (timeToBurn > 0) {
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
				behavior_type = beh_inst.behavior_type;
				timeToBurn = beh_inst.timeToBurn - 1;
			}
		} else if (timeToBurn == 0) {
			
		} else {
			// keep on burnin' baby	
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
				behavior_type = beh_inst.behavior_type;
				timeToBurn = -1;
			}
		}
	}
	return;
}

function behaviorWater(beh_inst) {
	with (beh_inst) {
		neighbors = getNeighbors(beh_inst);
		fire_count = 0;
		for (fn = 0; fn < array_length(neighbors); fn++) {
			if (neighbors[fn].behavior_type == "fire") {
				fire_count += 1;
			}
		}
		
		// if more than two neighbors are fire, destroy water
		if (fire_count > 1) {
			instance_destroy();	
		} else {
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
				behavior_type = beh_inst.behavior_type;	
			}
		}
	}
}

function behaviorWetWood(beh_inst) {
	with (beh_inst) {
		neighbors = getNeighbors(beh_inst);
		fire_count = 0;
		for (fn = 0; fn < array_length(neighbors); fn++) {
			if (neighbors[fn].behavior_type == "fire") {
				fire_count += 1;
			}
		}
		
		// if neighbor is fire, dry wood
		if (fire_count > 0) {
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_wood)) {
				
			}
		} else {
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
				behavior_type = beh_inst.behavior_type;	
			}
		}
	}
}

function behaviorCloner(beh_inst) {
	if (beh_inst.usesRemaining == 0) {
		return;	
	}
	newBehaviorType = beh_inst.behavior_type;
	newUsesRemaining = beh_inst.usesRemaining;
	// get neighbors
	neighbors = getNeighbors(beh_inst);
	// get first neighbor (starting from north going clockwise), clone it to first empty spot
	if (array_length(neighbors) > 0) {
		emptyNeighbors = getNeighborsIncludeEmpty(beh_inst);
		emptyCount = 0;
		for (ec = 0; ec < array_length(emptyNeighbors); ec++) {
			if (emptyNeighbors[ec] == noone) emptyCount++;
		}
		if (emptyCount > 0) {
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
			// cloned object
			with (instance_create_layer(clone_x, clone_y, "Instances", neighbors[0].object_index)) {
				behavior_type =  other.neighbors[0].behavior_type;
				// do stuff? can I clone any arbitrary values on the cloned block?
			}
		}
		
	}
	with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
		show_debug_message(object_index);
		if (beh_inst.usesRemaining > 0) {
			usesRemaining = other.newUsesRemaining;
		}
		behavior_type = beh_inst.behavior_type;	
	}
}

function behaviorDefault (beh_inst) {
	newBehaviorType = beh_inst.behavior_type;
	with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
		// need to do this for all player variables? Is there a better way?
		behavior_type = beh_inst.behavior_type;
	}
}

// important note: we're handling it this way for the moment because you get a handle
// to both the behavioral object AND the player. No uses for that currently, but maybe
// in the future?
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
		case "antimatter":
			behaviorAntimatter(beh_inst);
			break;
		case "water":
			behaviorWater(beh_inst);
			break;
		case "wet_wood":
			behaviorWetWood(beh_inst);
			break;
	    default:
			behaviorDefault(beh_inst);
	        break;
	}
}