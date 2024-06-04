event_inherited()

if mario_freeze() != 1
{
	if emerge = false
	{
		hspd = 0.8*face;
	
		if place_meeting(x+face,y,oCol)
		{face = -face;}
	
		collide();
	
		if !grounded
		{vspd -= 0.2;}
		
		if grounded
		{vspd = -4;}
	}
}

if (oMario.image_xscale = 1 && (instance_place(x-1,y,oMario) or instance_place(x,y-3,oMario)) or (oMario.image_xscale = -1 && (instance_place(x+1,y,oMario) or instance_place(x,y+3,oMario)))) && oMario.hspd <= 0.5 && global.moveobjs = true && oMario.state = ps.nah
{	
	face = -face
	sfx(sndBump,0);
}