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
			else if powerup = "b"
			{state = ps.firetransform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	
	if oMario.powerup = "b" or oMario.powerup = "f" {oGame.hats += 1;}
	points(1000,true);
	instance_destroy();
}

g = 1;
gspd = 1;
moving = false