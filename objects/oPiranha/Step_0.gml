depth = 301

if instance_exists(oMario) and !(oMario.x > bbox_left - 20 && oMario.x < bbox_right + 20) && moving = false
	&& st = 1
{
	st = 2;
}

if st >= 2
{
	st ++;
	
	if y > ystart - sprite_height-8
	{y -= 0.5;}
	
	if st > room_speed * 2
	{st = -1;}
}
if st <= -1
{
	if y < ystart
	{y += 0.5;}
	else
	{st = 0;}
}

if st >= 0 && st < 1
{
	st += 0.01;
}


