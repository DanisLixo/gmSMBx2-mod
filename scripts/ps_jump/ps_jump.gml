function ps_jump()
{
	if global.environment = e.underwater and char != "Sonic"
	{state = ps.swim;}
	else if char = "Sonic" and global.abilities {do_jump()}
	else if global.environment = e.underwater and !global.abilities {state = ps.swim;}
	
	if char = "Dawn" and global.environment != e.underwater and jumps < 1 and global.abilities
	{if kjp {jumps++} do_jump()}
	
	if char = "Feathy" and global.environment != e.underwater and pmach >= 6 and powerup = "c" and holdjump > 0 and global.abilities
	{state = ps.fly; holdjump = 30;}
	
	var moveh = kr-kl

	var accel = 0.05
	var maxhspd = 1.5
		
	if ka && releasedrunmidjump = false
		{maxhspd = 3;}
		
	if char = "Sonic" and global.environment != e.underwater and global.abilities {accel = 0.05; maxhspd = 3;}
		
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
	
	
	if kar && releasedrunmidjump = false
	{releasedrunmidjump = true;}
	
	if grounded
	{
		pmet = 0;
		shoulderbash = -10;
		if kd
		{state = ps.crouch;}
		else if !kd
		{state = ps.normal;}
	}
	
	if holdjump >= 0
	{
		holdjump --
		
		vspd -= (holdjump/58)
		
		if !kj
		{holdjump = -1;}
		if vspd > 0
		{holdjump = -1;}
	}
	
	if char = "Luigi" and global.abilities && !crouch
	{vspd -= 0.1;}
	
	if kj and powerup = "c" and sign(vspd) = 1 {vspd -= vspd/10}

	if global.abilities {do_spincarp();}
	if !crouch {do_fire();}
	
	if char = "Luigi" || char = "Sonic" {ind += 0.4;}
	else if char = "Martin" {ind += 0.3;}
	else {
		if spr != ms("sMario_{}_walk") {
			if sprite_get_number(spr) == 1
				ind = 0;
			else
				ind += 0.3
		}
	}
	
	collide();
	
	if (vspd >= 0) && !grounded && !crouch && !place_meeting(x,y,oBeanstalk) 
	&& sprite_exists(ms("sMario_{}_fall"))
	{
		if spr != ms("sMario_{}_jumpretro")
		{spr = ms("sMario_{}_fall"); ind += 0.4;}
	}
	
	if char == "Dawn" { 
		if retrochance >= 90 and powerup = "s" 
		{spr = ms("sMario_s_jumpretro");}
		if !crouch && vspd < 0 and jumps >= 1
		{spr = ms("sMario_{}_jumpdouble"); ind += 0.4;}
	}
	
	if char = "Feathy" and !crouch {
		if spintimer > 0 {ind += 0.3}
		if pmach >= 6 and spintimer <= 0 {spr = ms("sMario_{}_runjump");}
	}
	if char = "Sonic" {
		spr = ms("sMario_{}_spinjump");
	}
	if instance_place(x,y,oBeanstalk)
	{x = instance_place(x,y,oBeanstalk).x+8; y -= 1; state = ps.climb;}
	
	sound = false;
}
