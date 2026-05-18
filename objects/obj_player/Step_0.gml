/// @description Insert description here
// You can write your code in this editor
var left, right, up, down;

left = keyboard_check_pressed(vk_left);
right = keyboard_check_pressed(vk_right);
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);

temp_room_step = global.room_step;

if(left)
{
	image_index = 3;
	if(CheckIfEmpty("Left")) global.room_step += 1;
}

if(right)
{
	image_index = 2;
	if(CheckIfEmpty("Right")) global.room_step += 1;
}

if(up)
{
	image_index = 0;
	if(CheckIfEmpty("Up")) global.room_step += 1;
}

if(down)
{
	image_index = 1;
	if(CheckIfEmpty("Down")) global.room_step += 1;
}

if (temp_room_step != global.room_step) {
	// copy of all behavioral objects
	beh = [];
	with (all) {
		if (array_contains(behavioral_objects, object_index)) {
			array_push(other.beh, self);
		}
	}
	
	for (i = 0; i < array_length(beh); i++) {
		doBehavior(beh[i]);
	}
	
	for (i = 0; i < array_length(beh); i++) {
		instance_destroy(beh[i]);	
	}
}