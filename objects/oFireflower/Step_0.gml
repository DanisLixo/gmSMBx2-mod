event_inherited()


if mario_freeze() != 1
{
	if emerge = false
	{
		collide();
	
		if !grounded and float = false
		{vspd -= 0.2;}
	}
}

if moving = true 
{
	x += g*gspd
}

var m = instance_place(x+8*g,y,oMario);

if m && global.moveobjs && m.state = ps.nah
{
	if oMario.khp {sfx(sndBump,0);}
	moving = true
	g = -g;
	gspd = 1;
	xplace = x
}
