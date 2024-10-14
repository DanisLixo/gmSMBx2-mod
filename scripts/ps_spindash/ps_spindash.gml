function ps_spindash()
{
	sprite_index = sMariomask0
	spin = true;
	if spinboost > 6 and spinclicks != 6 and image_xscale = 1 {spinboost--}
	else if spinboost < -6 and spinclicks != 6 and image_xscale = -1 {spinboost++}
	crouch = true
	sdcheck = true
	
	if kjp {
		ind = 0
		spinclicks++
		spinboost += 7/spinclicks*image_xscale; 
		
		sfx(sndSpindash,1);
		
		}	
	spr = ms("sMario_{}_spindash"); ind += 0.15
	
	if !kd
	{
		sfx(sndSpinrelease,3);
		hspd = spinboost;
		spr = ms("sMario_{}_spinjump");
		spinboost = 0
		spinclicks = 0
		state = ps.crouch;
		sound = true;
	}
}
