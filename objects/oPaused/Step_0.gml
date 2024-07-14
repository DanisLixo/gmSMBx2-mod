if !settingsmenu {
	psel += (instance_exists(oMenu))? 0 : 
	keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu);
	if psel > 3 psel = 0
	if psel < 0 psel = 3

	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.keyj)) && oGame.destroy = 0 && oGame.delay >= 10 
		{
		switch psel {
			case 0: instance_destroy(); break;
			case 1: settingsmenu = true; oGame.delay = 0; break;
			case 2: instance_activate_all(); room_restart(); global.time = timeunits(400) break;
			case 3: instance_activate_all(); if instance_exists(oClient) {oMario.image_alpha = 0; game_restart();} room_goto(rmTitle);  break;
		}
		oGame.spawnx = -1;
		oGame.spawny = -1;
		instance_activate_object(oNekoPresence);
		pitch = (pitched = true)? 1.3 : 1;
		pitched = false;
		audio_sound_pitch(global.ch[0],pitch)
		audio_sound_pitch(global.ch[1],pitch)
		audio_sound_pitch(global.ch[2],pitch)
		audio_sound_pitch(global.ch[3],pitch)
		audio_sound_pitch(global.ch[4],pitch)
	}
}
