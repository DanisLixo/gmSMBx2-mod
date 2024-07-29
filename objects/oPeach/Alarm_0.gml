if modernmode = false	{var t = instance_create_depth(tymx,tymy,depth,oText); t.center = false;}
else	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,tymy,depth,oText);}

t.text = "THANK YOU "+string_upper(global.player)+"!";
if global.player = "Dawn" {t.text = "GOOD ONE DAWN!";}
if global.world = 1 and global.player = "Max_Verstappen" {t.text = "MAX VERSTAPPEN CAREER UNTIL NOW";}

alarm[1] = interval
