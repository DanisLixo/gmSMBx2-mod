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


draw_set_alpha(0.9);
draw_set_color(c_black);
	draw_rectangle(0,0,SCREENW,SCREENH,false);
draw_set_color(-1);
draw_set_alpha(1); 
	
image_xscale = SCREENW/20;
var yscale_togo = SCREENH/40;
shader_set(shdColorswap);
	apply_palette(sPalette_tilebrown,global.environment,image_alpha)
	draw_sprite_ext(sThetextgavemeideas, 0, SCREENW/2, SCREENH/2, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();

if image_yscale < yscale_togo {image_yscale += 1;}

if image_yscale >= yscale_togo {
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sMushsel,oGame.image_index,(SCREENW/3)+4+(tile*-2)+cx,(tile*10)+((tile*2)*psel)+tile+cy)
	shader_reset();
	
	draw_set_font(global.fnt);
	for (var i = 0; i < array_length(options); i++) {
		var i_plus_one = i+1
		var roomnt = asset_get_index("rm"+string(global.world)+"_"+string(global.level));
		draw_text(SCREENW/3,(tile*9)+tile*(2*i_plus_one), options[i])
		
		if options[i] = "RESTART" and (!room_exists(roomnt) || global.sync) and global.extra = false
		{draw_text_color(SCREENW/3,(tile*9)+tile*(2*i_plus_one),options[i],c_yellow,c_yellow,c_yellow,c_yellow,0.6)}
	}
}
			
#endregion

#region //settings

if settingsmenu {
	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])

	xx = 88-cx;
	yy = 136-cy;
	tsep = 16;

	if global.titleroom = rmTitle_MK 
	{
		xx = SCREENW / 2;
		yy = y + 136-cy;
		tsep = 16;
		x = xx;
	}
	
	buttonsappear++
	
	if section != 17
	{
		menu_background();
	
		if global.titleroom != rmTitle_MK 
		{xx = (global.aspectratio = "ORIGINAL")? 48 : 64;}
	
		yy = 64;
		tsep = 16;
	}
	
	menu_customize_gui();
	menu_draw_text();
	menu_controls_custom();
	menu_settings();
	
	#region selection

	if keyboard_check_pressed(global.keyu) && sel > 0
	{sel -= 1; sfx(sndMenumove,0);}
	if keyboard_check_pressed(global.keyd) && sel < optionsnum[section]-1
	{sel += 1; sfx(sndMenumove,0);}

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
				else if section = 16	{section = 8; sel = 5; savesettings();}
				else					{section = 0; sel = 0;}
				sfx(sndMenuback,0)
			break;
			case "CUSTOMIZE":
				if !instance_exists(oClient)
				{
					if global.multiplayer {section = 5;}
					else {section = 6;}
				}
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
				sfx(sndMenuselect,0)
			break;
			case "VIDEO":
				section = 8;
				sel = 0;
				sfx(sndMenuselect,0)
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
			case "LETTERBOX - ":
				global.letterboxSelected++
				if global.letterboxSelected > array_length(global.letterboxes) - 1
				{global.letterboxSelected = 0;}
				global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr
				savesettings()
				sfx(sndMenuselect,0);
			break;
			case "TOGGLE LETTERBOX DARKEN":
				global.letterboxDark = !global.letterboxDark
				savesettings()
				sfx(sndMenuselect,0);
			break;
			case "RESOLUTION":
				section = 16;
				sel = 0;
				sfx(sndMenuselect,0)
			break;
			case "SOUND MODE - ":
				global.musicchannels = !global.musicchannels;
				savesettings()
			break;
			case "PLAY GANGNAM - ":
				global.opacandastar = !global.opacandastar;
				savesettings()
			break;
			case "CONTROLS":
				if global.multiplayer {section = 10;}
				else {section = 11;}
				sel = 0;
				sfx(sndMenuselect,0)
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
				sfx(sndMenuselect,0)
			break;
			case "COMMANDER SETTINGS":
				section = 14;
				sel = 0;
				sfx(sndMenuselect,0)
			break;
			case "CLASSIC AUDIO MODIFIER":
				section = 15;
				sel = 0;
				sfx(sndMenuselect,0)
			break;
			case "PLAYER 1":
				if section = 5 {section = 6;}
				if section = 10 {section = 11;}
				sel = 0;
				sfx(sndMenuselect,0)
			break;
			case "PLAYER 2":
				if section = 5 {section = 7;}
				if section = 10 {section = 12;}
				sel = 0;
				sfx(sndMenuselect,0)
			break;
			default:
				if menu[# section, sel] != "BACK" and section = 16
				{global.aspectratio = menu[# section, sel];}
			
				switch (global.aspectratio) {
					case "ORIGINAL": SCREENW = SCREENW_OG; SCREENH = SCREENH_OG; break;
					case "WIDESCREEN": SCREENW = SCREENW_WS; SCREENH = SCREENH_OG; break;
					case "ULTRA WIDE": SCREENW = SCREENW_UW; SCREENH = SCREENH_UW; break;
					case "ROOM WIDTH": SCREENW = room_width; SCREENH = SCREENH_UW; break;
					case "LINE": SCREENW = 32; SCREENH = SCREENH_UW; break;
				}
				
				loadsettings();
				resize_screen();
				sfx(sndMenuselect,0)
			break;
		}
	}
}
else {sel = 0;}

#endregion
