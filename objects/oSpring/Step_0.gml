var m = instance_place(x,y-4,oMario);

if issecret != false 
{
	if place_meeting(x,y+1,oSecretblock) and vspd >= 0 and issecret != 3
	{
		vspd = 0;
		issecret = 2;
	}
	if issecret = 1 
	{
		vspd += 0.3;
	}
	if issecret = 3
	{
		with(oMario) {
			if instance_place(x,y,oBeanstalktopwarp) {room_goto(instance_place(x,y,oBeanstalktopwarp).troom)}
		}
	}
	
	y += vspd
	col.y += vspd
}

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
	
	if instance_exists(oMario) && m and m.kjp and wait <= 5 {givevspd = 12; if issecret = 2 {givevspd += 8; if issecret != false {issecret = 3;}}}
	if instance_exists(oMario) && m 
	{
		if wait < 5 {m.hspd = 0;}
		else {
			m.vspd = -givevspd;
			m.hspd = savedhspd
			SPRINGST = 2;
			alarm[0] = 360
		}
	}
	if instance_exists(oMario) && m 
	{m.grounded = false;}
	
	if !m or wait >= 6
	{SPRINGST = 0; ind = 0; givevspd = 8;}
	
	break
	case 2:
	
	ind -= 0.2;
	
	if ind = 0
	{SPRINGST = 0; ind = 0;}
	m = instance_place(x,y,oMario);
	if m
	{SPRINGST = 0; m.grounded = false; ind = 0;}
	else 
	{wait --; givevspd = 8;}
	
	
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
