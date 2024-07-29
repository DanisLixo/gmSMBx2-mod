// Inherit the parent event
event_inherited();

if abs(hspd) > maxhspd {hspd -= 0.2}
if abs(hspd) < maxhspd {hspd += 0.2}

var m = instance_nearest(x,y,oMario)

facingdir = sign(m.x-x)

if state = es.patrol {
	if x < m.x+64 and m.hspd > 1.5 {maxhspd = m.hspd*2}
	else if abs(m.x-x) <= 32
	{maxhspd = 1;}
	
	x += hspd;
}