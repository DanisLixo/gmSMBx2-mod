event_inherited()

row = -1

pufunc = function()
{
	var m = instance_place(x,y,oMario)
	
	if m
	{
		with(m)
		{
			if powerup = "s"
			{state = ps.grow;}
			else if powerup = "b" || powerup = "f"
			{state = ps.capetransform;}
			else
			{sfx(sndFeather,0);}
		}
	}
	
	if instance_place(x,y,oPartner) 
	{
		with(oPlayer)
		{
			if powerup = "s"
			{state = ps.grow;}
			else if powerup = "b" || powerup = "c"
			{state = ps.capetransform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	instance_destroy();
}

moving = false