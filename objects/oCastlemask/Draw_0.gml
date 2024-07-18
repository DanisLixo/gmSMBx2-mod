if instance_place(x,y,oMario) && (oMario.state = ps.flagpolefinish or oMario.state = ps.castleending)
{
	oMario.depth = 399;
	if instance_exists(oCape) {oCape.image_alpha = 0;} 
	oMario.invincible = -2;
	if global.level = 4
	{
		global.level = 1;
		global.world += 1;
		room_goto(rmLeveltransition)
	 }
	 if room = rmExtra_under
	{
		room_goto(rmTitle)
	 }
}
if place_meeting(x,y,oToad)
{
	oToad.image_alpha = 0; oToad.invincible = -2;
}
