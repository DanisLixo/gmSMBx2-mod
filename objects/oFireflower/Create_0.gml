event_inherited()

grounded = false;

pufunc = function()
{
	var m = instance_place(x,y,oMario)
	
	if m
	{
		with(m)
		{
			if powerup = "s"
			{state = ps.grow;}
			else if powerup = "b" || powerup = "c"
			{state = ps.firetransform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	instance_destroy();
	points(1000,true)
	global.hats += 1;
}

g = 1;
gspd = 0;
moving = false

float = false;
xplace = xstart
feathy = noone