// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_hud() {
	/// handle gui
	draw_set_font(global.fnt)

	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	var tile = 8;

	// FPS
	if global.showfps and string_pos("Title",room_get_name(room)) == 0 
	{
		draw_text(cx+(tile*3),cy+(tile*3),"FPS - " + string(fps) + "/" + string(room_speed))
	}

	if room != rmTitle_MK && string_pos("x2",room_get_name(room)) == 0 {
		// Score
		var scorestr = string(global.score)		
		while (string_length(scorestr) < 6)	{scorestr = "0"+scorestr;}

		var sicon = global.player = "Sonic"? sRingicon : sCoinicon;
		var sicon2 = global.playertwo = "Sonic"? sRingicon : sCoinicon;

		if global.multiplayer {
			// MARIO and LUIGI
			var char = string_char_at(string_upper(global.playerName),1)
			draw_text((tile*3)+cx,tile+cy,char + "-" + scorestr)
	
			var p2_char = string_char_at(string_upper(global.playertwoName),1)
			var p2_scorestr = string(global.p2_score)	while (string_length(p2_scorestr) < 6)	{p2_scorestr = "0"+p2_scorestr;}
	
			draw_text((tile*3)+cx,(tile*2)+cy,p2_char + "-" + p2_scorestr)

			// Coins
			shader_set(shdColorswap);
				apply_palette(sPalette_gold,global.environment+1,image_alpha)
				draw_sprite(sicon,image_index,(tile*11)+cx,(tile)+cy)
				draw_sprite(sicon2,image_index,(tile*11)+cx,(tile*2)+cy)
			shader_reset();

			var coinstr = string(global.coins)			if (string_length(coinstr) < 2)		{coinstr = "0"+coinstr;}
			var p2_coinstr = string(global.p2_coins)	if (string_length(p2_coinstr) < 2)	{p2_coinstr = "0"+p2_coinstr;}
			draw_text((tile*12)+cx,(tile)+cy,"*"+coinstr)
			draw_text((tile*12)+cx,(tile*2)+cy,"*"+p2_coinstr)
	
			// Hats
	
			var coindist = string_length(coinstr) < 2? 1 : string_length(coinstr)-2;
			var p2_coindist = string_length(p2_coinstr) < 2? 1 : string_length(p2_coinstr)-2;
	
			if global.player = "Pokey" || global.player = "Gemaplys" || 
			global.playertwo = "Pokey" || global.playertwo = "Gemaplys" 
			{
				shader_set(shdColorswap);
					apply_palette(sPalette_goomba,global.environment,image_alpha)
					if global.player = "Pokey" or global.player = "Gemaplys" 
					{draw_sprite(sHaticon,image_index,(SCREENW-256)+(tile*(15+coindist))+cx,tile+cy);}
					if global.playertwo = "Pokey" or global.playertwo = "Gemaplys" 
					{draw_sprite(sHaticon,image_index,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy);}
				shader_reset();
		
				var hatstr = string(global.hats-instance_number(oHatThrow)) if (string_length(hatstr) < 2) {hatstr = "0"+hatstr;}
				if global.player = "Pokey" or global.player = "Gemaplys" {
					draw_text((SCREENW-256)+(tile*(16+coindist))+cx,tile+cy, "*" + hatstr);
				}
				if global.playertwo = "Pokey" or global.playertwo = "Gemaplys" {
					draw_text((SCREENW-256)+(tile*(16+p2_coindist))+cx,(tile*2)+cy, "*" + hatstr);
				}
				draw_set_font(global.fnt);
			}

			// P meter
			if instance_exists(oMario) and (oMario.powerup = "c" || global.player = "Feathy") || instance_exists(oLuigi) and
			(oLuigi.powerup = "c" || global.playertwo = "Feathy") {
				shader_set(shdColorswap);
					apply_palette(sPalette_gold,global.environment+1,image_alpha)
					if (oMario.powerup = "c" || global.player = "Feathy")
					{draw_sprite(sPmeter,global.pind,(SCREENW-256)+(tile*(15+coindist))+cx,tile+cy)}
					if instance_exists(oLuigi) {if (oLuigi.powerup = "c" || global.playertwo = "Feathy")
					{draw_sprite(sPmeter,global.p2_pind,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy)}}
					//draw_sprite(sPmeterbig,oMario.pind,(tile*5)+cx,(SCREENH-(240/2))+(tile*13)+cy)
				shader_reset();
			}	
		} else {
			// MARIO
			draw_text((tile*3)+cx,tile+cy,string_upper(global.playerName))
	
			// Score
			draw_text((tile*3)+cx,(tile*2)+cy,scorestr)

			// Coins
			shader_set(shdColorswap);
				apply_palette(sPalette_gold,global.environment+1,image_alpha)
				draw_sprite(sicon,image_index,(tile*11)+cx,(tile*2)+cy)
			shader_reset();

			var coinstr = string(global.coins)	if (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
			draw_text((tile*12)+cx,(tile*2)+cy,"*"+coinstr)
	
			// Hats
			if global.player = "Pokey" || global.player = "Gemaplys"
			{
				shader_set(shdColorswap);
					apply_palette(sPalette_goomba,global.environment,image_alpha)
					draw_sprite(sHaticon,image_index,(tile*11)+cx,tile+cy);
				shader_reset();
	
				var hatstr = string(global.hats-instance_number(oHatThrow)); if (string_length(hatstr) < 2) {hatstr = "0"+hatstr;}
				draw_text((tile*12)+cx,tile+cy, "*"+hatstr);
		
				draw_set_font(global.fnt);
			}

			// P meter
			if instance_exists(oMario) and (oMario.powerup = "c" || global.player = "Feathy") {
				shader_set(shdColorswap);
					apply_palette(sPalette_gold,global.environment+1,image_alpha)
					draw_sprite(sPmeter,global.pind,(tile*11)+cx,tile+cy)
				shader_reset();
			}	
		}

		// WORLD
		var mptile = global.multiplayer? 4:2

		if !global.challenge and !instance_exists(oIsArena) && string_pos("Title",room_get_name(room)) == 0 && room != rmLobby and room != rmDemoend
		{
			if global.player == "Gemaplys" 
			{draw_text((SCREENW-(256/2))+(tile*mptile)+cx-tile,(tile)+cy,"PELOTAS");}
			else {draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile)+cy,"WORLD");}
			if global.level != 0 
			{
				var level  = string(global.world)+"-"+string(global.level);
				if global.extra 
				{draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile*2)+cy,"EXTRA")}
				else 
				{draw_text((SCREENW-(256/2))+(tile*mptile)+tile+cx,(tile*2)+cy,level)}
			}
		}
		if instance_exists(oIsArena)
		{
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile)+cy,"GOAL")
			draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,(tile*2)+cy,global.goalofstars)
		}
		if global.challenge {
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile)+cy,"RETROED")
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*2)+cy,string(global.retros))
		}

		// Time
		draw_text((SCREENW-(256/2))+(tile*9)+cx,(tile)+cy,"TIME")

		if global.time >= 0 and room != rmLeveltransition and room != rmDemoend
		{
			var timestr = string(round(global.time/(room_speed*TIMESEC)))
			while (string_length(timestr) < 3)	{timestr = "0"+timestr;}
			draw_text((SCREENW-(256/2))+(tile*10)+cx,(tile*2)+cy,timestr)


			if instance_exists(oRacemanager) && global.race = true
			{
				var mm = string(oRacemanager.minutes);
				var ss = string(oRacemanager.seconds);
				var mls = string(oRacemanager.milliseconds);
		
		
				while (string_length(mm) < 2)	{mm = "0"+mm;}
				while (string_length(ss) < 2)	{ss = "0"+ss;}
				while (string_length(mls) < 3)	{mls = "0"+mls;}
		
				timestr = mm+":"+ss+":"+mls;
		
				draw_set_halign(fa_right);
				//draw_text((SCREENW/2)+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
				draw_text((SCREENW-(256/2))+(tile*13)+cx,(tile*3)+cy,timestr)
				draw_set_halign(fa_left);
			}
		}
	}
}