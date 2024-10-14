collidecode = false;

if global.environment = e.underwater {
	bubble--;
	
	if bubble = 0 /*and instance_number(oBubble) < 3*/ {
		instance_create_depth(bbox_right,bbox_top,depth-1,oBubble);
		bubble = 60; 
	}
}

if instance_place(x+hspd,bbox_bottom-1+vspd,oParblock) && shoulderbash > 0
{
	if instance_exists(oParblock)
	{
		var block = instance_place(x+hspd,bbox_bottom-1+vspd,oParblock)
				
		if block && block.blockstate = 0
		{block.blockstate = 1; if powerup != "s" {block.triggerbreak = true;}}
		if block && !place_meeting(x,y,block)
		{sfx(sndBump,1);}
	}
}
if starman > 120 && !bgm_is_playing("Starman")
{
	bgm("Starman",true);
}
if starman = 120
{audio_stop_all(); bgm(global.curbgm,true);}
if starman == 1 {instance_create_depth(x,y,depth,oPudestroy).sprite_index = sSuperstar;}

var h = hspd > 0? 8 : -8
if instance_place(x+hspd+h,bbox_bottom-1+vspd,oParblock) && spintimer > 0
{
	if instance_exists(oParblock)
	{
		var block = instance_place(x+hspd,bbox_bottom-1+vspd,oParblock)
				
		if block && block.blockstate = 0
		{block.blockstate = 1; if powerup != "s" {block.triggerbreak = true;}}
		if block && !place_meeting(x,y,block)
		{sfx(sndBump,1);}
	}
}

if y > room_height+32 && state != ps.emerge && state != ps.jumpcut {
	if instance_place(x,y,oSky_fallwarp)
	{room_goto(instance_place(x,y,oSky_fallwarp).troom)}
	else {state = ps.die;}
}


if gethit
{
	if !instance_place(x,y,other) 
	{
		if invincible = 0
		{
			invincible = room_speed*3
			if powerup = "s"
			{state = ps.die;}
			else
			{
				state = ps.shrink; invincible = room_speed*4;
			}
		}
	}
	else if invincible <= 1 {invincible = 2;}
	gethit = false;
}

if global.abilities {
	if shoulderbash > 0 && grounded
	{shoulderbash --;}
	if shoulderbash < 0
	{shoulderbash = 0}
	
	if spintimer > 0 
	{spintimer --;}
	if taunttimer > 0 
	{taunttimer --;}
	
	if state = ps.normal || state == ps.pivot 
	|| state == ps.jump || state == ps.crouch 
	|| state == ps.swim || state == ps.swimidle
	{
		do_taunt();
		
		//if char == "Peppino" && ku && grounded {state = ps.dancepep}
	} 
	
	if ka and hspd != 0 and mario_freeze() = 0 {pmet++;}
	else {pmet--; if pmach >= 6 {pmach = 0;}}

	if pmet >= 35 and global.environment != e.underwater {
	if pmach < 6 pmach += 0.1
	}
	if state = ps.fly {pmach = 6;}

	if pmach > 0.9 and (hspd = 0 || state = ps.pivot) {pmach -= 0.5}
	if pmach >= 6 and !audio_is_playing(sndP) and char = "Feathy" {sfx(sndP,0)}
}

if invincible > 0
{invincible --; image_alpha = sign(invincible mod 2);}
if  invincible < 0
{invincible ++;}

if starman > 0
{starman --; invincible = -2}

if jumpbuffer > 0 and mario_freeze() = 0 {jumpbuffer --;}
if kjp {jumpbuffer = 7;}

if firetimer > 0 
{firetimer --;}

if swimmin > 0 
{swimmin --;}

if starman > 0
{starman --;}

if round(invincible) = 0
{image_alpha = 1;}

if grounded {combo = 0;}
if combo > 9 {combo = 10;}

if kd and instance_place(x,y,oMario) and instance_place(x,y,oMario).powerup = "f" and instance_place(x,y,oMario).char = "Max Verstappen"
{
	insidecar = true;
}

if insidecar {
	x = oLuigi.x
	y = oLuigi.y
	image_alpha = 0;
	invincible = 10
}

switch(state)
{
	case ps.normal:
		ps_normal();
	break;
	case ps.jump:
		ps_jump();
	break;
	case ps.pivot:
		ps_pivot();
	break;
	case ps.die:
		ps_die();
	break;
	case ps.enterpipedown:
		ps_enterpipedown();
	break;
	case ps.enterpiperight:
		ps_enterpiperight();
	break;
	case ps.exitpipeup:
		ps_exitpipeup();
	break;
	case ps.crouch:
		ps_crouch();
	break;
	case ps.grow:
		ps_grow();
	break;
	case ps.shrink:
		ps_shrink();
	break;
	case ps.flagpoledescend:
		ps_flagpoledescend();
	break;
	case ps.flagpolefinish:
		ps_flagpolefinish();
	break;
	case ps.firetransform:
		ps_firetransform();
	break;
	case ps.capetransform:
		ps_capetransform();
	break;
	case ps.castleending:
		ps_castleending();
	break;
	case ps.swim:
		ps_swim();
	break;
	case ps.swimidle:
		ps_swimidle();
	break;
	case ps.shoulderbash:
		ps_shoulderbash();
	break;
	case ps.shoulderbashend:
		ps_shoulderbashend();
	break;
	case ps.climb:
		ps_climb();
	break;
	case ps.emerge:
		ps_emerge();
	break;
	case ps.fly:
		ps_fly();
	break;
	case ps.dance0:
		ps_dance0();
	break;
	case ps.nah:
		ps_nah();
	break;
	case ps.spindash:
		ps_spindash();
	break;
	case ps.sneeze:
		ps_sneeze();
	break;
	case ps.exploded:
		ps_exploded();
	break;
	case ps.taunt:
		ps_taunt();
	break;
	case ps.dancepep:
		ps_dancepep();
	break;
	case ps.jumpcut:
		spr = ms("sMario_{}_jump"); 
		
		collidecode = true;
		grounded = false;
		vspd += 0.3
		
		x += hspd
		y += vspd
		if instance_place(x,bbox_bottom+vspd,oCol) 
		{state = ps.normal;}
	break;
	case -1:
		player_collision();
		exit;
	break;
	default: spr = ms("sMario_{}_idle");  exit; break;
}

if global.rtxmode = true or global.schutmode = true
{
	if mouse_x > x
	{image_xscale = 1;}
	else
	{image_xscale = -1;}
}

if kjp {retrochance = random(100)}

if starman < 130 and char = "Max Verstappen" and global.abilities {starman = global.time;}
if char = "Max Verstappen" and (state = ps.castleending or state = ps.flagpoledescend or state = ps.flagpolefinish) and global.abilities
{starman = 0}

var sneeze = random_range(0, 100)
if sneeze > 70 and char = "Feathy" and 
instance_place(x+8*sign(hspd),y,oFireflower) and global.abilities
{hspd = 2; state = ps.sneeze; oFireflower.feathy = id}

//if (state != ps.die) {player_collision();}