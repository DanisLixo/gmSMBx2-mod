var m = instance_place(x,y,oMario);

if m && (m.state = ps.flagpolefinish or m.state = ps.castleending)
{
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
