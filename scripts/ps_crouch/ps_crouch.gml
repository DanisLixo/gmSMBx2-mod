function ps_crouch()
{
	sprite_index = sMariomask0
	
	if global.commandenys = true and khp {state = ps.nah}
	else {spr = ms("sMario_{}_crouch");}
	
	if global.abilities
		if char != "Sonic" {do_jump()}
		else if powerup = "s" {
			do_jump()
			if (hspd < -0.4 and image_xscale = -1) or hspd > 0.4 {
				if !sound {sfx(sndSpindash,1);}
				spr = ms("sMario_{}_spinjump"); spin = true;
				}
			else {spin = false; state = ps.normal;}
			if spin {ind += 0.15}
			}
		else
		{
			if !sound and ((hspd < -0.1 and image_xscale = -1) or hspd > 0.1) {sfx(sndSpindash,1);}
			if !global.commandenys and !khp and !sdcheck {spr = ms("sMario_{}_crouch");}
			if hspd >= -0.1 and hspd <= 0.1 {spr = ms("sMario_{}_crouch"); spin = false; sdcheck = false;}
			else if (hspd < -0.1 and image_xscale = -1) or hspd > 0.1 {
				spr = ms("sMario_{}_spinjump"); spin = true;
				}
			if spin {ind += 0.15}
			if kd and hspd >= -0.01 and hspd <= 0.01 and kjp and !spin and powerup != "s"
			{state = ps.spindash; spinclicks++; spinboost += 4*image_xscale; sfx(sndSpindash,1);}
			if hspd != 0 {do_jump();}
		}
	else {do_jump()}
	
	var deccel = 0.05
	if abs(hspd) - deccel <= 0
	{hspd = 0;}
	if abs(hspd) > 0
	{hspd -= deccel*sign(hspd);}
	
	crouch = true
	collide();
	
	if global.abilities {
		if (!kd or powerup = "s") and char != "Dawn" and char != "Sonic"
		{state = ps.normal;}
		else if !kd and (char = "Dawn" or char = "Sonic") and !sdcheck and spin = false
		{state = ps.normal;}
	
		if !grounded and char != "Sonic"
		{state = ps.jump;}
		else if !grounded and char = "Sonic" and powerup != "s"
		{state = ps.jump;}
	}
	else {
		if (!kd or powerup = "s") and char != "Dawn"
		{state = ps.normal;}
		else if !kd and char = "Dawn"
		{state = ps.normal;}
	
		if !grounded
		{state = ps.jump;}
	}
	
	sound = true;
}