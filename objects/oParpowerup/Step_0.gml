if emerge = true
{
	if instance_exists(placecol) and place_meeting(x,y,placecol) {y -= 0.3;}
	else
	{emerge = false;}
	depth = 399;
}
else if mario_freeze() != 1
{
	depth = 0;
}
