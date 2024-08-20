//if room != rmTitle {
	draw_set_font(font);
	draw_text(24,8*4,"X - " + string(oLetterbox.x));
	draw_text(24,8*5,"Y - " + string(oLetterbox.y));
	/*if instance_exists(oFeather) {
		
		draw_text(24,8*4,"ROW - " + string(oFeather.row));
		
		
		draw_text(24,8*5,"VSPD - " + string(oFeather.vspd));
		
		
		draw_text(24,8*6,"HSPD - " + string(oFeather.hspd));
		
	}*/
	/*if instance_exists(oBlooper) {
		
		draw_text(24,8*4,"VSPD - " + string(oBlooper.vspd));
		
		draw_text(24,8*5,"MOVEMENT - " + string(oBlooper.movement));
		
		draw_text(24,8*6,"MAY TURN - " + string(oBlooper.turnchance));
		
		draw_text(24,8*7,"VERTICAL LIMIT - " + string(oBlooper.vlimit));
	}*/
	/*if instance_exists(o2Cheep) {
		
		draw_text(24,8*4,"VSPD - " + string(o2Cheep.vspd));
		
		draw_text(24,8*5,"MOVEMENT - " + string(o2Cheep.hspd));
		
		draw_text(24,8*6,"UP 0 ... DOWN 1 - " + string(o2Cheep.facingdir));
		
		draw_text(24,8*7,"VERTICAL LIMIT - " + string(o2Cheep.vlimit));
		
		draw_text(24,8*8,"Y START - " + string(o2Cheep.ystart));
	}*/
	if instance_exists(oHammerbro) {
		
		draw_text(24,8*4,"JUMPIN - " + string(oHammerbro.jump));
		
		draw_text(24,8*5,"AGRESSIVE - " + string(oHammerbro.aightcomehere));
		
		draw_text(24,8*6,"HAMMERING - " + string(oHammerbro.hammertimer));
	}
	/*if instance_exists(oRope) {
		var scheck = (instance_nearest(oMario.x, oMario.y, oRope).platformcheck)? "YES" : "NAH"
		
		draw_text(24,8*4,"PLATFORM CHECKED BY ROPE - " + scheck);
		
		draw_text(24,8*5,"ROPE SCALE - " + string(instance_nearest(oMario.x, oMario.y, oRope).image_yscale));
		
	}*/
	/*if instance_exists(oClient) {
		
		draw_text(24,8*4,"WAIT - " + string(global.waiting));
		
		draw_text(24,8*5,"PLAYERS - " + string(oClient.players));
		
		draw_text(24,8*6,"FINISHED PLAYERS - " + string(oClient.Iended));
		
		draw_text(24,8*7,"SYNCHING - " + string(global.sync));
	}*/
	/*if instance_exists(oCheckpointmask) {
		
		draw_text(24,8*4,"X START - " + string(oMario.xstart));
		
		draw_text(24,8*5,"X CHECK. - " + string(oCheckpointmask.x));
	}
	
	
	draw_text(24,8*6,"XSPAWN - " + string(oGame.spawnx));
	
	draw_text(24,8*7,"WILL KILL - " + string(global.killenys));*/
	
	//
	//draw_text(24,8*8,"CALC IS A SLANG FOR CALCULATOR CHAT - " + string(round(SCREENW/85)));
	
	/*
	draw_text(24,8*4,"VSPD - " + string(oMario.vspd));
	
	
	draw_text(24,8*5,"HSPD - " + string(oMario.hspd));
	
	if instance_exists(oFireflower)
	{
		
		draw_text(24,8*6,"FLOATING - " + string(oFireflower.float));
	}
	
	
	draw_text(24,8*7,"SPR FRAME - " + string(oMario.ind));*/
	
	//
	//draw_text(24,8*7,"JUMP BUFF - " + string(oMario.jumpbuffer));

	/*
	draw_text(24,8*6,"ON GROUND - " + string_upper(oMario.grounded));
	
	
	draw_text(24,8*8,"CROUCHING - " + string_upper(oMario.crouch));
	

	
	draw_text(24,8*9,"DANCE CHANCE (MARIO) - " + string(oMario.dancechance));
	
	
	draw_text(24,8*10,"RETRO JUMP CHANCE (DAWN) - " + string(oMario.retrochance));
	
	
	draw_text(24,8*11,"SPINNING (SONIC) - " + string(oMario.spin));
	
	
	draw_text(24,8*12,"SPINDASH BOOST (SONIC) - " + string(oMario.spinboost));
	
	
	draw_text(24,8*13,"SPINDASH CLICKS (SONIC) - " + string(oMario.spinclicks));
	
	
	draw_text(24,8*9,"TIME UP TRIGGER - " + string(oGame.timeup));
	
	
	draw_text(24,8*10,"DELAY CLICK - " + string(oGame.delay));
	
	
	draw_text(24,8*4,"MARIO X - " + string(oMario.x));
	
	
	draw_text(24,8*5,"CAMERA X - " + string(oCamera.x));
	
	
	draw_text(24,8*6,"DX - " + string((oMario.x-oCamera.x)/10));
	
	if oMario.kap {cx = string(oCamera.x)}
	
	draw_text(24,8*7,"REGISTRED CX - " + string(cx));
	
	
	draw_text(24,8*4,"JUMPS - " + string(oMario.jumps));*/
//}