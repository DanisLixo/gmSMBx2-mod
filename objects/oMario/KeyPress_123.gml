if instance_exists(debugtext) {instance_destroy(debugtext)}
else {instance_create_depth(x,y,depth, debugtext)} //debug test, spawning here bcuz it's about mario
if string_pos("Title", room_get_name(room)) != 0 {room_goto(rmTestin);}