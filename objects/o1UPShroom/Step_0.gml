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
	}
}

if ((oMario.image_xscale = 1 && instance_place(x-1,y,oMario)) or (oMario.image_xscale = -1 && instance_place(x+1,y,oMario))) && oMario.hspd <= 0.5 && global.moveobjs = true && oMario.state = ps.nah
{
	face = -face
	//x += hspd; // I like this one specifically, he simply stops the object.
	sfx(sndBump,0);
}