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

var m = collision_rectangle(x+3*face,y,x+3*-face,y+3*face,oMario,true,false)

if m && m.hspd <= 0.5 && global.moveobjs = true && m.state = ps.nah
{	
	face = -face
	sfx(sndBump,0);
}