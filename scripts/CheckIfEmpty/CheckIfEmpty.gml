//function place_meeting_or_door_open(p_x, p_y, p_items) {
//	isFree = place_free(p_x, p_y);
	
//	if (!isFree) {
//		if (instance_place(p_x, p_y)
//	}
//}

function CheckIfEmpty(dir){
	switch(dir)
	{
		case "Left":
			if(place_free(x-tileSize, y))
			{
				x -= tileSize;
				return true;
			} else if (place_meeting(x-tileSize, y, obj_sokoDoor)) {
				var nextDoor = instance_place(x-tileSize, y, obj_sokoDoor);
				if (nextDoor.isOpen == true) {
					x -= tileSize;
					return true;
				}
			}
			else
			{
				if(place_meeting(x-tileSize, y, pushables))
				{
					var nextTile = instance_place(x-tileSize*2, y, tile_objects);
					var nextDoor = instance_place(x-tileSize*2, y, obj_sokoDoor);
					if (place_free(x-tileSize*2, y) or nextTile != noone or (nextDoor != noone and nextDoor.isOpen == true)) {
						var inst = instance_place(x-tileSize, y, pushables);
						if(!inst.snap)
						{
							inst.x -= tileSize;
							x -= tileSize;
							return true;
						}
					}
				} 
			}
			return false;
		
		case "Right":
			if(place_free(x+tileSize, y))
			{
				x += tileSize;
				return true;
			} else if (place_meeting(x+tileSize, y, obj_sokoDoor)) {
				var nextDoor = instance_place(x+tileSize, y, obj_sokoDoor);
				if (nextDoor.isOpen == true) {
					x += tileSize;
					return true;
				}
			}
			else
			{
				if(place_meeting(x+tileSize, y, pushables))
				{
					var nextTile = instance_place(x+tileSize*2, y, tile_objects);
					var nextDoor = instance_place(x+tileSize*2, y, obj_sokoDoor);
					if (place_free(x+tileSize*2, y) or nextTile != noone or (nextDoor != noone and nextDoor.isOpen == true)) {
						var inst = instance_place(x+tileSize, y, pushables);
						if(!inst.snap)
						{
							inst.x += tileSize;
							x += tileSize;
							return true;
						}	
					}
				} 
			}
		return false;
		
		case "Up":
			if(place_free(x, y-tileSize))
			{
				show_debug_message("going up");
				y -= tileSize;
				return true;
			} else if (place_meeting(x, y-tileSize, obj_sokoDoor)) {
				var nextDoor = instance_place(x, y-tileSize, obj_sokoDoor);
				if (nextDoor.isOpen == true) {
					show_debug_message("going up a different way");
					y -= tileSize;
					return true;
				}
			}
			else
			{
				if(place_meeting(x, y-tileSize, pushables))
				{
					var nextTile = instance_place(x, y-tileSize*2, tile_objects);
					var nextDoor = instance_place(x, y-tileSize*2, obj_sokoDoor);
					if (place_free(x, y-tileSize*2) or nextTile != noone or (nextDoor != noone and nextDoor.isOpen == true)) {
						var inst = instance_place(x, y-tileSize, pushables);
						if(!inst.snap)
						{
							inst.y -= tileSize;
							y -= tileSize;
							return true;
						}
					}
				} 
			}
		return false;
		
		case "Down":
			if(place_free(x, y+tileSize))
			{
				y += tileSize;
				return true;
			} else if (place_meeting(x, y+tileSize, obj_sokoDoor)) {
				var nextDoor = instance_place(x, y+tileSize, obj_sokoDoor);
				if (nextDoor.isOpen == true) {
					y += tileSize;
					return true;
				}
			}
			else
			{
				if(place_meeting(x, y+tileSize, pushables))
				{
					var nextTile = instance_place(x, y+tileSize*2, tile_objects);
					var nextDoor = instance_place(x, y+tileSize*2, obj_sokoDoor);
					if (place_free(x, y+tileSize*2) or nextTile != noone or (nextDoor != noone and nextDoor.isOpen == true)) {
						var inst = instance_place(x, y+tileSize, pushables);
						if(!inst.snap)
						{
							inst.y += tileSize;
							y += tileSize;
							return true;
						}
					}
				} 
			}
		return false;
	}
}