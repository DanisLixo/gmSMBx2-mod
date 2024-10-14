function ps_shoulderbash()
{
	hspd = sign(image_xscale)*3;
	
	if (kl && hspd > 0) or (kr && hspd < 0)
	{if !grounded {hspd = 0;} state = ps.normal; shoulderbash = -10;}
	
	if shoulderbash <= 0
	{shoulderbash = -10; state = ps.normal; if kr-kl = 0 {hspd = 0;}}
	
	if place_meeting(x+hspd,y,oCol)
	{state = ps.shoulderbashend; vspd = -3; hspd = -hspd/2;}
	
	spr = ms("sMario_{}_shoulderbash");
	ind += 0.3;
	
	collide();
	do_jump()
}

function ps_shoulderbashend()
{
	if grounded
	{state = ps.normal; shoulderbash = -10; hspd = 0;}
	
	invincible = -1;
	ind = 1;
		
	collide();
}