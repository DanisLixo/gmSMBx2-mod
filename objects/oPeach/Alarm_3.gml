if moving = false {
	if modernmode = false	
	{var t = instance_create_depth(pushbx,pushby,depth,oText); t.center = false;}
	else	
	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,pushby,depth,oText);}
	//t.text = "BUT MAYBE YOU SHOULD"
	t.text = "PUSH TAB FOR DEBUG!"
	if global.player = "Dawn" {t.text = "PUSH F9 SO THEN I APPEAR";}
	if instance_exists(oClient) {t.text = "PUSH " + keycode_to_string(global.keya) + " TO GO BACK"}
}


alarm[4] = interval*1

