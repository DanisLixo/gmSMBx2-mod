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

	var xx = 88-cx;
	var yy = 136-cy;
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
	
	xx = (global.aspectratio = "ORIGINAL")? 48 : 64;
	yy = 64;
	tsep = 16;


	if section = 3
	{
		var p = sMario_s_idle
		if sprite_exists(ms("sMario_s_idle"))
		{p = ms("sMario_s_idle");}
		var g = sGun_Default
		if sprite_exists(gs("sGun_Default"))
		{g = gs("sGun_Default");}
	
		//draw_set_font(FNT);
		//draw_text(xx-cx/2,yy-16,"CATEGORY - " + string_upper(category))
	
		var scale = 4;
		var scaleg = 2;
		if p = sPeterGriffin
		or p = sDuke
		or p = sPokey
		or p = sMax_Verstappen_s_idle {scale = 0.5;}
	
		var sp = (global.aspectratio = "ORIGINAL")? 48 : 64;
	
		shader_set(shdColorswap)
			apply_palette(global.palettesprite,global.paletteindex,1)
			draw_sprite_ext(p,0,SCREENW/2+sp,160+32+sin(current_time/800)*5,scale+(marioxs*(scale/4)),scale+(marioys*(scale/4)),0,-1,1)
	
		shader_reset();
	
		draw_set_font(fntComicsmall)
		draw_set_halign(fa_center);
		draw_text(SCREENW/2+sp,160+32+10,"creator: "+creatorlist[| curplayersel])
		draw_set_halign(fa_left);
		
		if sel = 3 {draw_sprite_ext(g,0,SCREENW/2+sp+32,160+32+sin(current_time/800)*5-8-16,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1)}

	}

	marioxs = lerp(marioxs,0,.2);
	marioys = lerp(marioys,0,.2);
	gunxs = lerp(gunxs,0,.2);
	gunys = lerp(gunys,0,.2);

	draw_set_font(FNT);

	var categorylimit = (string_length(category) > 11)? 1-((string_length(category)-11)*0.05) : 1
	var charlimit = (string_length(global.player) > 13)? 1-((string_length(global.player)-13)*0.05) : 1


	for (var i = 0; i < optionsnum[section]; i ++;)
	{
		if i = sel	{
		shader_set(shdColorswap);
			apply_palette(sPalette_gold,global.environment,image_alpha)
			draw_sprite(sMushsel,oGame.image_index,xx-16,yy+(i*tsep));
		shader_reset();
		}
	
		#region different buttons to draw
		
		if menu[# section, i] = "SFX"
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+" * "+string(round(global.volsfx*100)))}
		else if menu[# section, i] = "BGM"
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+" * "+string(round(global.volbgm*100)))}
		else if menu[# section, i] = "BACK"
		{draw_sprite(sBacksel,0,xx,yy+(i*tsep)); draw_text(xx+16,yy+(i*tsep),menu[# section, i])}
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
	
		else if menu[# section, i] = "CATEGORY - "
		{draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+string_upper(category), categorylimit, 1, 0);}
		else if menu[# section, i] = "PLAYER - "
		{draw_text_transformed(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.player), charlimit, 1, 0);}
		else if menu[# section, i] = "PALETTE - "
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.paletteindex));}
		else if menu[# section, i] = "GUN - "
		{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.gunskin));}
		else if section = 8 && menu[# section, i] != "BACK"
		{
			var gobal  = global.keyu
		
			switch(menu[# section, i])
			{
				case "DOWN":	gobal=global.keyd		break;
				case "LEFT":    gobal=global.keyl		break;
				case "RIGHT":   gobal=global.keyr		break;
				case "ACTION":  gobal=global.keya		break;
				case "JUMP":    gobal=global.keyj		break;
				case "HOLDACT": gobal=global.keyh		break;
			}
		
			draw_text(xx,yy+(i*tsep),menu[# section, i]);
			draw_set_font(fntComic)
			draw_text(xx+(8*11),yy+(i*tsep)-4,"( "+keycode_to_string(gobal,false)+" )")
			draw_set_font(FNT)
	
		}
	
		else
		{draw_text(xx,yy+(i*tsep),menu[# section, i]);}
		
		if menu[# section, i] = "CUSTOMIZE" and instance_exists(oClient)
		{draw_text_color(xx,yy+(i*tsep),menu[# section, i],c_gray,c_gray,c_gray,c_gray,0.6)}
	
	
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
	if menu[# section, sel] = "SFX"
	{global.volsfx += 0.1*p; if p != 0 {global.volsfx = clamp(global.volsfx,0,1); sfx(sndStomp,0); savesettings()}}
	if menu[# section, sel] = "BGM"
	{global.volbgm += 0.1*p; if p != 0 { global.volbgm = clamp(global.volbgm,0,1); audio_play_sound(sndStomp,1,0,global.volbgm); savesettings()}}

	global.volbgm = clamp(global.volbgm,0,1);
	global.volsfx = clamp(global.volsfx,0,1);

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
					break;
				case 1:
					curplayersel = charslist
					break;
				case 2:
					curplayersel = ocslist
					break;
				case 3:
					curplayersel = lqlist
					break;
				default:
					if categorysel > 3 {categorysel = 0; curplayersel = 0;}
					else if categorysel < 0 {categorysel = 3; curplayersel = lqlist}
					break;
			}
		}

	

		global.player = playerlist[| curplayersel]
	}

	if menu[# section, sel] = "PLAYER - "
	{
		if p != 0 //&& !(!(p = -1 && curplayersel > 0) && !(p = 1 && curplayersel < ds_list_size(playerlist)-1))
		{marioxs = -1; marioys = 1;}
		curplayersel += p;
		if p != 0
		{
			global.paletteindex = 0;
			updtplayerpalette()
			savesettings()
		}
		//curplayersel = clamp(curplayersel,0,ds_list_size(playerlist)-1);
	
		if curplayersel > ds_list_size(playerlist)-1 {curplayersel = 0;}
		if curplayersel < 0 {curplayersel = ds_list_size(playerlist)-1;}
	
		global.player = playerlist[| curplayersel]
	
	
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
		
	}

	if menu[# section, sel] = "PALETTE - "
	{
		if p != 0 //&& !(!(p = -1 && global.paletteindex > 1) && !(p = 1 && global.paletteindex < sprite_get_height(global.palettesprite)-1))
		{marioxs = -1; marioys = 1;}
	
		global.paletteindex += p;
		savesettings()
	
		if global.paletteindex > sprite_get_height(global.palettesprite) {global.paletteindex = 0;}
		if global.paletteindex < 0 {global.paletteindex = sprite_get_height(global.palettesprite)-1;}
	
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
	global.paletteindex = clamp(global.paletteindex,1,sprite_get_height(global.palettesprite)-1);



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
		
		if horse > 2 {horse = 0}
		else if horse < 0 {horse = 2}
		
		switch horse {
			case 0:
				global.aspectratio = "WIDESCREEN"
				SCREENW = SCREENW_WS
				SCREENH = SCREENH_OG
				savesettings();
			
				camera_set_view_size(view_camera[0], SCREENW, SCREENH)
				surface_resize(application_surface,SCREENW,SCREENH)
				var scrsizemult = 3;
				window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
			break;
			case 1:
				global.aspectratio = "ORIGINAL"
				SCREENW = SCREENW_OG
				SCREENH = SCREENH_OG
				savesettings();
			
				camera_set_view_size(view_camera[0], SCREENW, SCREENH)
				surface_resize(application_surface,SCREENW,SCREENH)
				var scrsizemult = 3;
				window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
			break;
			case 2:
				global.aspectratio = "ULTRA WIDE"
				SCREENW = SCREENW_UW
				SCREENH = SCREENH_UW
				savesettings();
			
				camera_set_view_size(view_camera[0], SCREENW, SCREENH)
				surface_resize(application_surface,SCREENW,SCREENH)
				var scrsizemult = 3;
				window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
			break;
		}
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

	#endregion

	if (keyboard_check_pressed(global.keyj) or keyboard_check_pressed(vk_enter)) and oGame.delay >= 10
	{
		switch(menu[# section, sel])
		{
			case "BACK":
				if section = 4			{section = 1; sel = 0;}
				else if section = 5		{section = 1; sel = 1;}
				else if section = 3		{section = 2; sel = 0;}
				else if section = 6		{section = 2; sel = 2;}
				else if section = 2		{settingsmenu = false}
				else if section = 7		{section = 2; sel = 1;}
				else if section = 8		{section = 2; sel = 3;}
				else if section = 9		{section = 2; sel = 4;}
				else					{section = 0; sel = 0;}
		
				sfx(sndBump,0);
			break;
			case "CUSTOMIZE":
				if !instance_exists(oClient) {
					section = 3;
					sel = 0;
				}
				sfx(sndStomp,0);
			break;
			case "AUDIO":
				section = 6;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "VIDEO":
				section = 7;
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
			case "SHOW FPS - ":
				global.showfps = !global.showfps;
				savesettings()
			break;
			case "CONTROLS":
				section = 8;
				sel = 0;
				sfx(sndStomp,0);
			break;
			case "UP":
				setcontrol("keyu")
			break
			case "DOWN":
				setcontrol("keyd")
			break
			case "LEFT":
				setcontrol("keyl")
			break
			case "RIGHT":
				setcontrol("keyr")
			break
			case "ACTION":
				setcontrol("keya")
			break
			case "JUMP":
				setcontrol("keyj")
			break
			case "HOLDACT":
				setcontrol("keyh")
			break
			case "MOD SETTINGS":
				section = 9;
				sel = 0;
				sfx(sndStomp,0);
			break;
		}
	}
}
else {sel = 0;}

#endregion
