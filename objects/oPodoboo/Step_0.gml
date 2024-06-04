if st >= 0 and st <= 2.5
{
	st += spawn;
	gspd = 1;
	image_yscale = abs(image_yscale)
}

//if st = 2.5 {st = 3}

if st >= 2.49
{
	
	st += 0.025
	y -= 4+gspd
	gspd -= 0.069
	
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
if m
{
	m.gethit = 1;
}

if oMario.state = ps.shrink or oMario.state = ps.grow or oMario.state = ps.firetransform
{
	st = st;
	y = y
}