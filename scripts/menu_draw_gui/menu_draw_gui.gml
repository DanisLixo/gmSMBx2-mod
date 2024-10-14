// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_controls_custom() //REMEMBER THAT RENDERING IS INSIDE THE MENUS OBJECT DRAW GUI SCRIPT
{
	if waitforcontrol < 0
	{waitforcontrol = 0;}

	if waitforcontrol > 0
	{
		waitforcontrol --;
	
		if keyboard_check_pressed(vk_escape)
		{waitforcontrol = 0;}
	
		draw_set_alpha(0.9)
		draw_rectangle_color(-1,-1,SCREENW+1,SCREENH+1,c_black,c_black,c_black,c_black,false)
		draw_set_alpha(1);

		draw_set_halign(fa_middle)
		draw_text(SCREENW/2,SCREENH/2,"WAITING FOR KEY:  "+string(menu[# section, sel]))
		draw_text(SCREENW/2,SCREENH/2 + 16,waitforcontrol)
	
		if keyboard_check_pressed(vk_anykey) && (keyboard_lastkey != vk_enter && keyboard_lastkey != vk_escape)
		{
			variable_global_set(settingkey,keyboard_lastkey)
			waitforcontrol = -1
			savesettings()
		}
	
		draw_text(SCREENW/2,SCREENH-16,"PRESS ESCAPE TO CANCEL")
		draw_set_halign(fa_left)
	
	}

	draw_set_font(-1)

	if waitforcontrol != 0
	{draw_set_halign(fa_left); exit;}
}

function menu_background() {
	draw_set_alpha(0.9);
	draw_set_color(c_black);
	draw_rectangle(0,0,SCREENW,SCREENH,false);
	draw_set_color(-1);
	draw_set_alpha(1); 
	
	if global.titleroom = rmTitle_new 
	{
		var box_width = sprite_get_width(sThetextgavemeideas);
		var box_height = sprite_get_height(sThetextgavemeideas);
		draw_sprite_ext(sThetextgavemeideas, 0, SCREENW/2, SCREENH/2, (SCREENW/1.25)/box_width, (SCREENH/1.25)/box_height, 0, -1, 1)
	}
}

function menu_customize_gui()
{
	if section = 6 || section = 7
	{
		if global.titleroom != rmTitle_MK {
			var player = section == 7? global.playertwo : global.player
		
			var p = sMario_s_idle
			if sprite_exists(ms("sMario_s_idle", player))
			{p = ms("sMario_s_idle", player);}
			var g = sGun_Default
			if sprite_exists(gs("sGun_Default"))
			{g = gs("sGun_Default");}
	
			//draw_set_font(global.fnt);
			//draw_text(xx-cx/2,yy-16,"CATEGORY - " + string_upper(category))
	
			var scale = 4;
			var scaleg = 2;
			if p = sPeterGriffin
			or p = sDuke
			or p = sPokey
			or p = sMax_Verstappen_s_idle {scale = 0.5;}
			if p = sPeppino {scale = 0.75;}
	
			var sp = (global.aspectratio = "ORIGINAL")? 48 : 64;
	
			draw_set_font(fntComicsmall)
			draw_set_halign(fa_center);
		
			var palspr = section == 7? global.p2_palettesprite : global.palettesprite;
			var palind = section == 7? global.p2_paletteindex : global.paletteindex;
			var psel = section == 7? curplayer2sel : curplayersel;
			
			shader_set(shdColorswap); 
			apply_palette(palspr,palind,1); 
			draw_sprite_ext(p,0,SCREENW/2+sp,160+32+sin(current_time/800)*5-8,scale+(marioxs*(scale/4)),scale+(marioys*(scale/4)),0,-1,1)
			shader_reset();
		
			draw_text(SCREENW/2+sp,160+32+10-8,"creator: "+global.creatorlist[| psel])
		
			if sel == 3 && section == 6
			{draw_sprite_ext(g,0,SCREENW/2+sp+32,160+32+sin(current_time/800)*5-8-16,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1)}
		
			draw_set_halign(fa_left);
		
		} else {
			smallMarioWalkDex += 0.2
			smallMarioWalkDex %= sprite_get_number(marSpr)

			bigMarioWalkDex += 0.2
			bigMarioWalkDex %= sprite_get_number(marSpr2)
		
			marioY += marioYAdd	
		
			var g = sGun_Default
			if sprite_exists(gs("sGun_Default"))
			{g = gs("sGun_Default");}
		
			groundX -= 2
			groundX %= 32
			for (var t = 0; t <= SCREENW+32; t += 32) {
				//show_debug_message(t)
				draw_sprite_ext(sGround_brown, 0, groundX + t, 208, 2, 2, 0, c_white, 1)
			}
		
			var player = section == 7? global.playertwo : global.player
			if marioY >= 206 {
				marioY = 206
				marSpr = sMario_s_walk
				if sprite_exists(ms("sMario_s_walk", player))
				{marSpr = ms("sMario_s_walk", player);}
	
				marSpr2 = sMario_b_walk
				if sprite_exists(ms("sMario_b_walk", player))
				{marSpr2 = ms("sMario_b_walk", player);}
			} else {
				if global.player != "Luigi" {marioYAdd += 0.4}
				else {marioYAdd += 0.2}
				marSpr = sMario_s_jump
				if sprite_exists(ms("sMario_s_jump", player))
				{marSpr = ms("sMario_s_jump", player);}
	
				marSpr2 = sMario_b_jump
				if sprite_exists(ms("sMario_b_jump", player))
				{marSpr2 = ms("sMario_b_jump", player);}
			}
			
			var scale = 2;
			var scaleg = 2;
			if marSpr = sPeterGriffin
			|| marSpr = sDuke
			|| marSpr = sPokey
			|| marSpr = sMax_Verstappen_s_idle  {scale = 0.35;}
		
			draw_set_font(fntComicsmall);
			draw_set_halign(fa_center);
		
			var palspr = section == 7? global.p2_palettesprite : global.palettesprite;
			var palind = section == 7? global.p2_paletteindex : global.paletteindex;
			var psel = section == 7? curplayer2sel : curplayersel;
			
			shader_set(shdColorswap); 
			apply_palette(palspr,palind,1); 
			draw_sprite_ext(marSpr,smallMarioWalkDex, SCREENW/2 - 24, marioY, scale, scale, 0, c_white, 1)
			draw_sprite_ext(marSpr2,bigMarioWalkDex, SCREENW/2 + 24, marioY, scale, scale, 0, c_white, 1)
			shader_reset();
			if section == 6 
			{draw_sprite_ext(g,0,SCREENW/6,128+sin(current_time/800)*5,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1);}
			
			draw_text(SCREENW/2, 32, "creator: "+global.creatorlist[| psel])
		
			draw_set_halign(fa_left);
			marioX = lerp(marioX, SCREENW/2 - 24, .1);
		}
	}

	marioxs = lerp(marioxs,0,.2);
	marioys = lerp(marioys,0,.2);
	gunxs = lerp(gunxs,0,.2);
	gunys = lerp(gunys,0,.2);
}

function menu_credits()
{
	if section = 17 
	{
		xx = (global.aspectratio = "ORIGINAL")? 32 : 48;
		yy = 24;
		var cyy = 16;
		tsep = 32;
		var bredi_credit = "MADE THE ORIGINAL RECREATION!"
		var dawlate_credit = "MADE THE MOD, ADDING SOME COOL THINGS!"
		var marioket_credit = "MADE SOME THINGS LIKE \nSKIN MOD SUPPORT, A MENU TITLE AND MORE!"
		
		if global.aspectratio == "ORIGINAL" {
			bredi_credit = "MADE THE ORIGINAL \nRECREATION!"
			dawlate_credit = "MADE THE MOD, ADDING \nSOME COOL THINGS!"
			marioket_credit = "MADE SOME THINGS \nLIKE SKIN MOD SUPPORT, \nA MENU TITLE AND MORE!"
		}
	
		menuind += 0.1
		var box_width = sprite_get_width(sMenu_pattern);
		var box_height = sprite_get_height(sMenu_pattern);
	
		draw_sprite_ext(sMenu_pattern, menuind, SCREENW/2, SCREENH/2, (SCREENW/1.1)/box_width, (SCREENH/1.1)/box_height, 0, -1, 1)
	
		draw_set_font(global.fnt)
		draw_sprite(sIcon_breditiny, 0, xx,cyy+tsep*1)	draw_text(xx-8,cyy+tsep*2,"bredi")
		draw_text(xx*2.1,cyy+tsep*1,bredi_credit)
		draw_sprite(sIcon_dawlatetiny, 0, xx,cyy+tsep*3)	draw_text(xx-8,cyy+tsep*4,"DAWLATE")
		draw_text(xx*2.1,cyy+tsep*3,dawlate_credit)
		draw_sprite(sIcon_mariokettiny, 0, xx,cyy+tsep*5)	draw_text(xx-8,cyy+tsep*6,"MARIOKET")
		draw_text(xx*2.1,cyy+tsep*5,marioket_credit)
	}
}

function menu_draw_text()
{
	draw_set_font(global.fnt);

	var bii = 0;
	for (var i = 0; i < optionsnum[section]; i ++;)
	{
		var backapply = (resapply)? "APPLY" : menu[# section, i];
		var text = ""
	
		if i == sel && menu[# section, i] == "   PLAYER GAME" {bii = 1}
	
		if global.titleroom == rmTitle_MK {draw_set_halign(fa_center);}
	
		if menu[# section, i] = "SFX"
		{text = menu[# section, i]+" * "+string(round(global.volsfx*100))}
		else if menu[# section, i] = "BGM"
		{text = menu[# section, i]+" * "+string(round(global.volbgm*100))}
		else if menu[# section, i] = "PLYRS VISIBILITY"
		{text = menu[# section, i]+" * "+string(round(global.onlinealpha*100))}
		else if menu[# section, i] = "BACK"
		{
			if global.titleroom != rmTitle_MK 
			{draw_sprite(sBacksel,0,xx,yy+(i*tsep)); draw_text(xx+16,yy+(i*tsep),backapply)}
			else {text = backapply;}
		}
		else if menu[# section, i] = "USERNAME - "
		{
			var userlimit = (string_length(global.username) > 15)? 1-((string_length(global.username)-15)*0.025) : 1
			text = menu[# section, i]
			draw_set_font(fntComic)
			draw_text_transformed(xx+(8*11),yy+(i*tsep)-4,global.username, userlimit, 1, 0)
			draw_set_font(global.fnt)
		}
		else if menu[# section, i] = "SET IP - "
		{
			text = menu[# section, i]
			draw_set_font(fntComic)
			draw_text(xx+(8*10),yy+(i*tsep)-4,global.ip)
			draw_set_font(global.fnt)
		}
		else if menu[# section, i] = "SET PORT - "
		{
			text = menu[# section, i]
			draw_set_font(fntComic)
			draw_text(xx+(8*11),yy+(i*tsep)-4,global.port)
			draw_set_font(global.fnt)
		}
		else if menu[# section, i] = "DISCORD PFP - "
		{
			var ex = "SHOW"
			if global.showpfp = false {ex = "HIDE";}
			text = menu[# section, i] + ex;
		}
		else if menu[# section, i] = "SHOW FPS - "
		{
			var ex = "YES"
			if global.showfps = false {ex = "NO";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "LETTERBOX - "
		{
			text = menu[# section, i]+string_upper(global.letterboxes[global.letterboxSelected].name)
		}
		else if menu[# section, i] = "TITLE SCREEN - "
		{
			text = menu[# section, i]+string_upper(global.titlerooms[global.titleroom_selected].name)
		}
		else if menu[# section, i] = "SOUND MODE - "
		{
			var ex = "CLASSIC"
			if global.musicchannels = false {ex = "MODERN";}
			text = menu[# section, i] + ex;
		}
		else if menu[# section, i] = "PLAY GANGNAM - "
		{
			var ex = "YES"
			if global.opacandastar = false {ex = "NO I HATE GANGNAM STYOE!!!!!";}
			text = menu[# section, i]+ex
		}
	
		else if menu[# section, i] = "CATEGORY - "
		{text = menu[# section, i]+string_upper(category);}
		else if menu[# section, i] = "PLAYER - " and section = 6
		{text = menu[# section, i]+string_upper(global.playerName);}
		else if menu[# section, i] = "PLAYER - " and section = 7
		{text = menu[# section, i]+string_upper(global.playertwoName);}
		else if menu[# section, i] = "PALETTE - " and section = 6
		{text = menu[# section, i]+string_upper(global.paletteindex);}
		else if menu[# section, i] = "PALETTE - " and section = 7
		{text = menu[# section, i]+string_upper(global.p2_paletteindex);}
		else if menu[# section, i] = "GUN - "
		{text = menu[# section, i]+string_upper(global.gunskin);}
		else if menu[# section, i] = "MAX PLAYERS - "
		{text = menu[# section, i]+string_upper(global.maxplayers);}
		else if menu[# section, i] = "COMMAND ENEMIES - "
		{
			var ex = "YES"
			if global.moveenys = false {ex = "NO";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "COMMAND MOVABLE OBJS - "
		{
			var ex = "YES"
			if global.moveobjs = false {ex = "NO";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "COMMAND STATICS - "
		{
			var ex = "YES"
			if global.movestatics = false {ex = "NO";}
			text = menu[# section, i]+ex
		}
		else if menu[# section, i] = "PLAYERS ABILITIES - " 
			{
				var ex = "ON"
				if global.abilities = false {ex = "OFF";}
				text = menu[# section, i]+ex
			}
		else if menu[# section, i] = "SQUARE 0 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[0] = false {ex = "NOT ACTIVE";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "SQUARE 1 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[1] = false {ex = "NOT ACTIVE";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "TRIANGLE 2 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[2] = false {ex = "NOT ACTIVE";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "NOISE 3 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[3] = false {ex = "NOT ACTIVE";}
			text = menu[# section, i]+ex;
		}
		else if (section = 11 || section = 12) && menu[# section, i] != "BACK"
		{
			var gobal  = global.keyu
		
			if section = 11 {
				switch(menu[# section, i])
				{
					case "UP":		gobal=global.keyu		break;
					case "DOWN":	gobal=global.keyd		break;
					case "LEFT":    gobal=global.keyl		break;
					case "RIGHT":   gobal=global.keyr		break;
					case "ACTION":  gobal=global.keya		break;
					case "JUMP":    gobal=global.keyj		break;
					case "HOLDACT": gobal=global.keyh		break;
				}
			}
		
			if section = 12 {
				switch(menu[# section, i])
				{
					case "UP":		gobal=global.p2_keyu		break;
					case "DOWN":	gobal=global.p2_keyd		break;
					case "LEFT":    gobal=global.p2_keyl		break;
					case "RIGHT":   gobal=global.p2_keyr		break;
					case "ACTION":  gobal=global.p2_keya		break;
					case "JUMP":    gobal=global.p2_keyj		break;
					case "HOLDACT": gobal=global.p2_keyh		break;
				}
			}
		
			text = menu[# section, i];
			draw_set_font(fntComic)
			draw_text(xx+(8*11),yy+(i*tsep)-4,"( "+keycode_to_string(gobal,false)+" )");
			draw_set_font(global.fnt)
	
		}
		else if menu[# section, i] = "   PLAYER GAME"
		{
			var sx = draw_get_halign() == fa_center? xx - 64 : xx - 8;
			text = menu[# section, i];
			var pls = "1";
			if global.multiplayer {pls = "2";}
			draw_set_halign(fa_left)
			draw_text(sx + 8, yy + (i * tsep),pls);
			if global.titleroom = rmTitle_MK {draw_set_halign(fa_center);}
			draw_sprite_ext(sSetas,oGame.image_index,sx,yy+(i*tsep),1,1,0,-1,bii);
		}
		else if menu[# section, i] = "HARD MODE - "
		{
			var ex = "ENABLED"
			if global.hardmode = false {ex = "DISABLED";}
			text = menu[# section, i]+ex;
		}
		else if menu[# section, i] = "WARP ZONE - "
		{
			var ex = "ENABLED"
			if global.warpzone = false {ex = "DISABLED";}
			text = menu[# section, i]+ex;
		}
		else {text = string(menu[# section, i]);}
	
		if i == sel && menu[# section, i] != "   PLAYER GAME" {
			var mushx = global.titleroom = rmTitle_MK? xx - (string_width(text) / 2) - 16 : xx - 16
			shader_set(shdColorswap) 
				apply_palette(sPalette_gold,global.environment+1,1); 
				draw_sprite(sMushsel,oGame.image_index, mushx,yy+(i*tsep));
			shader_reset();
		}
		var charlimit = 1
		if global.aspectratio == "ORIGINAL" 
		{charlimit = (string_length(text) > 20)? 1-((string_length(text)-20)*0.025) : 1;}
		if global.aspectratio == "WIDESCREEN"
		{charlimit = (string_length(text) > 35)? 1-((string_length(text)-35)*0.025) : 1;}
		draw_text_transformed(xx,yy+(i*tsep),text,charlimit,1,0);
	}
}

function menu_settings()
{
	var p = (keyboard_check_pressed(global.keyr)-keyboard_check_pressed(global.keyl)); 
	
	if p != 0 {
		if section = 0
		{global.multiplayer = global.multiplayer? false : true;}
	
		if menu[# section, sel] = "SFX"
		{global.volsfx += 0.1*p; audio_play_sound(sndStomp,1,0,global.volsfx); savesettings()}
		else if menu[# section, sel] = "BGM"
		{global.volbgm += 0.1*p; audio_play_sound(sndStomp,1,0,global.volbgm); savesettings()}	
		else if menu[# section, sel] = "PLYRS VISIBILITY"
		{global.onlinealpha += 0.1*p; sfx(sndMenumove,0); savesettings()}
		else if p != 0 {sfx(sndMenumove,0)}
	}

	global.volbgm = clamp(global.volbgm,0,1);
	global.volsfx = clamp(global.volsfx,0,1);
	global.onlinealpha = clamp(global.onlinealpha,0,1);

	if menu[# section, sel] = "PLAYER - "
	{
		if global.titleroom == rmTitle_MK { 
			if p != 0
			{	
				marioY= 206
				marioYAdd = -7
				smallMarioWalkDex = 0
				bigMarioWalkDex = 0
			}
		} else {
			if p != 0 {marioxs = -1; marioys = 1;}
		}
		
		if section = 6 {curplayersel += p;}
		else if section = 7 {curplayer2sel += p;}
		
		if p != 0
		{
			if section = 6 {
			global.paletteindex = 1;
			update_playerpalette()
			}
			else if section = 7 {
			global.p2_paletteindex = 1;
			update_playerpalette(true)
			}
			savesettings()
		}
		//curplayersel = clamp(curplayersel,0,ds_list_size(global.charlist)-1);
	
		if curplayersel > ds_list_size(global.charlist)-1 {curplayersel = 0;}
		if curplayersel < 0 {curplayersel = ds_list_size(global.charlist)-1;}
	
		if curplayer2sel > ds_list_size(global.charlist)-1 {curplayer2sel = 0;}
		if curplayer2sel < 0 {curplayer2sel = ds_list_size(global.charlist)-1;}
	
		if section = 6 {
			global.player = global.idlist[| curplayersel]
			global.playerName = global.charlist[| curplayersel]
			
			if curplayersel < charslist {
				categorysel = 0
			}
			else if curplayersel >= charslist and curplayersel < ocslist {
				categorysel = 1
			}
			else if curplayersel >= ocslist and curplayersel < lqlist {
				categorysel = 2
			}
			else if curplayersel >= lqlist and curplayersel < hqlist {
				categorysel = 3
			}
			else if curplayersel >= hqlist and curplayersel < mods {
				categorysel = 4
			}
		} else if section = 7 {
			global.playertwo = global.idlist[| curplayer2sel]
			global.playertwoName = global.charlist[| curplayer2sel]
		
			if curplayer2sel < charslist {
				categorysel = 0
			}
			else if curplayer2sel >= charslist and curplayer2sel < ocslist {
				categorysel = 1
			}
			else if curplayer2sel >= ocslist and curplayer2sel < lqlist {
				categorysel = 2
			}
			else if curplayer2sel >= lqlist and curplayer2sel < hqlist {
				categorysel = 3
			}
			else if curplayersel >= hqlist and curplayersel < mods {
				categorysel = 4
			}
		}
	}

	if menu[# section, sel] = "PALETTE - "
	{
		if p != 0 { if global.titleroom == rmTitle_MK
		{	
			marioY=206
			marioYAdd = -4
			smallMarioWalkDex = 0
			bigMarioWalkDex = 0
		} else {
			marioxs = -1; marioys = 1;
		}	}
	
		if section = 6 {
			global.paletteindex += p;
			savesettings();
	
			if global.paletteindex > sprite_get_height(global.palettesprite)-1 {global.paletteindex = 1;}
			if global.paletteindex < 1 {global.paletteindex = sprite_get_height(global.palettesprite)-1;}
		}
		else if section = 7 {
			global.p2_paletteindex += p;
			savesettings();
	
			if global.p2_paletteindex > sprite_get_height(global.p2_palettesprite)-1 {global.p2_paletteindex = 1;}
			if global.p2_paletteindex < 1 {global.p2_paletteindex = sprite_get_height(global.p2_palettesprite)-1;}
		}
	}

	switch(categorysel) {
		case 0:
			category = "characters";
		break;
		case 1:
			category = "OCs";
		break;
		case 2:
			category = "png chars";
		break;
		case 3:
			category = "joke chars";
		break;
		default:
			category = "mods";
		break;
	}

	if menu[# section, sel] = "CATEGORY - "
	{
		categorysel += p;
	
		if p != 0
		{
			switch(categorysel) {
				case 0:
					curplayersel = 0
					curplayer2sel = 0
					break;
				case 1:
					curplayersel = charslist
					curplayer2sel = charslist
					break;
				case 2:
					curplayersel = ocslist
					curplayer2sel = ocslist
					break;
				case 3:
					curplayersel = lqlist
					curplayer2sel = lqlist
					break;
				case 4:
					curplayersel = mods
					curplayer2sel = mods
					break;
				default:
					if categorysel > 4 {categorysel = 0; curplayersel = 0; curplayer2sel = 0;}
					else if categorysel < 0 {categorysel = 4; curplayersel = mods; curplayer2sel = mods;}
				break;
			}
		}
		if section = 6 {global.player = global.idlist[| curplayersel]; global.playerName = global.charlist[| curplayersel]}
		else if section = 7 {global.playertwo = global.idlist[| curplayer2sel]; global.playertwoName = global.charlist[| curplayer2sel]}
	}

	if menu[# section, sel] = "GUN - "
	{
		if p != 0 //&& !(!(p = -1 && curplayersel > 0) && !(p = 1 && curplayersel < ds_list_size(global.charlist)-1))
		{gunxs = -1; gunys = 1;}
		curgunsel += p;
		if p != 0
		{
			savesettings()
		}
	
		if curgunsel > ds_list_size(global.gunlist)-1 {curgunsel = 0;}
		if curgunsel < 0 {curgunsel = ds_list_size(global.gunlist)-1;}
	
		global.gunskin = global.gunlist[| curgunsel]
	
	}

	if menu[# section, sel] = "LETTERBOX - "
	{
		global.letterboxSelected += p;
		if p != 0
		{
			savesettings()
		}
	
		if global.letterboxSelected > array_length(global.letterboxes) - 1
		{global.letterboxSelected = 0;}
		if global.letterboxSelected < 0
		{global.letterboxSelected = array_length(global.letterboxes) - 1;}
	
		global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr
	
	}

	if menu[# section, sel] = "TITLE SCREEN - "
	{
		global.titleroom_selected += p;
		if p != 0
		{
			savesettings()
		}
	
		if global.titleroom_selected > array_length(global.titlerooms) - 1
		{global.titleroom_selected = 0;}
		if global.titleroom_selected < 0
		{global.titleroom_selected = array_length(global.titlerooms) - 1;}
	}

	// palette
	updtplayerpalette()
	updtplayertwopalette()

	if menu[# section, sel] = "SOUND MODE - "
	{
		if p != 0
		{global.musicchannels = !global.musicchannels; savesettings()}
	}

	if menu[# section, sel] = "DISCORD PFP - "
	{
		if p != 0
		{global.showpfp = !global.showpfp; savesettings()}
	}

	if menu[# section, sel] = "SHOW FPS - "
	{
		if p != 0
		{global.showfps = !global.showfps; savesettings()}
	}
	if menu[# section, sel] = "PLAY GANGNAM - "
	{
		if p != 0
		{global.opacandastar = !global.opacandastar; savesettings()}
	}

	if menu[# section, sel] = "COMMAND ENEMIES - "
	{
		if p != 0
		{global.moveenys = !global.moveenys; savesettings()}
	}

	if menu[# section, sel] = "COMMAND MOVABLE OBJS - "
	{
		if p != 0
		{global.moveobjs = !global.moveobjs; savesettings()}
	}

	if menu[# section, sel] = "COMMAND STATICS - "
	{
		if p != 0
		{global.movestatics = !global.movestatics; savesettings()}
	}

	if menu[# section, sel] = "PLAYERS ABILITIES - "
	{
		if p != 0
		{global.abilities = !global.abilities; savesettings()}
	}

	if menu[# section, sel] = "SQUARE 0 - "
	{
		if p != 0
		{global.ch_allowed[0] = !global.ch_allowed[0]; savesettings()}
	}

	if menu[# section, sel] = "SQUARE 1 - "
	{
		if p != 0
		{global.ch_allowed[1] = !global.ch_allowed[1]; savesettings()}
	}

	if menu[# section, sel] = "TRIANGLE 2 - "
	{
		if p != 0
		{global.ch_allowed[2] = !global.ch_allowed[2]; savesettings()}
	}

	if menu[# section, sel] = "NOISE 3 - "
	{
		if p != 0
		{global.ch_allowed[3] = !global.ch_allowed[3]; savesettings()}
	}

	if menu[# section, sel] = "HARD MODE - "
	{
		if p != 0
		{global.hardmode = !global.hardmode; savesettings()}
	}
	
	if menu[# section, sel] = "WARP ZONE - "
	{
		if p != 0
		{global.warpzone = !global.warpzone; savesettings()}
	}
}