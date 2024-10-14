function do_jump()
{
	if global.environment = e.underwater
	{
		if (char != "Sonic" and global.abilities) {
			if kjp and bbox_top >= 40
			{
				sfx(sndStomp,0);
				
				vspd = -3; 
				state = ps.swim;
				swimmin = 42;
				
				if spintimer > 0 {ind = ind}
				else {ind = 0};
				
				grounded = false;
			}
			if !grounded && (state != ps.swim && state != ps.swimidle)
			{state = ps.swim;}
		}
		else if global.abilities {
			if (kjp or jumpbuffer > 0) && bbox_top >= 48
			{
				jumpbuffer = 0;
		
				if powerup = "s"
				{sfx(sndJump,1);}
				else
				{sfx(sndJumpbig,1);}
				
				spr = ms("sMario_{}_spinjump"); ind = 0;
				
				vspd = -3 -(abs(hspd)/6);
				state = ps.jump;
		
				grounded = false;
				holdjump = 30;
			}
		}
	}
	else if (grounded || (char = "Dawn" && jumps <= 1)) && (kjp or jumpbuffer > 0)
	{
		jumpbuffer = 0;

		if powerup = "s"
		{sfx(sndJump,1);}
		else
		{sfx(sndJumpbig,1);}
		
		if sprite_get_number(spr) == 1
			ind = 0;
		else
			ind += 0.3
		
		if powerup = "s" {spr = ms("sMario_{}_jump");}
		else if !kd {spr = ms("sMario_{}_jump");}
		if char == "Dawn" {
			if !kd  {spr = ms("sMario_{}_jump");}
			else if retrochance >= 90 and char =  "Dawn" and powerup = "s" 
			{spr = ms("sMario_s_jumpretro");}
		}
		
		if char = "Sonic" {spr = ms("sMario_{}_spinjump");}

		if state = ps.shoulderbash
		{spr = ms("sMario_{}_shoulderbash"); ind = 1;}
		
		vspd = -3 -(abs(hspd)/6);
		if crouch and char = "Goldron" {vspd -= 2;}
		if jumps >= 1 and char = "Dawn" {vspd += 1.5;}
		state = ps.jump;
		
		grounded = false;
		holdjump = 30;
		
		if insidecar {insidecar = false;}
	}
}

function do_fire()
{
	if global.abilities {
		if firetimer <= 8 && kap && powerup = "f" && (char =  "Pokey" or char =  "Gemaplys") && instance_number(oHatThrow) < global.hats
		{
			instance_create_depth(x-3,bbox_top+2,depth,oHatThrow).facing = sign(image_xscale);
			firetimer = 10;
			sfx(sndFireballthrown,1);
		}
		if firetimer <= 8 && kap && powerup = "f" && instance_number(oFireball) <= 1 && !(char =  "Pokey" or char =  "Gemaplys")
		{
			var fb = instance_create_depth(x-3,bbox_top+2,depth,oFireball);
			
			fb.facing = sign(image_xscale);
			fb.m = id;
			firetimer = 10;
			sfx(sndFireballthrown,1);
		}
	}
	else {
		if firetimer = 0 && kap && powerup = "f" && instance_number(oFireball) <= 1
		{
			var fb = instance_create_depth(x,bbox_top+6,depth,oFireball);
			
			fb.facing = sign(image_xscale);
			fb.m = id;
			firetimer = 1;
			sfx(sndFireballthrown,1);
		}
	}
}