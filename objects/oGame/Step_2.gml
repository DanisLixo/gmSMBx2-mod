if instance_exists(oMario) && oMario.starman > 120 && (!audio_is_playing(musStarman_c0) && !audio_is_playing(musStarman) && !audio_is_playing(musFamilyGuyStarman) && !audio_is_playing(musHerewego) && !audio_is_playing(musMaxVerstappenStarman))
{
	bgm("Starman",true);
}

if os_device = os_android and SCREENW != display_get_width()/4.5 {SCREENW = display_get_width()/4.5; screenResize();}

if instance_exists(oMario) &&  oMario.starman = 120
{audio_stop_all(); bgm(global.curbgm,true);}

// handle music channels
if global.sfx[0] != -1 && audio_is_playing(global.sfx[0])
{
	audio_sound_gain(global.ch[global.sfx[1]],0,1)
	if global.sfx[1] != 4 and global.ch_allowed[global.sfx[1]] = false {audio_sound_gain(global.sfx[0],0,1)}
}
else
{
	if loadscreen != -1
	{
	}
	else
	{
		audio_sound_gain(global.ch[0],global.volbgm,1)
		audio_sound_gain(global.ch[1],global.volbgm,1)
		audio_sound_gain(global.ch[2],global.volbgm,1)
		audio_sound_gain(global.ch[3],global.volbgm,1)
		audio_sound_gain(global.ch[4],global.volbgm,1)
		global.sfx[0] = -1;
	}
	
	
}


// handle time
if global.time > 0 && mario_freeze() = 0 && loadscreen = -1 && instance_exists(oPaused) = false
{global.time --;}

if (global.challenge = true || room = rmDemoend || instance_exists(oClient)) and !instance_exists(oRacemanager) {global.time = -1;}


if instance_exists(oMario) && ((oMario.state = ps.flagpolefinish && oMario.depth = 399)
	or (global.race = true && oMario.finishedrace = true && oMario.state != ps.flagpoledescend))
{
	if !instance_exists(oLuigi) || instance_exists(oLuigi) and (oLuigi.state = ps.flagpolefinish && oLuigi.depth = 399) 
	{
		if global.time > 0
		{
		if timeunits(global.time) mod 20 = 0
		{sfx(sndBeep,0);}
		global.time -= timeunits(2)
		global.score += 100;
		global.p2_score += 100;
		}
	}
	
	if !instance_exists(oClient) or (instance_exists(oClient) && global.race = false)
	{
		if global.time <= 0 && triggercastleflag = false
		{
			triggercastleflag = true;
			global.time = 0;
			if instance_exists(oCastleflag)
			{oCastleflag.st = 2; oCastleflag.fireworks = fireworks; oCastleflag.alarm[0] = 20; alarm[1] = room_speed*4.3}
		}
	}
	
}
else
{
	var tget = round(global.time/(room_speed*TIMESEC)) % 10
	if tget = 1 or tget = 3 or tget = 6
	{fireworks = tget;}
	else
	{fireworks = 0;}
}


if keyboard_check_pressed(vk_f11)
{window_set_fullscreen(!window_get_fullscreen());}


// TIME UP
if global.race = false
{
	if global.time <= timeunits(100) && global.time >= 0 && timeup >= 0 && room != rmLeveltransition
		{timeup ++;
		if instance_exists(oMario) && (oMario.state = ps.castleending or oMario.state = ps.flagpolefinish)
		{warned = 2;}
		}
		
	if timeup = 1 && warned = false {
		pitch = 0;
		audio_sound_pitch(global.ch[0],pitch)
		audio_sound_pitch(global.ch[1],pitch)
		audio_sound_pitch(global.ch[2],pitch)
		audio_sound_pitch(global.ch[3],pitch)
		audio_sound_pitch(global.ch[4],pitch)
		bgm("Warning",false);
		} 
	else if timeup > 180 // or warned = 1
	{
		warned = true;
		
		/*audio_resume_sound(global.ch[0])
		audio_resume_sound(global.ch[1])
		audio_resume_sound(global.ch[2])
		audio_resume_sound(global.ch[3])
		audio_resume_sound(global.ch[4])*/
		pitch = 1.3
	
	
		if instance_exists(oMario) && (oMario.state = ps.castleending or oMario.state = ps.flagpolefinish)
		{pitch = 1;}

		audio_sound_pitch(global.ch[0],pitch)
		audio_sound_pitch(global.ch[1],pitch)
		audio_sound_pitch(global.ch[2],pitch)
		audio_sound_pitch(global.ch[3],pitch)
		audio_sound_pitch(global.ch[4],pitch)
		}

	if global.time = 0 && instance_exists(oMario) &&
	  !(oMario.state = ps.castleending or
		oMario.state = ps.emerge or
		oMario.state = ps.flagpolefinish or
		oMario.state = ps.flagpoledescend or
		oMario.state = ps.title or
		oMario.state = ps.die)
	{oMario.state = ps.die;}
}
else
{global.time = 999;}

if room = rmLeveltransition or room = rmTitle {warned = 0}

if instance_exists(oClient) {global.multiplayer = false;}

if global.race = true && instance_exists(oMario) && (oMario.state = ps.normal or oMario.state = ps.jump)
	&& !instance_exists(oRacemanager) && room != rmLobby and room != rmTitle
{
	instance_create_depth(x,y,depth,oRacemanager);
}

if !instance_exists(oCoin) and global.level = 3 {global.hiddenoneup = true;}

