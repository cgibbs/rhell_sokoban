function behavior3(beh_inst) {
	show_debug_message(beh_inst);
	if (beh_inst.countdown > 0) {
		beh_inst.countdown -= 1;
		image_index = beh_inst.countdown;
		
		with(instance_create_layer(beh_inst.x,beh_inst.y,"Instances",beh_inst.object_index)) {
		countdown = beh_inst.countdown;	
	}
	} else {
		with(beh_inst) {
			instance_destroy();
		}
	}
}

function doBehavior(beh_inst){
	show_debug_message(beh_inst.behavior_type);
	switch (beh_inst.behavior_type) {
	    case "3":
	        // code here
	        behavior3(beh_inst);
			break;
	    default:
	        // code here
	        break;
	}
}