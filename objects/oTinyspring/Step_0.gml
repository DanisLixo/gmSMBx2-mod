var m = instance_place(x,y-4,oMario);

switch(SPRINGST)
{
	case 0:
	
	wait = 0;
	if m && round(ind) = 0
	{
		savedhspd = m.hspd
		m.grounded = false;
		ind = 1;
	}
	else if m && round(ind) = 1
	{
		m.grounded = false;
		ind = 2;
	}
	else if m && round(ind) = 2
	{
		SPRINGST = 1;
		ind = 2;
	}
	
	if !m && ind > 0
	{ind -= 0.2;}
	break;
	case 1:
	
	ind = 2;
	wait ++;
	
	if instance_exists(oMario) && m 
	{
		if wait < 5 {m.hspd = 0;}
		else {
			m.vspd = -givevspd;
			m.state = ps.jumpcut
			SPRINGST = 2;
		}
	}
	if instance_exists(oMario) && m 
	{m.grounded = false;}
	
	if !m or wait >= 6
	{SPRINGST = 0; ind = 0;}
	
	break
	case 2:
	
	ind -= 0.2;
	
	if ind = 0
	{SPRINGST = 0; ind = 0;}
	m = instance_place(x,y,oMario);
	if m
	{SPRINGST = 0; m.grounded = false; ind = 0;}
	else 
	{wait --;}
	
	
	break;
	
	
}

image_index = round(ind);

if moving = true {
	x += hspd*dir
	if place_meeting(x+dir,y,oCol)
		{dir = -dir}
	if instance_place(x+dir,y,oParblock)
		{instance_place(x+dir,y,oParblock).dir = -instance_place(x+dir,y,oParblock).dir; dir = -dir;}
}

m = instance_place(x+8*dir,y,oMario);

if m && global.movestatics = true && m.state = ps.nah
{
	moving = true
	dir = -dir
	sfx(sndBump,0);
}
