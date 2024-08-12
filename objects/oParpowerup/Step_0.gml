if emerge = true
{
	if instance_exists(placecol) && place_meeting(x,y,placecol)
	{y -= 0.3;}
	else
	{emerge = false;}
	depth = 399;
}
else if mario_freeze() != 1
{
	depth = 0;
	if instance_place(x,y,oMario)
	{
		if instance_place(x,y,oMario).char = "Syobon" and global.abilities 
		{instance_place(x,y,oMario).gethit = 1; instance_destroy()}
		else {pufunc();}
	}
}
