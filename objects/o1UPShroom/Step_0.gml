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

var m = instance_place(x+8*face,y,oMario);

if m && m.hspd <= 0.5 && global.moveobjs = true && m.state = ps.nah
{
	face = -face
	//x += hspd; // I like this one specifically, he simply stops the object.
	sfx(sndBump,0);
}