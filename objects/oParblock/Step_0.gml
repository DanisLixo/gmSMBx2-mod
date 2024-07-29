var m = instance_place(x,y-4,oMario)

if moving = true 
{
	x += g*gspd
	if place_meeting(x+g,y,oParblock) {moving = false; sfx(sndBump,0);}
	if place_meeting(x+g,y,oCol) {moving = false; sfx(sndBump,0);}
	if m && m.vspd >= 0
	{m.x += g; if m.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += g;}}
}

if m && global.movestatics && m.state = ps.nah
{
	if m.khp {sfx(sndBump,0);}
	moving = true
	if m.image_xscale = 1
		{if g = -1 {g = 1}}
	if m.image_xscale = -1
		{if g = 1 {g = -1}}
}
