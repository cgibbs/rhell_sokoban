// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckIfEmpty(dir){
	switch(dir)
	{
		case "Left":
			if(place_free(x-tileSize, y))
			{
				x -= tileSize;
				return true;
			}
			else
			{
				if(place_meeting(x-tileSize, y, pushables)
				//and place_free(x-tileSize*2, y)
				)
				{
					var nextTile = instance_place(x-tileSize*2, y, tile_objects);
					if (place_free(x-tileSize*2, y) or nextTile != noone) {
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
			}
			else
			{
				if(place_meeting(x+tileSize, y, pushables)
				//and place_free(x+tileSize*2, y)
				)
				{
					var nextTile = instance_place(x+tileSize*2, y, tile_objects);
					if (place_free(x+tileSize*2, y) or nextTile != noone) {
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
				y -= tileSize;
				return true;
			}
			else
			{
				if(place_meeting(x, y-tileSize, pushables)
				//and place_free(x, y-tileSize*2)
				)
				{
					var nextTile = instance_place(x+tileSize*2, y, tile_objects);
					if (place_free(x+tileSize*2, y) or nextTile != noone) {
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
			}
			else
			{
				if(place_meeting(x, y+tileSize, pushables)
				//and place_free(x, y+tileSize*2)
				)
				{
					var nextTile = instance_place(x+tileSize*2, y, tile_objects);
					if (place_free(x+tileSize*2, y) or nextTile != noone) {
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