if moving = true 
{
	x += g*gspd
	if place_meeting(x+g,y,oParblock) {moving = false; sfx(sndBump,0);}
	if place_meeting(x+g,y,oCol) {moving = false; sfx(sndBump,0);}
	if place_meeting(x,y-1,oMario) && oMario.vspd >= 0
	{oMario.x += g; if oMario.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += g;}}
}

if place_meeting(x, y-1,oMario) && global.movestatics && oMario.state = ps.nah
{
	if oMario.khp {sfx(sndBump,0)}
	moving = true
	if oMario.image_xscale = 1
		{if g = -1 {g = 1}}
	if oMario.image_xscale = -1
		{if g = 1 {g = -1}}
}



