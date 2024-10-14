if moving = false {
	if modernmode = false	
	{var t = instance_create_depth(yqiox,yqioy,depth,oText); t.center = false;}
	else	
	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,wpyy,depth,oText);}
	//t.text = "BUT MAYBE YOU SHOULD"
	t.text = "WE PRESENT YOU WITH MORE QUESTS!"
	if global.player = "Dawn" {t.text = "BUT YOU CAN DO MORE YAH";}
	if instance_exists(oClient) {t.text = "BETTER WAIT YOUR FRIENDS..."}
}


alarm[3] = interval*1

