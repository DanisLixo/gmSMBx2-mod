if moving = true {
	x += hspd*dir
	if place_meeting(x+dir,y,oCol)
		{dir = -dir}
	if instance_place(x+dir,y,oParblock)
		{dir = -dir;}
}

if ((oMario.image_xscale = 1 && instance_place(x-1,y,oMario)) or (oMario.image_xscale = -1 && instance_place(x+1,y,oMario))) && global.movestatics = true && oMario.state = ps.nah
{
	moving = true
	dir = -dir
	sfx(sndBump,0);
}
