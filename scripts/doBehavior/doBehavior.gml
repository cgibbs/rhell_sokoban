function behavior3(beh_inst) {
	if (beh_inst.countdown > 0) {
		beh_inst.countdown -= 1;
		image_index = beh_inst.countdown;
		
		with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
		countdown = beh_inst.countdown;	
	}
	} else {
		with(beh_inst) {
			//instance_destroy();	don't do this, it might be a neighbor to someone
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
				//with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_fire)) {
				//	timeToBurn = woodTimeToStayBurning;
				//}
				newObjType = obj_fire;
				newTimeToBurn = woodTimeToStayBurning;
			}
			else {
				//with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_wood)) {
				//	timeToBurn = beh_inst.timeToBurn - 1;
				//}
				newTimeToBurn = beh_inst.timeToBurn - 1;
			}
		} else {
			// set back to default
			//with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_wood)) {
			//	// timeToBurn = woodTimeToBurn; redundant due to wood Create method
			//}
		}
	}
	if (array_length(neighbors) < 1) {
		//with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_wood)) {
		//	//timeToBurn = woodTimeToBurn;
		//}
		newTimeToBurn = woodTimeUntilBurn;
	}
	show_debug_message(newTimeToBurn);
	show_debug_message(newObjType);
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
			//instance_destroy();	don't do this, it still might be a neighbor to someone
		} else {
			// keep on burnin' baby	
			with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",obj_fire)) {
				timeToBurn = -1;
			}
		}
	}
	return;
}

function doBehavior(beh_inst){
	switch (beh_inst.behavior_type) {
	    case "3":
	        // code here
	        behavior3(beh_inst);
			break;
		case "fire":
			behaviorFire(beh_inst);
			break;
		case "wood":
			behaviorWood(beh_inst);
			break;
	    default:
	        // code here
	        break;
	}
}