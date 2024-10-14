function ps_pivot()
{
	holdjump = -1;
	spr = ms("sMario_{}_pivot");
	
	if char = "Martin" {ind += 0.4;}
	if char = "Max Verstappen" and ind < 3 {ind += abs(hspd)/50;}
	
	
	var deccel = 0.12
	if abs(hspd) > 0
	{
		var deccel = 0.15
		if abs(hspd) - deccel <= 0
		{hspd = 0;}
		if abs(hspd) > 0
		{hspd -= deccel*sign(hspd);}
	}
	
	var moveh = kr-kl
	if moveh != 0 and moveh != image_xscale {state = ps.normal;}
	
	if hspd != 0
	{image_xscale = -sign(hspd);}
	
	if !grounded && vspd > 1
	{state = ps.jump; spr = ms("sMario_{}_walk");}
	if grounded && hspd = 0
	{state = ps.normal;}
	if kd
	{state = ps.crouch;}
		
	do_jump()
	
	collide()
}