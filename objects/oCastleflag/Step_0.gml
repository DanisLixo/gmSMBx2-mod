if ((instance_exists(oMario) && oMario.state = ps.flagpolefinish) or (instance_exists(oLuigi) && oLuigi.state = ps.flagpolefinish)) && st = 0
{
	st = 1;
}

if st = 2
{
	if y > ystart - 30
	{y -= 1.5;}
}





