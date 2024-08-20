//draw_text(SCREENW / 2, 32, "PAUSED")
//draw_set_halign(fa_left)

var cx = 0; 
var cy = 0;
var tile = 8;

if pitch > 1 {pitched = true;}
if oGame.delay < 10 {oGame.delay++}
pitch = 1
		
if !instance_exists(oClient) 
{	
	audio_pause_sound(global.ch[0]);
	audio_pause_sound(global.ch[1]);
	audio_pause_sound(global.ch[2]);
	audio_pause_sound(global.ch[3]);
	audio_pause_sound(global.ch[4]);
	
}

#region //animation

var xscale_togo = SCREENW/20;
var yscale_togo = SCREENH/40;
shader_set(shdColorswap);
	apply_palette(sPalette_tilebrown,global.environment,image_alpha)
	draw_sprite_ext(sThetextgavemeideas, 0, SCREENW/2, SCREENH/2, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();

if image_xscale < xscale_togo {image_xscale += 1;}
if image_yscale < yscale_togo {image_yscale += 1;}

if image_yscale >= yscale_togo {
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sMushsel,oGame.image_index,(SCREENW/3)+4+(tile*-2)+cx,(tile*10)+((tile*2)*psel)+tile+cy)
	shader_reset();
	
	draw_set_font(FNT);
	for (var i = 0; i < array_length(options); i++) {
		var i_plus_one = i+1
		var roomnt = asset_get_index("rm"+string(global.world)+"_"+string(global.level));
		draw_text(SCREENW/3,(tile*9)+tile*(2*i_plus_one), options[i])
		
		if options[i] = "RESTART" and (!room_exists(roomnt) || global.sync) and global.extra = false
		{draw_text_color(SCREENW/3,(tile*9)+tile*(2*i_plus_one),options[i],c_gray,c_gray,c_gray,c_gray,0.6)}
	}
}
			
#endregion

#region //settings

if settingsmenu {

	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	
	var xx = (global.aspectratio = "ORIGINAL")? 48 : 64;
	var yy = 64;
	var tsep = 16;

	/*draw_set_alpha(0.9);
	draw_set_color(c_black);
	draw_rectangle(0,0,SCREENW,SCREENH,false);
	draw_set_color(-1);
	draw_set_alpha(1); */
	shader_set(shdColorswap);
		apply_palette(sPalette_tilebrown,global.environment,image_alpha)
		draw_sprite_ext(sThetextgavemeideas, 0, SCREENW/2, SCREENH/2, SCREENW/20, SCREENH/20,0, c_white, 1)
	shader_reset();
	
	buttonsappear++

	if section = 6 || section = 7
	{
		var p = sMario_s_idle
		if sprite_exists(ms("sMario_s_idle"))
		{p = ms("sMario_s_idle");}
		var g = sGun_Default
		if sprite_exists(gs("sGun_Default"))
		{g = gs("sGun_Default");}
		if section = 7 {
			if sprite_exists(ls("sMario_s_idle"))
			{p = ls("sMario_s_idle");}
		}
	
		//draw_set_font(FNT);
		//draw_text(xx-cx/2,yy-16,"CATEGORY - " + string_upper(category))
	
		var scale = 4;
		var scaleg = 2;
		if p = sPeterGriffin
		or p = sDuke
		or p = sPokey
		or p = sMax_Verstappen_s_idle {scale = 0.5;}
	
		var sp = (global.aspectratio = "ORIGINAL")? 48 : 64;
	
		shader_set(shdColorswap); 
		if section = 6
		{
			apply_palette(global.palettesprite,global.paletteindex,1); 
		}
		else if section = 7 
		{
			apply_palette(global.p2_palettesprite,global.p2_paletteindex,1); 
		}
			draw_sprite_ext(p,0,SCREENW/2+sp,160+32+sin(current_time/800)*5-8,scale+(marioxs*(scale/4)),scale+(marioys*(scale/4)),0,-1,1)
		shader_reset();
	
		draw_set_font(fntComicsmall)
		draw_set_halign(fa_center);
		if section = 6 
		{draw_text(SCREENW/2+sp,160+32+10-8,"creator: "+creatorlist[| curplayersel])}
		if section = 7 
		{draw_text(SCREENW/2+sp,160+32+10-8,"creator: "+creatorlist[| curplayer2sel])}
		draw_set_halign(fa_left);
	
		if sel = 3 and section = 6 
		{draw_sprite_ext(g,0,SCREENW/2+sp+32,160+32+sin(current_time/800)*5-8-16,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1)}
	}

	marioxs = lerp(marioxs,0,.2);
	marioys = lerp(marioys,0,.2);
	gunxs = lerp(gunxs,0,.2);
	gunys = lerp(gunys,0,.2);

	draw_set_font(FNT);

	var categorylimit = (string_length(category) > 11)? 1-((string_length(category)-11)*0.05) : 1
	var charlimit = (string_length(global.player) > 13)? 1-((string_length(playerlist[| curplayersel])-13)*0.05) : 1
	if section = 7 {charlimit = (string_length(global.playertwo) > 13)? 1-((string_length(playerlist[| curplayer2sel])-13)*0.05) : 1}
	var bii = 0;

	for (var i = 0; i < optionsnum[section]; i ++;)
	{
		if i = sel	{
			shader_set(shdColorswap) 
				apply_palette(sPalette_gold,global.environment+1,1); 
				draw_sprite(sMushsel,oGame.image_index,xx-16,yy+(i*tsep));
			shader_reset();
		}
	
		#region different buttons to draw

		if menu[# section, i] = "SFX"
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+" * "+string(round(global.volsfx*100)))}
		else if menu[# section, i] = "BGM"
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+" * "+string(round(global.volbgm*100)))}
		else if menu[# section, i] = "DISCORD PFP - "
		{
			var ex = "SHOW"
			if global.showpfp = false {ex = "HIDE";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)
		}
		else if menu[# section, i] = "SHOW FPS - "
		{
			var ex = "YES"
			if global.showfps = false {ex = "NO";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)
		}
		else if menu[# section, i] = "RESOLUTION - "
		{
			draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.aspectratio))
		}
		else if menu[# section, i] = "SOUND MODE - "
		{
			var ex = "CLASSIC"
			if global.musicchannels = false {ex = "MODERN";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)
		}
		else if menu[# section, i] = "PLAY GANGNAM - "
		{
			var ex = "YES"
			var opa = (global.opacandastar)? 1 : 0.5
			if !global.opacandastar {opa = (global.aspectratio = "ORIGINAL")? 0.5 : 0.9}
			if global.opacandastar = false {ex = "NO I HATE GANGNAM STYOE!!!!!";}
			draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+ex, opa, 1, 0)
		}
		else if menu[# section, i] = "CUSTOMIZE" and instance_exists(oClient)
		{
			draw_set_color(c_gray)
			draw_text(xx,yy+(i*tsep),menu[# section, i])
			draw_set_color(-1)
		}
		else if menu[# section, i] = "CATEGORY - "
		{draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+string_upper(category), categorylimit, 1, 0);}
		else if menu[# section, i] = "PLAYER - " and section = 6
		{draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+string_upper(playerlist[| curplayersel]), charlimit, 1, 0);}
		else if menu[# section, i] = "PLAYER - " and section = 7
		{draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+string_upper(playerlist[| curplayer2sel]), charlimit, 1, 0);}
		else if menu[# section, i] = "PALETTE - " and section = 6
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.paletteindex));}
		else if menu[# section, i] = "PALETTE - " and section = 7
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.p2_paletteindex));}
		else if menu[# section, i] = "GUN - "
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.gunskin));}
		else if menu[# section, i] = "MAX PLAYERS - "
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.maxplayers));}
		else if menu[# section, i] = "COMMAND ENEMIES - "
		{
			var ex = "YES"
			if global.moveenys = false {ex = "NO";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)}
		else if menu[# section, i] = "COMMAND MOVABLE OBJS - "
		{
			var ex = "YES"
			if global.moveobjs = false {ex = "NO";}
			draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+ex, transtext, 1, 0)}
		else if menu[# section, i] = "COMMAND STATICS - "
		{
			var ex = "YES"
			if global.movestatics = false {ex = "NO";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)}
		else if menu[# section, i] = "SQUARE 0 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[0] = false {ex = "NOT ACTIVE";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)}
		else if menu[# section, i] = "SQUARE 1 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[1] = false {ex = "NOT ACTIVE";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)}
		else if menu[# section, i] = "TRIANGLE 2 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[2] = false {ex = "NOT ACTIVE";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)}
		else if menu[# section, i] = "NOISE 3 - "
		{
			var ex = "ACTIVE"
			if global.ch_allowed[3] = false {ex = "NOT ACTIVE";}
			draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)}
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
		
			draw_text(xx,yy+(i*tsep),menu[# section, i]);
			draw_set_font(fntComic)
			draw_text(xx+(8*11),yy+(i*tsep)-4,"( "+keycode_to_string(gobal,false)+" )")
			draw_set_font(FNT)
	
		}
		else if menu[# section, i] = "START GAME"
		{
			draw_text(xx,yy+(i*tsep),menu[# section, i]);
			draw_sprite_ext(sSetas,oGame.image_index,xx-34,yy+(i*tsep),1,1,0,-1,bii);
			var pls = "1P";
			if global.multiplayer {pls = "2P";}
			draw_text(xx-26,yy+(i*tsep),pls);
		}
		else
		{draw_text(xx,yy+(i*tsep),menu[# section, i]);}
	
		#endregion
	}

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


	#region selection

	if keyboard_check_pressed(global.keyu) && sel > 0
	{sel -= 1;}
	if keyboard_check_pressed(global.keyd) && sel < optionsnum[section]-1
	{sel += 1;}

	//if keyboard_check_pressed(global.keya)
	//{section = 0;	sfx(sndBump,0);}



	var p = (keyboard_check_pressed(global.keyr)-keyboard_check_pressed(global.keyl)); 
	if section = 0 and p != 0
	{global.multiplayer = global.multiplayer? false : true;}
	if menu[# section, sel] = "SFX"
	{global.volsfx += 0.1*p; if p != 0 {global.volsfx = clamp(global.volsfx,0,1); sfx(sndStomp,0); savesettings()}}
	if menu[# section, sel] = "BGM"
	{global.volbgm += 0.1*p; if p != 0 { global.volbgm = clamp(global.volbgm,0,1); audio_play_sound(sndStomp,1,0,global.volbgm); savesettings()}}
	if menu[# section, sel] = "PLYRS VISIBILITY"
	{global.onlinealpha += 0.1*p; if p != 0 {global.onlinealpha = clamp(global.onlinealpha,0,1); sfx(sndStomp,0); savesettings()}}

	global.volbgm = clamp(global.volbgm,0,1);
	global.volsfx = clamp(global.volsfx,0,1);
	global.onlinealpha = clamp(global.onlinealpha,0,1);

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
				default:
					if categorysel > 3 {categorysel = 0; curplayersel = 0; curplayer2sel = 0;}
					else if categorysel < 0 {categorysel = 3; curplayersel = lqlist; curplayer2sel = lqlist;}
					break;
			}
		}

	
		if section = 6 {global.player = playerlist[| curplayersel]}
		else if section = 7 {global.playertwo = playerlist[| curplayer2sel]}
	}

	if menu[# section, sel] = "PLAYER - "
	{
		if p != 0 //&& !(!(p = -1 && curplayersel > 0) && !(p = 1 && curplayersel < ds_list_size(playerlist)-1))
		{marioxs = -1; marioys = 1;}
		if section = 6 curplayersel += p;
		else if section = 7 {curplayer2sel += p;}
		if p != 0
		{
			if section = 6 {
			global.paletteindex = 1;
			updtplayerpalette()
			}
			else if section = 7 {
			global.p2_paletteindex = 1;
			updtplayertwopalette()
			}
			savesettings()
		}
		//curplayersel = clamp(curplayersel,0,ds_list_size(playerlist)-1);
	
		if curplayersel > ds_list_size(playerlist)-1 {curplayersel = 0;}
		if curplayersel < 0 {curplayersel = ds_list_size(playerlist)-1;}
	
		if curplayer2sel > ds_list_size(playerlist)-1 {curplayer2sel = 0;}
		if curplayer2sel < 0 {curplayer2sel = ds_list_size(playerlist)-1;}
	
		if section = 6 {global.player = playerlist[| curplayersel]}
		else if section = 7 {global.playertwo = playerlist[| curplayer2sel]}
	
	
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
		
	}

	if menu[# section, sel] = "PALETTE - "
	{
		if p != 0 //&& !(!(p = -1 && global.paletteindex > 1) && !(p = 1 && global.paletteindex < sprite_get_height(global.palettesprite)-1))
		{marioxs = -1; marioys = 1;}
	
		if section = 6 {
			global.paletteindex += p;
			savesettings();
	
			if global.paletteindex > sprite_get_height(global.palettesprite) {global.paletteindex = 1;}
			if global.paletteindex < 1 {global.paletteindex = sprite_get_height(global.palettesprite)-1;}
		}
		else if section = 7 {
			global.p2_paletteindex += p;
			savesettings();
	
			if global.p2_paletteindex > sprite_get_height(global.p2_palettesprite) {global.p2_paletteindex = 1;}
			if global.p2_paletteindex < 1 {global.p2_paletteindex = sprite_get_height(global.p2_palettesprite)-1;}
		}
	
	}

	if menu[# section, sel] = "GUN - "
	{
		if p != 0 //&& !(!(p = -1 && curplayersel > 0) && !(p = 1 && curplayersel < ds_list_size(playerlist)-1))
		{gunxs = -1; gunys = 1;}
		curgunsel += p;
		if p != 0
		{
			savesettings()
		}
	
		if curgunsel > ds_list_size(gunlist)-1 {curgunsel = 0;}
		if curgunsel < 0 {curgunsel = ds_list_size(gunlist)-1;}
	
		global.gunskin = gunlist[| curgunsel]
	
	}

	// palette
	updtplayerpalette()
	updtplayertwopalette()
	global.paletteindex = clamp(global.paletteindex,1,sprite_get_height(global.palettesprite)-1);
	global.p2_paletteindex = clamp(global.p2_paletteindex,1,sprite_get_height(global.p2_palettesprite)-1);



	if menu[# section, sel] = "SOUND MODE - "
	{
		if p = -1
		{global.musicchannels = true; savesettings()}
		else if p = 1
		{global.musicchannels = false; savesettings()}
	}

	if menu[# section, sel] = "DISCORD PFP - "
	{
		if p = -1
		{global.showpfp = true; savesettings()}
		else if p = 1
		{global.showpfp = false; savesettings()}
	}

	if menu[# section, sel] = "SHOW FPS - "
	{
		if p = -1
		{global.showfps = true; savesettings()}
		else if p = 1
		{global.showfps = false; savesettings()}
	}

	if menu[# section, sel] = "RESOLUTION - "
	{
		horse += p;
	
		if horse > 4 {horse = 0}
		else if horse < 0 {horse = 4}
		switch horse {
			case 0:
				global.aspectratio = "WIDESCREEN"
				SCREENW = SCREENW_WS
				SCREENH = SCREENH_OG
				savesettings();
			break;
			case 1:
				global.aspectratio = "ORIGINAL"
				SCREENW = SCREENW_OG
				SCREENH = SCREENH_OG
				savesettings();
			break;
			case 2:
				global.aspectratio = "ULTRA WIDE"
				SCREENW = SCREENW_UW
				SCREENH = SCREENH_UW
				savesettings();
			break;
			case 3:
				global.aspectratio = "ROOM WIDTH"
				SCREENW = room_width
				SCREENH = SCREENH_OG
				savesettings();
			break;
			case 4:
				global.aspectratio = "LINE";
				SCREENW = 16;
				SCREENH = display_get_height()/4.5;
			break;
		}
		screenResize();
	}

	if menu[# section, sel] = "PLAY GANGNAM - "
	{
		if p = -1
		{global.opacandastar = true; savesettings()}
		else if p = 1
		{global.opacandastar = false; savesettings()}
	}

	if menu[# section, sel] = "COMMAND ENEMIES - "
	{
		if p = -1
		{global.moveenys = true; savesettings()}
		else if p = 1
		{global.moveenys = false; savesettings()}
	}

	if menu[# section, sel] = "COMMAND MOVABLE OBJS - "
	{
		if p = -1
		{global.moveobjs = true; savesettings()}
		else if p = 1
		{global.moveobjs = false; savesettings()}
	}

	if menu[# section, sel] = "COMMAND STATICS - "
	{
		if p = -1
		{global.movestatics = true; savesettings()}
		else if p = 1
		{global.movestatics = false; savesettings()}
	}

	if menu[# section, sel] = "PLAYERS ABILITIES - "
	{
		if p = -1
		{global.abilities = true; savesettings()}
		else if p = 1
		{global.abilities = false; savesettings()}
	}

	if menu[# section, sel] = "SQUARE 0 - "
	{
		if p = -1
		{global.ch_allowed[0] = true; savesettings()}
		else if p = 1
		{global.ch_allowed[0] = false; savesettings()}
	}

	if menu[# section, sel] = "SQUARE 1 - "
	{
		if p = -1
		{global.ch_allowed[1] = true; savesettings()}
		else if p = 1
		{global.ch_allowed[1] = false; savesettings()}
	}

	if menu[# section, sel] = "TRIANGLE 2 - "
	{
		if p = -1
		{global.ch_allowed[2] = true; savesettings()}
		else if p = 1
		{global.ch_allowed[2] = false; savesettings()}
	}

	if menu[# section, sel] = "NOISE 3 - "
	{
		if p = -1
		{global.ch_allowed[3] = true; savesettings()}
		else if p = 1
		{global.ch_allowed[3] = false; savesettings()}
	}

	#endregion

	if (keyboard_check_pressed(global.keyj) or keyboard_check_pressed(vk_enter)) && oGame.delay >= 10 
	{
		switch(menu[# section, sel])
		{
			case "BACK":
				if section = 2		{settingsmenu = false;}
				else if section = 5		{section = 2; sel = 0;}
				else if section = 6		{if global.multiplayer {section = 5;} else {section = 2} sel = 0;}
				else if section = 7		{section = 5; sel = 1;}
				else if section = 8		{section = 2; sel = 1;}
				else if section = 9		{section = 2; sel = 2;}
				else if section = 10	{section = 2; sel = 3;}
				else if section = 11	{if global.multiplayer {section = 10; sel = 0;} else {section = 2; sel = 3;}}
				else if section = 12	{section = 10; sel = 1;}
				else if section = 13	{section = 2; sel = 4;}
				else if section = 14	{section = 13; sel = 0;}
				else if section = 15	{section = 13; sel = 1;}
				else					{section = 0; sel = 0;}
				sfx(sndBump,0);
			break;
			case "CUSTOMIZE":
				if global.multiplayer {section = 5;}
				else {section = 6;}
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "PLAYERS ABILITIES - ":
				global.abilities = !global.abilities;
				savesettings()
			break;
			case "AUDIO":
				section = 9;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "SHOW FPS - ":
				global.showfps = !global.showfps;
				savesettings()
			break;
			case "VIDEO":
				section = 8;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "TOGGLE FULLSCREEN":
				window_set_fullscreen(!window_get_fullscreen())
			break;
			case "RESET WINDOW":
				window_set_fullscreen(false)
		
				var scrsizemult = 3;
				window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
				window_center()
			break;
			case "DISCORD PFP - ":
				global.showpfp = !global.showpfp;
				savesettings()
			break;
			case "SOUND MODE - ":
				global.musicchannels = !global.musicchannels;
				savesettings()
			break;
			case "PLAY GANGNAM - ":
				global.opacandastar = !global.opacandastar;
				savesettings()
			break;
			case "RESOLUTION - ":
				horse++;
				savesettings()
			break;
			case "CONTROLS":
				if global.multiplayer {section = 10;}
				else {section = 11;}
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "UP":
			if section = 11 {setcontrol("keyu")}
			if section = 12 {setcontrol("p2_keyu")}
			break
			case "DOWN":
				if section = 11 {setcontrol("keyd")}
				if section = 12 {setcontrol("p2_keyd")}
			break
			case "LEFT":
				if section = 11 {setcontrol("keyl")}
				if section = 12 {setcontrol("p2_keyl")}
			break
			case "RIGHT":
				if section = 11 {setcontrol("keyr")}
				if section = 12 {setcontrol("p2_keyr")}
			break
			case "ACTION":
				if section = 11 {setcontrol("keya")}
				if section = 12 {setcontrol("p2_keya")}
			break
			case "JUMP":
				if section = 11 {setcontrol("keyj")}
				if section = 12 {setcontrol("p2_keyj")}
			break
			case "HOLDACT":
				if section = 11 {setcontrol("keyh")}
				if section = 12 {setcontrol("p2_keyh")}
			break
			case "OTHER":
				section = 13;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "COMMANDER SETTINGS":
				section = 14;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "CLASSIC AUDIO MODIFIER":
				section = 15;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "PLAYER 1":
				if section = 5 {section = 6;}
				if section = 10 {section = 11;}
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "PLAYER 2":
				if section = 5 {section = 7;}
				if section = 10 {section = 12;}
				sel = 0;
				sfx(sndStomp,0);
			break;
		}
	}
}
else {sel = 0;}

#endregion
