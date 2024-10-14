lastenv = global.environment

//if !instance_exists(oClient) {loadscreen = 30;}
loadscreen = 30;

global.prevroom = room;

if !bgm_is_playing("Challenge") {
	audio_stop_sound(global.ch[0]);
	audio_stop_sound(global.ch[1]);
	audio_stop_sound(global.ch[2]);
	audio_stop_sound(global.ch[3]);
	audio_stop_sound(global.ch[4]);
}

audio_stop_sound(global.sfx[0]);
