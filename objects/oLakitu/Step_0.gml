// Inherit the parent event
event_inherited();

if mario_freeze()	{image_speed = 0; exit;}

if hspd > maxhspd {hspd -= 0.3}
if hspd < maxhspd {hspd += 0.3}

var m = instance_nearest(x,y,oMario)
var cx = camera_get_view_x(view_camera[0])

if x < cx+SCREENW and x > cx && state == es.patrol 
{
	if eggtimer > 0 {eggtimer--}
	if eggtimer <= 10 {image_index = 1;}
	else {image_index = 0;}
	if eggtimer = 1 {eggtimer += choose(0,0,0,round(irandom_range(5,9)))}
	if eggtimer = 0 {
		var spiny = instance_create_depth(x,y,depth,oSpiny);
		spiny.vspd = -4
		spiny.eggd = -1 
		eggtimer = 180
	}
}

if state = es.patrol {
	if goaway = false {
		if goin {hspd = 1.2; if x > cx {goin = false;}}
		else {
			if x < cx + SCREENW/6
			{maxhspd = 0.8; facingdir = 1;}
			else if x > cx + SCREENW - (SCREENW/6)
			{maxhspd = -0.8; facingdir = -1;}
			else if m.hspd > 1.65
			{maxhspd = m.hspd+0.2;}
			else if x < m.x+16 and x > m.x-16
			{hspd = 1.2*sign(maxhspd);}
		}
	}
	else {hspd = -1}
	
	x += hspd;
}