function ps_normal()
{
	if crouch = false {spin = false;}
	sound = false;
	
	if jumps > 0 jumps = 0
	
	audio_stop_sound(sndOpacandastar)
	holdjump = -1;
	
	var moveh = kr-kl
	
	if moveh != 0
	{
		if char = "Sonic" and global.abilities {
			var accel = 0.06
			var maxhspd = 3.8
			
			if global.environment = e.underwater
			{maxhspd = 2;}
		}
		
		else if char = "Max Verstappen" and global.abilities {
			var accel = 1;
			var maxhspd = 10;
			
			if ka
			{accel = 8; maxhspd = 50;}
			
			spr = ms("sMario_{}_idle"); ind = 0;
		}
		else {
			
			var accel = 0.08
			var maxhspd = 1.5
		
			if ka
			{maxhspd = 2.5;}
		
			if global.environment = e.underwater
			{maxhspd = 0.8;}
		}
		
		if pmach = 6 and char = "Feathy" and global.abilities {maxhspd = 3.2;}
		
		if abs(hspd) < maxhspd && moveh = 1
		{hspd += accel;}
		else if abs(hspd) < maxhspd && moveh = -1
		{hspd -= accel;}
		if !ka && abs(hspd) > maxhspd
		{hspd -= accel*moveh;}
		if sign(hspd) != 0
		{image_xscale = sign(hspd);}
		
		if moveh != image_xscale && abs(hspd) > 0.6 && moveh != 0 && grounded
		{
			state = ps.pivot; 
			image_xscale = -image_xscale; 
			spr = ms("sMario_{}_pivot");
		}
		if moveh != sign(hspd) && abs(hspd) <= 0.6 && moveh != 0 && grounded
		{hspd-= accel*sign(hspd);}
	}
	else
	{
		var deccel = 0.2
		if abs(hspd) - deccel <= 0
		{hspd = 0;}
		if abs(hspd) > 0
		{hspd -= deccel*sign(hspd);}
	}

	if hspd != 0 or !grounded
		{spr = ms("sMario_{}_walk"); if spintimer = 0 {ind += abs(hspd)/7;} 
	if place_meeting(x+sign(hspd),y,oCol) {if spintimer = 0 {ind += 0.15;}
	}
	if (hspd <= -3 or hspd >= 3) && char = "Sonic" {spr = ms("sMario_{}_run"); if spintimer = 0 {ind += 0.2}}
	if pmach >= 6 && char = "Feathy" {spr = ms("sMario_{}_run");}}
	else if global.commandenys = true && kh {state = ps.nah}
	else {spr = ms("sMario_{}_idle"); 
	if spintimer <= 0 {ind = 0};
	}
	
	do_spincarp();
	do_fire();
	do_jump();
	
	if !grounded
	{state = ps.jump;}
	
	releasedrunmidjump = false
	crouch = false;
	
	collide()
	
	
	if kd && powerup != "s" && char != "Dawn" && char != "Sonic" && firetimer = 0 
	{state = ps.crouch;}
	else if kd && firetimer = 0 && (char = "Dawn" or char = "Sonic")
	{state = ps.crouch;}
	if kup
	{state = ps.dance0;}
	if kd && instance_place(x,y,oPipeentrance) && grounded
	{
		if instance_place(x,y,oPipeentrance).activated = "8_4" {state = ps.enterpipedown8_4;}
		else {state = ps.enterpipedown;}
		pipeinforoom = instance_place(x,y,oPipeentrance).troom; 
		sfx(sndWarp,1);
		
		if powerup != "s" && char != "Dawn"
		{spr = ms("sMario_{}_crouch");}
		else if char = "Dawn"
		{spr = ms("sMario_{}_downpipe");}
	}
	if kr && instance_place(x,y,oPipeentranceright) && instance_place(x+1,y,oCol) && grounded
	{state = ps.enterpiperight; pipeinforoom = instance_place(x,y,oPipeentranceright).troom; instance_place(x,y,oPipeentranceright).activated = true; sfx(sndWarp,1);}
	
	if kap && shoulderbash = 0 && char = "Wario" && powerup != "f" and global.abilities
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,0);
	}
	if powerup = "f" && firetimer = 5 && char = "Wario" and global.abilities
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,0);
	}
}