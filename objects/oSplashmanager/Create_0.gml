init()
loadsettings()

view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = SCREENW*3;
view_hport[0] = SCREENH*3;

image_alpha = 0

memesdemaise = false;
alarm_is_mid = 0

view_camera[0] = camera_create_view(0,0,view_wport[0],view_hport[0],0,noone,-1,-1,view_wport[0]/2,view_hport[0]/2);