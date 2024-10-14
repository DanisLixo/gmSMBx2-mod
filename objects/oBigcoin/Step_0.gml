if moving = true {
	x += hspd*dir
	if place_meeting(x+dir,y,oCol)
		{dir = -dir}
	if instance_place(x+dir,y,oParblock)
		{dir = -dir;}
}

var m = instance_place(x+8*dir,y,oMario);

if m && global.movestatics = true && m.state = ps.nah
{
	moving = true
	dir = -dir
	sfx(sndBump,0);
}
