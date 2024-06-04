event_inherited()

grounded = false;

per = random(100)
	
pufunc = function()
{
	points(8000,true)
	if per < 26 {sfx(snd1UPEX,0)}
	else {sfx(snd1UP,0)}
	instance_destroy();
}

face = 1;