if moving = false {
	if modernmode = false	
	{var t = instance_create_depth(tswx,tswy,depth,oText); t.center = false;}
	else	
	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,tswy,depth,oText);}
	//t.text = "BUT MAYBE YOU SHOULD"
	t.text = "AND PUSH " + keycode_to_string(global.keya) + " TO GO BACK."
	if instance_exists(oClient) {t.text = "TO THE LOBBY.";}
}


alarm[5] = interval*3

