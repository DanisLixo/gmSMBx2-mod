event_inherited()

grounded = false;

per = irandom(100)
	
pufunc = function()
{
	points(8000,true)
	if per < 5 {sfx(snd1UPEX,0)}
	else {sfx(snd1UP,0)}
	instance_destroy();
}

face = 1;