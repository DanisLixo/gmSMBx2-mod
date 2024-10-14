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
	
	if instance_place(x,y,oPartner) 
	{
		with(oPlayer)
		{
			if powerup = "s"
			{state = ps.grow;}
			else if powerup = "b" || powerup = "c"
			{state = ps.firetransform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	
	points(1000,true)
	instance_destroy();
}

face = 1;