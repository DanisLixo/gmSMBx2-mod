bgm("Toadstool", true)

if moving = false {
	if modernmode = false	
	{var t = instance_create_depth(yqiox,yqioy,depth,oText); t.center = false;}
	else	
	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,yqioy,depth,oText);}
	//t.text = "BUT MAYBE YOU SHOULD"
	t.text = "YOUR QUEST IS OVER."
	if global.player = "Dawn" {t.text = "COOL YOU SAVED ME MHM";}
}


alarm[2] = interval*1

