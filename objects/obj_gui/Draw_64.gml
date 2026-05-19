var guiw = display_get_gui_width();
var guih = display_get_gui_height();

with(instance_find(obj_player, 0)) {
	// do all player-related GUI stuff
	writeToGui(guiw/2, 10, "player type: " + behavior_type, c_black);
}

if (game_state == "dead") {
		writeToGui(guiw/2, 30, "you died lmao", c_black);	
	}