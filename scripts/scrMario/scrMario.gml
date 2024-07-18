function ms(spritestring)
{
	var pu = "s";
	
	if object_index = oMario || object_index = oLuigi
	{
		var pu = powerup;
		if (pu = "f" || pu = "c") and char != "1pixelMario"
		{pu = "b";}
	
		spritestring = string_replace(spritestring,"{}",pu)
		spritestring = string_replace(spritestring,"Mario",char);
		
		if char = "Anton"
		{return sAnton;}
		if char = "Goldron"
		{return sGoldron;}
		if char = "Peter Griffin"
		{return sPeterGriffin;}
		if char = "Duke"
		{return sDuke;}
		if char = "Pokey"
		{return sPokey;}
		if char = "Max Verstappen"
		{return sMaxVerstappen;}
		if char =  "Max Verstappen" {
		if powerup = "f" and state != ps.pivot {return sMaxVerstappen_F1;}
		else if powerup != "f" and state != ps.pivot {return sMaxVerstappen;}
		else if powerup = "f" and state = ps.pivot {return sMaxVerstappen_F1_turning;}
		}
	}
	else {
		spritestring = string_replace(spritestring,"Mario",global.player);
		
		if global.player = "Anton"
		{return sAnton;}
		if global.player = "Goldron"
		{return sGoldron;}
		if global.player = "Peter Griffin"
		{return sPeterGriffin;}
		if global.player = "Duke"
		{return sDuke;}
		if global.player = "Pokey"
		{return sPokey;}
		if global.player = "Max Verstappen"
		{return sMaxVerstappen;}
		if global.player =  "Max Verstappen" {
		if powerup = "f" and state != ps.pivot {return sMaxVerstappen_F1;}
		else if powerup != "f" and state != ps.pivot {return sMaxVerstappen;}
		else if powerup = "f" and state = ps.pivot {return sMaxVerstappen_F1_turning;}
		}
		}
	
	if sprite_exists(asset_get_index(spritestring))
	{return asset_get_index(spritestring);}
	else
	//{return superFUCKINGmario}
	{return spr;}
}

function cs(capestring = "") {
	if capestring == "" {
		capestring = sprite_get_name(oMario.spr)
		capestring = string_replace(capestring, oMario.char + "_b", "Cape")
	}
	
	if sprite_exists(asset_get_index(capestring))
		{return asset_get_index(capestring);}
	else
		{return sCape_idle;}
}

function gs(gunspritestr) {
	gunspritestr = string_replace(gunspritestr,"Default",global.gunskin);
	
	if sprite_exists(asset_get_index(gunspritestr))
	{return asset_get_index(gunspritestr);}
	else
	{return sGun_Default;}
}

function do_jump()
{
	if global.environment = e.underwater
	{
		if char != "Sonic" {
			if kjp && y > 64
			{
				sfx(sndStomp,0);
				vspd = -3; 
				state = ps.swim;
				if spintimer > 0 {ind = ind}
				else {ind = 0};
				grounded = false;
			}
			if !grounded && (state != ps.swim && state != ps.swimidle)
			{state = ps.swim;}
		}
		else {
			if (kjp or jumpbuffer > 0) && y > 64
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
		if powerup = "s" and char != "Dawn" {spr = ms("sMario_{}_jump"); ind = 0;}
		else if !kd and powerup != "s" {spr = ms("sMario_{}_jump"); ind = 0;}
		else if retrochance >= 90 and char =  "Dawn" and powerup = "s" {spr = ms("sMario_s_jumpretro"); ind = 0;}
		
		if char = "Sonic" {spr = ms("sMario_{}_spinjump"); ind = 0;}

		if state = ps.shoulderbash
		{spr = ms("sMario_{}_shoulderbash"); ind = 1;}
		
		vspd = -3 -(abs(hspd)/6);
		if crouch and char = "Goldron" {vspd -= 2;}
		if jumps >= 1 and char = "Dawn" {vspd += 1.5;}
		state = ps.jump;
		
		grounded = false;
		holdjump = 30;
	}
}

function do_fire()
{
	if firetimer = 0 && kap && powerup = "f" && instance_number(oFireball) <= 1
	{
		if (char =  "Pokey" or char =  "Gemaplys") && instance_number(oHatThrow) < oGame.hats
		{instance_create_depth(x,bbox_top+6,depth,oHatThrow).facing = sign(image_xscale);
		firetimer = 10;
		sfx(sndFireballthrown,1);}
		
		else if char !=  "Pokey" and char !=  "1pixelmario" and char !=  "Gemaplys"
		{instance_create_depth(x,bbox_top+6,depth,oFireball).facing = sign(image_xscale);
		firetimer = 10;
		sfx(sndFireballthrown,1);}
		
		else if char =  "1pixelmario"
		{instance_create_depth(x,bbox_top-2,depth,oFireball).facing = sign(image_xscale);
		firetimer = 10;
		sfx(sndFireballthrown,1);}
	}
}

function do_spincarp()
{
	if kap && powerup = "c" and spintimer <= 0 {
		spintimer = 30;
	}
	
	if spintimer > 0 {
		spr = ms("sMario_{}_spin"); ind += 0.4;
	}
}

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
		if char = "Sonic" {
			var accel = 0.06
			var maxhspd = 3.8
			
			if global.environment = e.underwater
			{maxhspd = 2;}
		}
		
		else if char = "Max Verstappen" {
			var accel = 1;
			var maxhspd = 10;
			
			if ka
			{accel = 8; maxhspd = 50;}
		}
		else {
			
			var accel = 0.08
			var maxhspd = 1.5
		
			if ka
			{maxhspd = 2.5;}
		
			if global.environment = e.underwater
			{maxhspd = 0.8;}
		}
		
		if pmach = 6 and char = "Feathy" {maxhspd = 3.2;}
		
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
			if char =  "Max Verstappen" 
			{
				if powerup = "f" {spr = ms("sMaxVerstappen_F1_turning");}
			}
			else 
			{spr = ms("sMario_{}_pivot");} 
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
	{spr = ms("sMario_{}_walk"); ind += abs(hspd)/7; if place_meeting(x+sign(hspd),y,oCol) {ind += 0.15;}
	 if (hspd <= -3 or hspd >= 3) && char = "Sonic" {spr = ms("sMario_{}_run"); ind += 0.2}
	 if pmach >= 6 && char = "Feathy"{spr = ms("sMario_{}_run");}}
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
		state = ps.enterpipedown; pipeinforoom = instance_place(x,y,oPipeentrance).troom; sfx(sndWarp,1);
		if powerup != "s" && char != "Dawn"
		{spr = ms("sMario_{}_crouch");}
		else if char = "Dawn"
		{spr = ms("sMario_{}_crouch");}
	}
	if kr && instance_place(x,y,oPipeentranceright) && instance_place(x+1,y,oCol) && grounded
	{state = ps.enterpiperight; pipeinforoom = instance_place(x,y,oPipeentranceright).troom; instance_place(x,y,oPipeentranceright).activated = true; sfx(sndWarp,1);}
	
	if kap && shoulderbash = 0 && char = "Wario" && powerup != "f"
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,0);
	}
	if powerup = "f" && firetimer = 5 && char = "Wario"
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,0);
	}
}

function ps_jump()
{
	if global.environment = e.underwater and char != "Sonic"
	{state = ps.swim;}
	else if char = "Sonic" {do_jump()}
	
	if char = "Dawn" and global.environment != e.underwater and jumps < 1 
	{if kjp {jumps++} do_jump()}
	
	if char = "Feathy" and global.environment != e.underwater and pmach >= 6 and powerup = "c" and holdjump > 0
	{state = ps.fly; holdjump = 30;}
	
	var moveh = kr-kl

	var accel = 0.05
	var maxhspd = 1.5
		
	if ka && releasedrunmidjump = false
		{maxhspd = 3;}
		
	if char = "Sonic" and global.environment != e.underwater {accel = 0.15; maxhspd = 3;}
		
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
	
	
	if char = "Luigi" 
	{vspd -= 0.1;}
	if kj and powerup = "c" and vspd >= -0.2 {vspd -= 0.2}

	do_spincarp();
	do_fire();
	
	if char = "Luigi" or char = "Sonic" {ind += 0.4;}
	if char = "Martin" {ind += 0.3;}		

	
	collide();
	
	if char = "Dawn" and !crouch {
		if (vspd >= -0.5||ind = 1.6) and retrochance < 90 and !grounded and not instance_place(x,y,oBeanstalk) {spr = ms("sMario_{}_fall"); ind += 0.4;}
		else if vspd < -0.5 and !kd {
			if jumps >= 1 {spr = ms("sMario_s_jumpdouble"); ind += 0.4;}
			else {spr = ms("sMario_{}_jump"); ind = 0;}
			}
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
}

function ps_fly()
{
	var moveh = (image_xscale)? kr-kl : kl-kr
	
	if ka {
		if holdjump >= 0
		{
			holdjump--
		
			vspd = -4
			if !kj
			{holdjump = -1;}
			if holdjump = 0
			{holdjump = -1;}
		}
		else if holdjump < 0 {
			spr = ms("sMario_{}_cape");
			if vspd <= 0 {ind = 2}
			if vspd >= 0.4 {ind = 1}
			if vspd >= 0.8 {ind = 0}
			
			if flymoved {flytimer--;}
			if moveh = 0 || fly = false {vspd += 0.1 if vspd >= 0.6 {vspd -= 0.1}}
			if moveh = 1 {vspd += 0.1}
			if moveh = -1 //and flytimer >= 0 
			{
				if fly {vspd -= 0.15;} 
				else {moveh = 0} 
			}
			if vspd >= 1.25 {fly = true;}
			else if vspd <= -2.5 {fly = false;}
		}
	}
	else {state = ps.jump; holdjump = -1}
	
	var c = instance_place(x,y+vspd*2,oCol)
	var b = instance_place(x,y+vspd*2,oParblock)
	if c
	{
		if instance_place(x,y,oCol)
		{x -= hspd*2; state = ps.normal;}
		if y <= c.y {
		state = ps.normal;
		}
		else {
		vspd += 1;
		}
	}
	if b
	{
		if instance_place(x,y,oParblock)
		{x -= hspd*2; state = ps.normal;}
		if y <= b.y {
		state = ps.normal;
		}
		else {
		vspd += 1;
		var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
				
			if block && block.blockstate = 0
				{block.blockstate = 1; block.triggerbreak = true;}
			if block && !place_meeting(x,y,block)
				{sfx(sndBump,1);}
		}
	}
	
	y += vspd
	x += hspd
	
	if !instance_exists(oIsArena)
	{
		x = clamp(x,8,room_width-8);
		x = clamp(x,camera_get_view_x(view_camera[0])+8,room_width-8);
		y = clamp(y,-8,room_height+64);
	}
}

function ps_pivot()
{
	holdjump = -1;
	
	if char =  "Max Verstappen" 
			{
				if powerup = "f" {spr = ms("sMaxVerstappen_F1_turning");}
			}
			else 
			{spr = ms("sMario_{}_pivot");} 
	
	if char = "Martin" {ind += 0.4;}
	
	
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
		
	do_jump()
	
	collide()
}

function ps_die()
{
	dietimer ++;
	var maxtime = 40;
	
	invincible = -2;
	
	depth = -1000
	
	if dietimer = 1
	{
		bgm("GO",false);
		if global.stars != 0 
		{repeat(global.stars) {instance_create_depth(x,y,depth,oSuperstar).vspd = -10;}}
	}
	
	if dietimer < maxtime
	{hspd = 0; vspd = 0;}
	if dietimer = maxtime
	{vspd = -4.5;}
	if dietimer > maxtime
	{vspd += 0.2;}
	
	spr = ms("sMario_s_die")
	
	if y < room_height+sprite_get_height(spr)+8
	y += vspd
	else if instance_number(oMario) >= 2 {instance_destroy()}
}

function ps_enterpipedown()
{
	depth = 399;
	y += 1;
	
	invincible = -2;
	
	if !place_meeting(x,y,oPipeentrance)
	{room_goto(pipeinforoom);}
	
	if char = "Dawn" {
	spr = ms("sMario_{}_downpipe");
	ind = 0;
	ind += 0.4;
	}
}

function ps_enterpiperight()
{
	depth = 399;
	x += 1;
	ind += 0.2;
	
	invincible = -2;
	
	if !place_meeting(x,y,oPipeentranceright)
	{room_goto(pipeinforoom);}
	
	if instance_place(bbox_left,y,oPipeentranceright) && bbox_left >= instance_place(bbox_left,y,oPipeentranceright).bbox_left+16
	{image_alpha = 0;}
}

function ps_exitpipeup()
{
	depth = 399;
	y--;
	
	invincible = -2;
	
	if !place_meeting(x,y,oCol) && !place_meeting(x,y,oPipeexit)
	{state = ps.normal; depth = 0}
}

function ps_crouch()
{
	sprite_index = sMariomask0
	
	if global.commandenys = true and khp {state = ps.nah}
	else {spr = ms("sMario_{}_crouch");}
	
	if char != "Sonic"
	{
		do_jump()
	}
	else if powerup = "s" {
		do_jump()
		if (hspd < -0.01 and image_xscale = -1) or hspd > 0.01 {
			if !sound {sfx(sndSpindash,1);}
			spr = ms("sMario_{}_spinjump"); spin = true;
			}
		else {spin = false; state = ps.normal;}
		if spin {ind += 0.15}
		}
	else
	{
		if kdp and (hspd < -0.01 and image_xscale = -1) or hspd > 0.01 {sfx(sndSpindash,1);}
		if !global.commandenys and !khp and !sdcheck {spr = ms("sMario_{}_crouch");}
		if hspd >= -0.01 and hspd <= 0.01 {spr = ms("sMario_{}_crouch"); spin = false; sdcheck = false;}
		else if (hspd < -0.01 and image_xscale = -1) or hspd > 0.01 {
			//if !sound {sfx(sndSpindash,1);}
			spr = ms("sMario_{}_spinjump"); spin = true;
			}
		if spin {ind += 0.15}
		if kd and hspd >= -0.01 and hspd <= 0.01 and kjp and !spin and powerup != "s"
		{state = ps.spindash; spinclicks++; spinboost += 4*image_xscale; sfx(sndSpindash,1);}
		if sdcheck {do_jump()}
	}
	
	var deccel = 0.05
	if abs(hspd) - deccel <= 0
	{hspd = 0;}
	if abs(hspd) > 0
	{hspd -= deccel*sign(hspd);}
	
	crouch = true
	collide();
	
	if (!kd or powerup = "s") and char != "Dawn" and char != "Sonic"
	{state = ps.normal;}
	else if !kd and (char = "Dawn" or char = "Sonic") and !sdcheck and spin = false
	{state = ps.normal;}
	
	if !grounded and char != "Sonic"
	{state = ps.jump;}
	else if !grounded and char = "Sonic" and powerup != "s"
	{state = ps.jump;}
	
	
	sound = true;
}

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
	}
}

function ps_grow()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	invincible = -2;
	
	ind += 0.3;
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{state = ps.normal; powerup = "b";
		
		
	if kj {
		jumpbuffer++
		if jumpbuffer > 95
				do_jump()
				jumpbuffer = 0;
		
				if powerup = "s"
				{sfx(sndJump,1);}
				else
				{sfx(sndJumpbig,1);}
		
				vspd = -3 -(abs(hspd)/6);
				state = ps.jump;
				spr = ms("sMario_{}_jump");
		
				ind = 0;
		
				holdjump = 30;
			}
		}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max Verstappen"
	{sfx(sndPowerup,1); state = ps.normal; powerup = "b";}
}

function ps_firetransform()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	
	powerup = "f"
	
	ind += 0.3;
	
	if kj {do_jump()}
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{
		state = ps.normal;
		invincible = -4;
		
		if kj or jumpbuffer > 0
		{
			jumpbuffer = 0;
		
			if powerup = "s"
			{sfx(sndJump,1);}
			else
			{sfx(sndJumpbig,1);}
		
			vspd = -3 -(abs(hspd)/6);
			state = ps.jump;
			spr = ms("sMario_{}_jump");
		
			ind = 0;
		
			holdjump = 30;
		}
		
		if kj {do_jump()}
	}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max Verstappen"
	{sfx(sndPowerup,1); state = ps.normal;}
}

function ps_capetransform()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	
	powerup = "c"
	instance_create_depth(x,y-12,depth-1000,oBlow)
	image_alpha = 0;
	
	ind += 0.3;
	
	if kj {do_jump()}
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{
		state = ps.normal;
		invincible = -4;
		
		if kj or jumpbuffer > 0
		{
			jumpbuffer = 0;
		
			if powerup = "s"
			{sfx(sndJump,1);}
			else
			{sfx(sndJumpbig,1);}
		
			vspd = -3 -(abs(hspd)/6);
			state = ps.jump;
			spr = ms("sMario_{}_jump");
		
			ind = 0;
		
			holdjump = 30;
		}
		
		if kj {do_jump()}
	}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max Verstappen"
	{sfx(sndPowerup,1); state = ps.normal;}
}

function ps_shrink()
{
	if spr != ms("sMario_b_shrink")
	{
		ind = 0;
		sfx(sndWarp,1);
	}
	
	ind += 0.3;
	
	spr = ms("sMario_b_shrink");
	
	if ind >= sprite_get_number(spr)-1
	{state = ps.normal; powerup = "s";}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max Verstappen"
	{sfx(sndWarp,1); state = ps.normal; powerup = "s";}
}

function ps_flagpoledescend()
{
	flagpoletimer ++;
	hspd = 0;
	vspd = 0;
	
	if dancechance >= 95 && (powerup = "b" or powerup = "f") && (char = "Mario" or char = "Luigi")
	{spr = ms("sMario_{}_polydance");}
	else
	{spr = ms("sMario_{}_climb");}
	
	invincible = -2;
	
	if !place_meeting(x,y+2,oCol)
	{
		if spr = sMario_b_polydance or spr = sMartin_b_climb or spr = sLuigi_b_polydance
		{y -= 1.5; flagpoletimer -= 0.7}
		y += 2;
		ind += 0.25;
	}
	else
	{ind = 0;}

	if flagpoletimer > room_speed * 2 - 20 && flagpoletimer <= room_speed * 2
	{image_xscale = -abs(image_xscale);}
	else
	{image_xscale = abs(image_xscale);}
	
	if flagpoletimer > room_speed * 2
	{
		bgm("Levelend",false)
		
		if global.race = false
		{x += 8; state = ps.flagpolefinish;}
		else
		{state = ps.normal;}
		flagpoletimer = 0;
	}
	
}

function ps_flagpolefinish()
{
	if instance_exists(oFlagpole)
	{
		if hspd < 1.5
		{hspd += 0.05;}
	}
	else
	{
		if hspd < 0.8
		{hspd += 0.05;}
	}
	
	spr = ms("sMario_{}_walk");
	if grounded {ind += 0.25;}
	
	invincible = -2;
	
	if place_meeting(x,y,oCastlemask)
	{image_alpha = 0;}
	
	
	if instance_place(x,y,oPipeentranceright) && instance_place(x+1,y,oCol) && grounded
	{state = ps.enterpiperight; pipeinforoom = instance_place(x,y,oPipeentranceright).troom; instance_place(x,y,oPipeentranceright).activated = true; sfx(sndWarp,1);}
	
	collide();
}

function ps_castleending()
{
	invincible = -2; 
	
	if castleendingtrigger = true
	{
		image_xscale = abs(image_xscale);
		if hspd != 0 && grounded
		{spr = ms("sMario_{}_walk"); ind += abs(hspd)/7; if place_meeting(x+sign(hspd),y,oCol) {ind += 0.15;}}
		else if hspd = 0 && grounded
		{spr = ms("sMario_{}_idle"); ind = 0;}
		if !place_meeting(x,y,oToad)
		{hspd = 1.5;}
		else if abs(hspd) > 0
		{
			if hspd - 0.2 <= 0 {hspd = 0;} else {hspd -= 0.2;}
		}
		
		
		collide()
	}
	else
	{hspd = abs(hspd); vspd = 0;}
	if khp and hspd = 0 {state = ps.nah}
}

function ps_swim()
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
	
	if khp {state = ps.nah}
}

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
function ps_climb()
{
	spr = ms("sMario_{}_climb");
	
	if kjp 
	{state = ps.normal; x -= image_xscale * 8; hspd = 0; vspd = 0;}
	
	if ku && place_meeting(x,y-16,oBeanstalk)
	{y --;}
	if kd && !place_meeting(x,y+1,oCol)
	{y ++;}
	
	if place_meeting(x,y+1,oCol)
	{state = ps.normal; x -= image_xscale * 8; hspd = 0; vspd = 0;}
	
	if ku - kd != 0
	{ind += 0.2;}
	
	if kr
	{image_xscale = -1;}
	if kl
	{image_xscale = 1;}
}

function ps_emerge()
{
	spr = ms("sMario_{}_climb");
	
	if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true
	{exit;}
	
	if !place_meeting(x,y-1,oPlatformtriggerlu) && !place_meeting(x,y-1,oPlatformtriggerrd)
	{image_xscale = 1; y -= 0.8; ind += 0.14;}
	else
	{
		if hspd < 1
		{hspd += 0.05; ind = 0;}
		if hspd = 1
		{ind += 0.05; image_xscale = -1;}
		if ind >= 1 
		{state = ps.normal; x += 8; spr = ms("sMario_{}_walk"); hspd = 0; image_xscale = 1;}
		
	}
}

function ps_dance0()
{
	var deccel = 0.1
	if abs(hspd) - deccel <= 0
	{hspd = 0;}
	if abs(hspd) > 0
	{hspd -= deccel*sign(hspd);}
	
	
	if krp - klp != 0 or kjp
	{state = ps.normal;}
	if kdp && powerup != "s" && char != "Dawn" && char != "Sonic"
	{state = ps.crouch;}
	else if kdp && (char = "Dawn" or char = "Sonic")
	{state = ps.crouch;}
	if khp {state = ps.nah}
	spr = ms("sMario_{}_dance0");
	if global.opacandastar = true && kup
	{sfx(sndOpacandastar,1);}
	if sprite_get_number(spr) > 200
	{ind += 0.5;}
	ind += 0.5;
	collide();
}

function ps_nah()
{
	spr = ms("sMario_{}_nah");
	if ind < 1.5
	{ind += 0.25}
	if khr && castleendingtrigger = true {state = ps.castleending}
	if khr {state = ps.normal}
	if kjp {state = ps.jump}
	if ku {state = ps.dance0}
	do_spincarp();
	do_fire();
}

function ps_spincarp()
{
	if spintimer > 0 {
		spr = ms("sMario_{}_spin");
		ind += 0.3
	}
	else {
		if grounded {
			state = ps.normal;
		}
		else {
			state = ps.jump;
		}
	}
	
	do_jump()
}