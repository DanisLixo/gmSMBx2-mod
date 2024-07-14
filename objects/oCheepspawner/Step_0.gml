var cwview = camera_get_view_x(view_camera[0])+SCREENW+16
if spawn > 0 {
	spawn--
}
else if spawn = 0 {
	if oMario.x >= x {
		//if instance_number(o2Cheep) < 3 {
			instance_create_depth(cwview,round(random_range(48,room_height-64)),depth,o2Cheep)
			spawn = 180;
		//}
	}
}