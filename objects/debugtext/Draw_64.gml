if room != rmTitle {
	draw_set_font(font);
	draw_text(24,8*4,"HSPD - " + string(oMario.hspd));

	draw_set_font(font);
	draw_text(24,8*5,"VSPD - " + string(oMario.vspd));

	draw_set_font(font);
	draw_text(24,8*6,"ON GROUND - " + string_upper(oMario.grounded));
	
	draw_set_font(font);
	draw_text(24,8*7,"SPRITE FRAME - " + string(oMario.ind));
	
	draw_set_font(font);
	draw_text(24,8*8,"CROUCHING - " + string_upper(oMario.crouch));
	
	draw_set_font(font);
	draw_text(24,8*9,"DANCE CHANCE (MARIO) - " + string(oMario.dancechance));
	
	draw_set_font(font);
	draw_text(24,8*10,"RETRO JUMP CHANCE (DAWN) - " + string(oMario.retrochance));
	
	draw_set_font(font);
	draw_text(24,8*11,"SPINNING (SONIC) - " + string(oMario.spin));
	
	draw_set_font(font);
	draw_text(24,8*12,"SPINDASH BOOST (SONIC) - " + string(oMario.spinboost));
	
	draw_set_font(font);
	draw_text(24,8*13,"SPINDASH CLICKS (SONIC) - " + string(oMario.spinclicks));
}