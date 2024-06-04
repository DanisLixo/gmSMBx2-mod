event_inherited()

if mario_freeze() != 1
{
	if emerge = false
	{
		collide();
	
		if !grounded
		{vspd -= 0.2;}
	}
}

if moving = true 
{
	x += g*gspd
}

if ((oMario.image_xscale = 1 && instance_place(x-4,y,oMario)) or (oMario.image_xscale = -1 && instance_place(x+4,y,oMario))) && global.moveobjs && oMario.state = ps.nah
{
	if oMario.khp {sfx(sndBump,0);}
	moving = true
	if oMario.image_xscale = 1
		{if g = -1 {g = 1}}
	if oMario.image_xscale = -1
		{if g = 1 {g = -1}}
}
