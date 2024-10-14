function ps_swim()
{
	if swimmin > 0 {vspd = -1.5}
	var moveh = kr-kl
	var accel = 0.08
	var maxhspd = 1.8
	
	if bbox_top <= 40 {vspd = 0.75; swimmin = 0}
		
	if moveh = 1 && hspd < maxhspd
	{
		hspd += accel;
		if !ka && hspd > maxhspd
		{hspd -= accel}
	}
	if moveh = -1 && hspd > -maxhspd
	{
		hspd -= accel;
		if !ka && hspd < -maxhspd
		{hspd += accel}
	}
	
	spr = ms("sMario_{}_swim");
	ind += 0.3;
	
	if ind + 0.2 > sprite_get_number(spr)
	{ind = 0; state = ps.swimidle;}
	
	if moveh != 0
	{image_xscale = moveh;}

	vspd = clamp(vspd,-4,3);
	vspd -= 0.2;
	
	do_jump();
	do_spincarp();
	do_fire();
	collide();
}

function ps_swimidle()
{
	var moveh = kr-kl
	var accel = 0.08
	var maxhspd = 1.8
		
	if moveh = 1 && hspd < maxhspd
	{
		hspd += accel;
		if !ka && hspd > maxhspd
		{hspd -= accel}
	}
	if moveh = -1 && hspd > -maxhspd
	{
		hspd -= accel;
		if !ka && hspd < -maxhspd
		{hspd += accel}
	}
	
	if moveh != 0
	{image_xscale = moveh;}
	
	spr = ms("sMario_{}_swim");
	ind += 0.2;
	
	if ind + 0.2 >= 2
	{ind = 0;}
	
	vspd = clamp(vspd,-4,3);
	vspd -= 0.2;
	
	do_jump();
	do_spincarp();
	do_fire();
	collide();
	
	if grounded
	{state = ps.normal;}
	
	if khp and global.commandenys = true {state = ps.nah}
}
