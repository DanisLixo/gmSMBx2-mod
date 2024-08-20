function sfx(sound,channel)
{
	if global.musicchannels = true
	{
		if audio_is_playing(sound) {audio_stop_sound(sound);}
		global.sfx[0] = audio_play_sound(sound,1,false,global.volsfx)
		global.sfx[1] = channel
	}
	else
	{
		audio_play_sound(sound,1,false,global.volbgm)
	}
}

function bgm(bgmstr,loops)
{
	if instance_exists(oRacemanager) && !(bgmstr = "Levelend" or bgmstr = "GO" or bgmstr = "Demoend")
	{
		exit;
	}
	
	if is_string(bgmstr) && global.musicchannels = true && global.volsfx > 0 &&
	global.player != "Peter Griffin" && global.player != "Martin" && global.player != "Anton" && global.player != "Duke" && global.player != "Pokey" && global.player != "Max_Verstappen"
		&& bgmstr != "Levelend" && bgmstr != "Castleend" && bgmstr != "Lobby" && bgmstr != "Retro" && bgmstr != "Warning" && bgmstr != "Challenge" && bgmstr != "Demoend"
	{
		audio_stop_sound(global.ch[0]);
		audio_stop_sound(global.ch[1]);
		audio_stop_sound(global.ch[2]);
		audio_stop_sound(global.ch[3]);
		audio_stop_sound(global.ch[4]);
		
		audio_stop_all();
	
		var c0 = asset_get_index("mus"+bgmstr+"_c0")
		var c1 = asset_get_index("mus"+bgmstr+"_c1")
		var c2 = asset_get_index("mus"+bgmstr+"_c2")
		var c3 = asset_get_index("mus"+bgmstr+"_c3")
	
		if audio_exists(c0) and global.ch_allowed[0] {global.ch[0] = audio_play_sound(c0,1,loops,global.volbgm);}
		if audio_exists(c1) and global.ch_allowed[1] {global.ch[1] = audio_play_sound(c1,1,loops,global.volbgm);}
		if audio_exists(c2) and global.ch_allowed[2] {global.ch[2] = audio_play_sound(c2,1,loops,global.volbgm);}
		if audio_exists(c3) and global.ch_allowed[3] {global.ch[3] = audio_play_sound(c3,1,loops,global.volbgm);}
	}
	else
	{
		audio_stop_sound(global.ch[4])
		
		if bgmstr != -1
		{
			var mus = asset_get_index("mus"+bgmstr)
			
				if global.player = "Peter Griffin"
				{
					if bgmstr = "GO"	{mus = musFamilyguydie;}
					else if bgmstr = "Starman"	{mus = musFamilyGuyStarman;}
					else if bgmstr = "Levelend" or bgmstr = "Castleend"	{mus = musFamilyguyLevelend;}
					else if bgmstr = "Warning" {mus = musWarning;}
					else {mus = musFamilyGuy;}
				}
				if global.player = "Pokey"
				{
					if bgmstr = "GO"	{mus = musKRL;}
					else if bgmstr = "Starman"	{mus = musHerewego;}
					else if bgmstr = "Levelend" or bgmstr = "Castleend"	{mus = musHereweend;}
					else if bgmstr = "Warning" {mus = musWarning;}
					else {mus = musPokeymato;}
				}
				if global.player = "Max_Verstappen"
				{
					if bgmstr = "Starman" {mus = musMaxVerstappenStarman;}
				}
				if (bgmstr = "OW" or bgmstr = "UW" or bgmstr = "UG" or bgmstr = "CS")
				{
					if global.player = "Anton"
					{mus = musAnton;}
					if global.player = "Martin"
					{mus = musMartin;}
					if global.player = "Duke"
					{mus = musJohnnyTest;}
				}
			
			global.ch[4] = audio_play_sound(mus,1,loops,global.volbgm);
			
		}
		else
		{
			audio_stop_sound(global.ch[0]);
			audio_stop_sound(global.ch[1]);
			audio_stop_sound(global.ch[2]);
			audio_stop_sound(global.ch[3]);
			audio_stop_sound(global.ch[4]);
		}
	}
}

function points(amnt,give)
{
	var p = instance_create_depth((bbox_left+sprite_width/2),bbox_top-8,-9999,oPoints);
	var m = instance_nearest(p.x,p.y,oMario);
	var ind = 0
	switch(amnt)
	{
		case 1: ind = 1; amnt = 100; break;
		case 2: ind = 2; amnt = 200; break;
		case 3: ind = 3; amnt = 400; break;
		case 4: ind = 4; amnt = 500; break;
		case 5: ind = 5; amnt = 800; break;
		case 6: ind = 6; amnt = 1000; break;
		case 7: ind = 7; amnt = 2000; break;
		case 8: ind = 8; amnt = 4000; break;
		case 9: ind = 9; amnt = 5000; break;
		case 10: ind = 10; amnt = 8000; break;
		//
		case 100: ind = 1; break;
		case 200: ind = 2; break;
		case 400: ind = 3; break;
		case 500: ind = 4; break;
		case 800: ind = 5; break;
		case 1000: ind = 6; break;
		case 2000: ind = 7; break;
		case 4000: ind = 8; break;
		case 5000: ind = 9; break;
		case 8000: ind = 10; break;
	}
	if ind != 0
	{
		if give = true
		{
			if m.object_index = oLuigi {global.p2_score += amnt;}
			else {global.score += amnt;}
		}
		p.image_index = ind;
	}
}

function BLAST()
{
	if global.player = "Anton"
	{
		var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
		ins.image_xscale = 0.2
		ins.image_yscale = 0.2
	
		ins.x -= (sprite_width)
		ins.y -= (sprite_height)
	}
}

function onview()
{
	if global.sync {return false}
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var tile = object_index = oBowser? 8 : 16
	if bbox_right+tile > cx && bbox_left-tile < cx+SCREENW && bbox_bottom+tile > cy && bbox_top-tile < cy+SCREENH
	{return true;}
	return false;
}

function move_out(pixels,collision)
{
	for (var i = 0; i < pixels; i ++;)
	{
		if place_meeting(x,y,collision)
		{
			if !place_meeting(x+i,y,collision)		{x += i;}
			else if !place_meeting(x-i,y,collision)	{x -= i;}
			if !place_meeting(x,y-i,collision)		{y -= i;}
			else if !place_meeting(x,y+i,collision)	{y += i;}
		}
	}
}