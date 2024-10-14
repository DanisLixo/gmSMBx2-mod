if (oMario.y < -64 || oMario.y > room_height+31) && oMario.state != ps.exploded
{
	alarm[0] = 120;
	outOfBounds = true;
}
if (outOfBounds == true)
{
	oMario.x = oMario.xstart;
	oMario.y = oMario.ystart;
	oMario.hspd = 0;
	oMario.vspd = 0;
	oMario.state = -1
}

if (room == bornroom) {
	global.freecam = true;
	global.time++;
}