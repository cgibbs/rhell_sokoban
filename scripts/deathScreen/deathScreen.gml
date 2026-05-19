function deathScreen(){
	with(instance_find(obj_gui, 0)) {
		game_state = "dead";
		alarm[0] = 60;
	}
}