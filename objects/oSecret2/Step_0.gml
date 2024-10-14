if oMario.x > 552 && !mrretro 
{
	if !audio_is_playing(sndMRRETRO) {sfx(sndMRRETRO,4) alarm[0] = 427;}
	
	oMario.in_cutscene = true;
	oMario.x = 553
	global.freecam = false;
	oCamera.x++;
	
	timer++
	if timer > 120	mrretro = true;
}
if mrretro {
	if mrretro_alpha < 0.65 {mrretro_alpha += 0.0075;}
	if !audio_is_playing(sndMRRETRO) && room = bornroom {room_goto(rm2_1);}
}

global.time++