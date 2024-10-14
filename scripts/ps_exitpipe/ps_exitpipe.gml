function ps_exitpipeup()
{
	depth = 399;
	y--;
	
	invincible = -2;
	
	if !place_meeting(x,y,oCol) && !place_meeting(x,y,oPipeexit)
	{state = ps.normal; depth = 0}
}