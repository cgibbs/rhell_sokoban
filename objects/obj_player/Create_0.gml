#macro tileSize 32
#macro pushables [obj_box, obj_3, obj_wood, obj_wetWood]
#macro behavioral_objects [obj_3, obj_fire, obj_wood, obj_cloner, obj_player, obj_antimatter, obj_water, obj_wetWood]
#macro tile_objects [obj_hole]
image_speed = 0;
timeToBurn = -1;
usesRemaining = -1;
processing = false;
global.room_step = 0;