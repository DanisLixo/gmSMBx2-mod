try {
	ds_list_add(debuglist,"XSPAWN - " + string(oGame.spawnx));
	ds_list_add(debuglist,"WILL KILL - " + string(global.killenys));
	ds_list_add(debuglist,"CALC IS A SLANG FOR CALCULATOR CHAT - " + string(round(SCREENW/85)));
	ds_list_add(debuglist,"PVP - " + string(global.pvp));
	ds_list_add(debuglist,"1UP - " + string_upper(global.hiddenoneup));
	ds_list_add(debuglist,"CHAR - " + string_upper(global.playerName));
	ds_list_add(debuglist,"ID - " + string_upper(global.player));
	ds_list_add(debuglist,"CHAR P2 - " + string_upper(global.playertwoName));
	ds_list_add(debuglist,"ID P2 - " + string_upper(global.playertwo));
	
	if instance_exists(oMario) {
		ds_list_add(debuglist,"HSPD - " + string(oMario.hspd));
		ds_list_add(debuglist,"VSPD - " + string(oMario.vspd));
		ds_list_add(debuglist,"DANCE - " + string(oMario.pepdancin));
		ds_list_add(debuglist,"RETRO - " + string(oMario.retrochance));
		ds_list_add(debuglist,"POLYDANC - " + string(oMario.dancechance));
		ds_list_add(debuglist,"STATE - " + string(oMario.state));
		ds_list_add(debuglist,"DEMO TIMER - " + string(oMario.playDemo));
	}
	
	if instance_exists(oBowser) {
		ds_list_add(debuglist,"BW C - " + string(oBowser.c));
		ds_list_add(debuglist,"BW FIRE - " + string(oBowser.firetimer));
		ds_list_add(debuglist,"BW HAMMER - " + string(oBowser.hammertimer));
	}
	
	if instance_exists(oLetterbox) {
		ds_list_add(debuglist,"LETBOX X - " + string(oLetterbox.x));
		ds_list_add(debuglist,"LETBOX Y - " + string(oLetterbox.y));
	}
	
	if instance_exists(oHammerbro) {
		ds_list_add(debuglist,"JUMPIN - " + string(oHammerbro.jump));
		ds_list_add(debuglist,"AGRESSIVE - " + string(oHammerbro.aightcomehere));
		ds_list_add(debuglist,"HAMMERING - " + string(oHammerbro.hammertimer));
	}
	
	if instance_exists(oPartner) {
		ds_list_add(debuglist,"SPRITE - " + string_upper(sprite_get_name(debug_nearest(oPartner).sprite_index)));
		ds_list_add(debuglist,"INDEX - " + string_upper(debug_nearest(oPartner).image_index));
		ds_list_add(debuglist,"STATE - " + string_upper(debug_nearest(oPartner).state));
		ds_list_add(debuglist,"TURN - " + string_upper(debug_nearest(oPartner).turning));
		ds_list_add(debuglist,"X - " + string_upper(debug_nearest(oPartner).x));
	}
	
	if instance_exists(oFeather) {
		ds_list_add(debuglist,"ROW - " + string(debug_nearest(oFeather).row));
		ds_list_add(debuglist,"VSPD - " + string(debug_nearest(oFeather).vspd));
		ds_list_add(debuglist,"HSPD - " + string(debug_nearest(oFeather).hspd));
	}
	
	if instance_exists(oBlooper) {
		ds_list_add(debuglist,"VSPD - " + string(debug_nearest(oBlooper).vspd));
		ds_list_add(debuglist,"MOVEMENT - " + string(debug_nearest(oBlooper).movement));
		ds_list_add(debuglist,"MAY TURN - " + string(debug_nearest(oBlooper).turnchance));
		ds_list_add(debuglist,"VERTICAL LIMIT - " + string(debug_nearest(oBlooper).vlimit));
	}
	
	if instance_exists(o2Cheep) {
		ds_list_add(debuglist,"VSPD - " + string(debug_nearest(o2Cheep).vspd));
		ds_list_add(debuglist,"MOVEMENT - " + string(debug_nearest(o2Cheep).hspd));
		ds_list_add(debuglist,"UP 0 ... DOWN 1 - " + string(debug_nearest(o2Cheep).facingdir));
		ds_list_add(debuglist,"VERTICAL LIMIT - " + string(debug_nearest(o2Cheep).vlimit));
		ds_list_add(debuglist,"Y START - " + string(debug_nearest(o2Cheep).ystart));
	}
	
	if instance_exists(oBillspawner) {
		ds_list_add(debuglist,"JUMPIN - " + string(debug_nearest(oBillspawner).cannontimer));
	}
	
	if instance_exists(oRope) {
		ds_list_add(debuglist,"ROPE SCALE - " + string(debug_nearest(oRope).image_yscale));
	}
	
	if instance_exists(oMarioDemorunner) {
		var spr = sprite_get_name(debug_nearest(oMarioDemorunner).sprite_index);
		ds_list_add(debuglist,"RUNNER SPRITE - " + string_upper(spr));
	}
	
	if instance_exists(oClient) {
		ds_list_add(debuglist,"WAIT - " + string(global.waiting));
		ds_list_add(debuglist,"PLAYERS - " + string(oClient.players));
		ds_list_add(debuglist,"FINISHED PLAYERS - " + string(oClient.Iended));
		ds_list_add(debuglist,"SYNCHING - " + string(global.sync));
		ds_list_add(debuglist,"PLAYERS - " + string(oClient.players));
		ds_list_add(debuglist,"WARN - " + string(oClient.warntimer));
	}
	
	if instance_exists(oCheckpointmask) {
		if instance_exists(oMario) ds_list_add(debuglist,"X START - " + string(oMario.xstart));
		ds_list_add(debuglist,"X CHECK. - " + string(debug_nearest(oCheckpointmask).x));
	}
	
	if instance_exists(oFireflower)
	{
		ds_list_add(debuglist,"FLOATING - " + string(debug_nearest(oFireflower).float));
	}
	
	if instance_exists(oPodoboo)
	{
		ds_list_add(debuglist,"PDB C - " + string(debug_nearest(oPodoboo).c));
		ds_list_add(debuglist,"PDB VSPD - " + string(debug_nearest(oPodoboo).vspd));
		ds_list_add(debuglist,"PDB Y - " + string(debug_nearest(oPodoboo).y));
	}
	
	if instance_exists(oSpring)
	{
		ds_list_add(debuglist,"SECRET STATE - " + string(debug_nearest(oSpring).issecret));
	}
	
	if instance_exists(oFireball) {
		ds_list_add(debuglist,"ARROW GROUNDS - " + string(debug_nearest(oFireball).boings));
	}
} catch(readerr) {warning += 100;}