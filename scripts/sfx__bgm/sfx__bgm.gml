///@funtion sfx
///@description Self explanatory, it plays a sound effect. It creates the classic audio type effect.
///@param {Audio Asset} [Sound] The sound to play
///@param {Real} [Channel] Which channel should the audio be played WARNING: modern option will disable the effect.

function sfx(sound,channel)
{
	var soundstring = audio_get_name(sound);
	if object_index = oLuigi {var mySnd = soundstring+"_"+global.playertwo;}
	else {var mySnd = soundstring+"_"+global.player;}
	
	if asset_get_index(mySnd) != -1
	{sound = asset_get_index(mySnd);}
	else if ds_map_find_value(global.moddedSounds, mySnd) != undefined
	{sound = ds_map_find_value(global.moddedSounds, mySnd)}
	else
	{sound = asset_get_index(soundstring)}
	
	if global.musicchannels = true && global.volsfx > 0
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
	
	if is_string(bgmstr) && global.musicchannels = true && global.volbgm > 0
	{
		audio_stop_sound(global.ch[0]);
		audio_stop_sound(global.ch[1]);
		audio_stop_sound(global.ch[2]);
		audio_stop_sound(global.ch[3]);
		audio_stop_sound(global.ch[4]);
		
		audio_stop_all();
		
		var charname = global.player;
		charname = string_replace(charname," ","_")
			
		var charsound = "mus"+bgmstr+"_"+charname;
		var charthemestr = "mus"+charname;
		
		#region For Mods
		
		if ds_map_find_value(global.moddedChars, charname) != undefined {
			if ds_map_find_value(global.moddedSounds, charsound) != undefined 
			{global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); exit;}
			if ds_map_find_value(global.moddedSounds, charthemestr) != undefined 
			{global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charthemestr),1,loops,global.volbgm); exit;} 
			
			if global.ch_allowed[0] {
				if ds_map_find_value(global.moddedSounds, charsound+"_c0") != undefined 
				{global.ch[0] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c0"),1,loops,global.volbgm);}
			}
			if global.ch_allowed[1] {
				if ds_map_find_value(global.moddedSounds, charsound+"_c1") != undefined 
				{global.ch[1] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c1"),1,loops,global.volbgm);}
			}
			if global.ch_allowed[2] {
				if ds_map_find_value(global.moddedSounds, charsound+"_c2") != undefined 
				{global.ch[2] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c2"),1,loops,global.volbgm);}
			}
			if global.ch_allowed[3] {
				if ds_map_find_value(global.moddedSounds, charsound+"_c3") != undefined 
				{global.ch[3] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c3"),1,loops,global.volbgm);}
			}
		
			if ds_map_find_value(global.moddedSounds, charsound+"_c0") != undefined 
			|| ds_map_find_value(global.moddedSounds, charsound+"_c1") != undefined 
			|| ds_map_find_value(global.moddedSounds, charsound+"_c2") != undefined
			|| ds_map_find_value(global.moddedSounds, charsound+"_c3") != undefined 
			{global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); exit;}
			else if ds_map_find_value(global.moddedSounds, charsound) != undefined 
			{global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); exit;}
		}
		
		#endregion
		
		var sound = "mus"+bgmstr;
		
		var chartheme	 = asset_get_index("mus"+charname);
		var charsong = asset_get_index(charsound);
		var c0 = audio_exists(asset_get_index(charsound+"_c0"))?	asset_get_index(charsound+"_c0") : asset_get_index(sound+"_c0");
		var c1 = audio_exists(asset_get_index(charsound+"_c1"))?	asset_get_index(charsound+"_c1") : asset_get_index(sound+"_c1");
		var c2 = audio_exists(asset_get_index(charsound+"_c2"))?	asset_get_index(charsound+"_c2") : asset_get_index(sound+"_c2");
		var c3 = audio_exists(asset_get_index(charsound+"_c3"))?	asset_get_index(charsound+"_c3") : asset_get_index(sound+"_c3");
		var savior = asset_get_index(sound);
		
		#region Built-in focused system
		if global.player != "Syobon"  {
			if audio_exists(charsong) {
				global.ch[4] = audio_play_sound(charsong,1,loops,global.volbgm); exit;
			} 
			
			if audio_exists(chartheme) && bgmstr != "Starman" && bgmstr != "Levelend" && bgmstr != "Castleend" && bgmstr != "Toadstool"
			{
				global.ch[4] = audio_play_sound(chartheme,1,loops,global.volbgm); exit;
			} 
		}
		
		if global.ch_allowed[0] {
			if audio_exists(c0)  {global.ch[0] = audio_play_sound(c0,1,loops,global.volbgm);}
		}
		if global.ch_allowed[1] {
			if audio_exists(c1)  {global.ch[1] = audio_play_sound(c1,1,loops,global.volbgm);}
		}
		if global.ch_allowed[2] {
			if audio_exists(c2) {global.ch[2] = audio_play_sound(c2,1,loops,global.volbgm);}
		}
		if global.ch_allowed[3] {
			if audio_exists(c3)  {global.ch[3] = audio_play_sound(c3,1,loops,global.volbgm);}
		}
		
		if !audio_exists(c0) && !audio_exists(c1) && !audio_exists(c2) && !audio_exists(c3)
		{
			if audio_exists(savior) {global.ch[4] = audio_play_sound(savior,1,loops,global.volbgm);}
			else if audio_exists(charsong) {global.ch[4] = audio_play_sound(charsong,1,loops,global.volbgm);}
			
			if (bgmstr == "Secret4") {audio_sound_set_track_position(global.ch[4], random_range(0, 15.35));}
		}
		
		#endregion
	}
	else
	{
		audio_stop_sound(global.ch[4])
		
		if bgmstr != -1
		{
			var mus = asset_get_index("mus"+bgmstr)
				if bgmstr != "Lobby" && bgmstr != "Retro" && bgmstr != "Warning" && bgmstr != "Challenge" && bgmstr != "Demoend" {
					if global.player = "Peter Griffin" || global.playertwo = "Peter Griffin" && global.multiplayer
					{
						if bgmstr = "GO"	{mus = musGO_Peter_Griffin;}
						else if bgmstr = "Starman"	{mus = musStarman_Peter_Griffin;}
						else if bgmstr = "Levelend" or bgmstr = "Castleend"	{mus = musLevelend_Peter_Griffin;}
						else {mus = musPeter_Griffin;}
					}
					if global.player = "Pokey" || global.playertwo = "Pokey" && global.multiplayer
					{
						if bgmstr = "GO"	{mus = musGO_Pokey;}
						else if bgmstr = "Starman"	{mus = musStarman_Pokey;}
						else if bgmstr = "Levelend" or bgmstr = "Castleend"	{mus = musLevelend_Pokey;}
						else {mus = musPokey;}
					}
					if global.player = "Syobon" || global.playertwo = "Syobon" && global.multiplayer
					{
						if bgmstr = "OW"	{mus = musOW_Syobon;}
						else if bgmstr = "UG"	{mus = musUG_Syobon;}
						else if bgmstr = "CS"	{mus = musCS_Syobon;}
						else if bgmstr = "Title"	{mus = musTitle_Syobon;}
					}
					if global.player = "Max Verstappen" || global.playertwo = "Max Verstappen" && global.multiplayer
					{
						if bgmstr = "Starman" {mus = musStarman_Max_Verstappen;}
					}
					if (bgmstr = "OW" or bgmstr = "UW" or bgmstr = "UG" or bgmstr = "CS")
					{
						if global.player = "Anton" || global.playertwo = "Anton" && global.multiplayer
						{mus = musAnton;}
						if global.player = "Martin" || global.playertwo = "Martin" && global.multiplayer
						{mus = musMartin;}
						if global.player = "Duke" || global.playertwo = "Duke" && global.multiplayer
						{mus = musDuke;}
					}
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

function bgm_is_playing(bgmstr)
{
	if is_string(bgmstr)
	{
		if global.volbgm == 0 {return true;}
		
		var charname = global.player;
		charname = string_replace(charname," ","_")
		
		var charsound = "mus"+bgmstr+"_"+charname;
		var charthemestr = "mus"+charname;
		
		#region For Mods
		if ds_map_find_value(global.moddedSounds, charsound) != undefined 
		{return audio_is_playing(ds_map_find_value(global.moddedSounds, charsound));}
		if ds_map_find_value(global.moddedSounds, charthemestr) != undefined 
		{return audio_is_playing(ds_map_find_value(global.moddedSounds, charthemestr));} 
		
		if ds_map_find_value(global.moddedSounds, charsound+"_c0") != undefined 
		|| ds_map_find_value(global.moddedSounds, charsound+"_c1") != undefined 
		|| ds_map_find_value(global.moddedSounds, charsound+"_c2") != undefined
		|| ds_map_find_value(global.moddedSounds, charsound+"_c3") != undefined 
		{return audio_is_playing(ds_map_find_value(global.moddedSounds, charsound+"_c0"));}
		else if ds_map_find_value(global.moddedSounds, charsound) != undefined 
		{return audio_is_playing(ds_map_find_value(global.moddedSounds, charsound));}
		#endregion
		
		var sound = "mus"+bgmstr;
		
		#region Built-in focused system
		var charsong = asset_get_index(charsound);
		var c0 = audio_exists(asset_get_index(charsound+"_c0"))?	asset_get_index(charsound+"_c0") : asset_get_index(sound+"_c0");
		var c1 = audio_exists(asset_get_index(charsound+"_c1"))?	asset_get_index(charsound+"_c1") : asset_get_index(sound+"_c1");
		var c2 = audio_exists(asset_get_index(charsound+"_c2"))?	asset_get_index(charsound+"_c2") : asset_get_index(sound+"_c2");
		var c3 = audio_exists(asset_get_index(charsound+"_c3"))?	asset_get_index(charsound+"_c3") : asset_get_index(sound+"_c3");
		var savior = asset_get_index(sound);
		
		if audio_exists(charsong)
		{return audio_is_playing(charsong);} 
		if !audio_exists(c0) && !audio_exists(c1) && !audio_exists(c2) && !audio_exists(c3)
		|| !global.musicchannels
		{
			return audio_is_playing(savior);
		}
		return audio_is_playing(c0);
		#endregion
	}
}