if st == -1 
{
	image_yscale = -1;
	
	hspd = 0;
	vspd += 0.15;
	y += vspd;
}
if st >= 0 and st <= 2.5
{
	st += spawn;
	gspd = 1;
	image_yscale = abs(image_yscale)
}

if st >= 2.49
{
	
	st += 0.025
	
	gspd -= 0.069
	vspd -= 4+gspd;
	
	//c--;
	//if c <= 0 {
		y += vspd; c = 2; vspd = 0;
	//}
	
	
	if gspd <= -4
	{
		image_yscale = -abs(image_yscale)
	}
}

if st >= 4
{
	if y > yspawn
	{
		y = yspawn + 1
		st = 0
		spawn = choose(0.025, 0.5)
	}
}

var m = instance_place(x,y,oMario)
if m && m.invincible = 0
{
	m.gethit = 1;
}

if mario_freeze() != 0
{
	exit;
}