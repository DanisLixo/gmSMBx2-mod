event_inherited();

if mario_freeze()	{image_speed = 0; exit;}

if state = es.patrol {x += hspd}
if state = es.die {image_yscale = 1;}
