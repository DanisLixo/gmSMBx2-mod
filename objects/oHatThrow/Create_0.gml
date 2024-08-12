hspd = 0;
vspd = 0
facing = 1
throwed = false
back = false

expire = 0;

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

m = instance_place(x,y,oMario)

instance_destroy(instance_nearest(m.x,0,oHat))