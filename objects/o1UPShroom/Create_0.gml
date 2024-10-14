event_inherited()

grounded = false;

per = irandom(100)
	
pufunc = function()
{
	if per < 5
	{
		sfx(snd1UPEX,0);
		instance_create_depth(x div 1, y div 1, depth - 1, o1UP);
		points(10000,true,false);
	} else {sfx(snd1UP,0); points(8000,true);}
	
	instance_destroy();
}

face = 1;