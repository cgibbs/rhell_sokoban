#macro tileSize 32
#macro pushables [obj_box, obj_3, obj_wood]
#macro behavioral_objects [obj_3, obj_fire, obj_wood, obj_cloner, obj_player]
image_speed = 0;
timeToBurn = -1;
usesRemaining = -1;
processing = false;
global.room_step = 0;