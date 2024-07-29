var m = instance_place(x,y,oMario);

if m && (m.state = ps.flagpolefinish or m.state = ps.castleending)
{
	m.depth = 399;
	m.invincible = -2;
	if global.level = 4
	{
		global.level = 1;
		global.world += 1;
		room_goto(rmLeveltransition)
	 }
}
if place_meeting(x,y,oToad)
{
	oToad.image_alpha = 0; oToad.invincible = -2;
}
