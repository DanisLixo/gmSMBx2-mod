lastenv = global.environment

loadscreen = 30;

global.prevroom = room;

if !audio_is_playing(musChallenge) {
audio_stop_sound(global.ch[0]);
audio_stop_sound(global.ch[1]);
audio_stop_sound(global.ch[2]);
audio_stop_sound(global.ch[3]);
audio_stop_sound(global.ch[4]);
}

audio_stop_sound(global.sfx[0]);

if room = rmExtra or room = rmExtra_sky or room = rmExtra_under	extra = false