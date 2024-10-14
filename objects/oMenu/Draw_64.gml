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

draw_set_halign(fa_right)
draw_set_font(global.fnt)
draw_text(SCREENW,SCREENH-8,"GMSMB*2 Ver. "+ VERSION)
draw_set_halign(-1)
draw_set_font(-1)

if section = 0
{
	switch (global.titleroom) {
	    case rmTitle_new:
				draw_sprite(sTitlex2,image_index,x-cx,y-cy+8);
	    break;
	    case rmTitle_old:
				draw_sprite(sTitle2,image_index,x-cx,y-cy+8);
	    break;
	    case rmTitle_MK:
				draw_sprite(sTitle,image_index,x-cx,y-cy+8);
	    break;
	}
	
	if global.player = "Max Verstappen" {draw_sprite_ext(sOmaga,0,x-88-cx,y-cy+68,0.8,1.8,0,c_white,1);}
	
	global.time = -1;
} else if section != 17 {
	menu_background();
	
	if global.titleroom != rmTitle_MK 
	{xx = (global.aspectratio = "ORIGINAL")? 48 : 64;}
	
	yy = 64;
	tsep = 16;
}

menu_customize_gui();
menu_credits();
menu_draw_text();

if instance_exists(oMario) && oMario.playDemo > room_speed*8 
{exit;}

menu_controls_custom();
menu_settings();

if (keyboard_check_pressed(global.keyj) || keyboard_check_pressed(vk_enter)) 
&& menu[# section, sel] == "BACK" 
&& resapply	
{room_restart(); savesettings();}

#region selection

if keyboard_check_pressed(global.keyu) && sel > 0
{sel -= 1; sfx(sndMenumove,0);}
if keyboard_check_pressed(global.keyd) && sel < optionsnum[section]-1
{sel += 1; sfx(sndMenumove,0);}

#endregion

if keyboard_check_pressed(global.keyj) || keyboard_check_pressed(vk_enter) 
{
	switch(menu[# section, sel])
	{
		case "EXTRA LEVEL":
			room_goto(timetoparty);
			
			global.extra = true;
			
			setTimer(500);
		break;
		case "   PLAYER GAME":
			room_goto(timetoparty);
					
			global.world = 1 
			global.level = 1 
					
			setTimer();
		break;
		case "LEVEL SELECT":
			var _gr = get_string("ROOM NAME", "rm1_1");
			if room_exists(asset_get_index(_gr))	{room_goto(asset_get_index(_gr));}
			
			setTimer(choose(100,200,300,400,500,1000));
		break;
		case "NETWORK GAME":
			section = 1;
			sel = 0;
			sfx(sndMenuselect,0);
		break
		case "OPTIONS":
			section = 2;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "USERNAME - ":
			global.username = get_string("Insert a username",global.username)
			sfx(sndMenuselect,0);
			savesettings()
		break;
		case "SET IP - ":
			global.ip = get_string("Insert IP (of server)",global.ip)
			if global.ip = "" {loadsettings()}
			sfx(sndMenuselect,0);
			savesettings()
		break;
		case "SET PORT - ":
			global.port = get_integer("Insert port (of server)",global.port)
			sfx(sndMenuselect,0);
			try {savesettings();}
			catch(mistake) {global.port = 0;}
		break;
		case "JOIN":
			section = 3
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "HOST":
			section = 4
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "JOIN GAME":
			room_goto(rmLobby);
			global.insertclient = true
			
			sfx(sndMenuselect,0);
			
			global.world = 0;
			global.level = 0;
		break;
		case "HOST GAME":
			room_goto(rmServer);
			sfx(sndMenuselect,0);
		break;
		case "MAX PLAYERS - ":
			global.maxplayers = get_integer("How many max players?",global.maxplayers)
			try {global.maxplayers = clamp(global.maxplayers,2,50);}
			catch(mistake) {global.maxplayers = 8;}
			sfx(sndMenuselect,0);
		break;
		case "CUSTOMIZE":
			section = 5;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYERS ABILITIES - ":
			global.abilities = !global.abilities;
			savesettings()
		break;
		case "AUDIO":
			section = 9;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "VIDEO":
			section = 8;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "TOGGLE FULLSCREEN":
			window_set_fullscreen(!window_get_fullscreen())
			sfx(sndMenuselect,0);
		break;
		case "RESET WINDOW":
			window_set_fullscreen(false)
		
			var scrsizemult = 3;
			window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
			window_center()
			sfx(sndMenuselect,0);
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
			savesettings();
		break;
		case "TITLE SCREEN - ":
			global.titleroom_selected++
			if global.titleroom_selected > array_length(global.titlerooms) - 1
			{global.titleroom_selected = 0;}
			savesettings();
		break;
		case "TOGGLE LETTERBOX DARKEN":
			global.letterboxDark = !global.letterboxDark
			savesettings();
			sfx(sndMenuselect,0);
		break;
		case "SOUND MODE - ":
			global.musicchannels = !global.musicchannels;
			savesettings();
		break;
		case "PLAY GANGNAM - ":
			global.opacandastar = !global.opacandastar;
			savesettings();
		break;
		case "HARD MODE - ":
			global.hardmode = !global.hardmode;
			savesettings();
		break;
		case "WARP ZONE - ":
			global.warpzone = !global.warpzone;
			savesettings();
		break;
		case "RESOLUTION":
			section = 16;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "CREDITS1!!":
			section = 17;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "CONTROLS":
			section = 10;
			sel = 0;
			sfx(sndMenuselect,0);
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
			sfx(sndMenuselect,0);
		break;
		case "COMMANDER SETTINGS":
			section = 14;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "CLASSIC AUDIO MODIFIER":
			section = 15;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYER 1":
			if section = 5 {section = 6;}
			if section = 10 {section = 11;}
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYER 2":
			if section = 5 {section = 7;}
			if section = 10 {section = 12;}
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "BACK":
			if section = 1			{section = 0; sel = 3;}
			else if section = 2		{section = 0; sel = 4;}
			else if section = 3		{section = 1; sel = 0;}
			else if section = 4		{section = 1; sel = 1;}
			else if section = 5		{section = 2; sel = 0;}
			else if section = 6		{section = 5; sel = 0;}
			else if section = 7		{section = 5; sel = 1;}
			else if section = 8		{section = 2; sel = 1;}
			else if section = 9		{section = 2; sel = 2;}
			else if section = 10	{section = 2; sel = 3;}
			else if section = 11	{section = 10; sel = 0;}
			else if section = 12	{section = 10; sel = 1;}
			else if section = 13	{section = 2; sel = 4;}
			else if section = 14	{section = 13; sel = 0;}
			else if section = 15	{section = 13; sel = 1;}
			else if section = 16	{section = 8; sel = 6;}
			else if section = 17	{section = 2; sel = 5;}
			else					{section = 0; sel = 0;}
		
			sfx(sndMenuback,0);
		break;
		default:
			if menu[# section, sel] != "BACK" and section = 16
			{global.aspectratio = menu[# section, sel] resapply = true;}
			
			if file_exists("gmsmbsave.ini")
			{
				ini_open("gmsmbsave.ini");
				if global.aspectratio = ini_read_string("etc","resolution","WIDESCREEN") 
				{resapply = false;}
				ini_close();
			}
			
			switch (global.aspectratio) {
				case "ORIGINAL": SCREENW = SCREENW_OG; SCREENH = SCREENH_OG; break;
				case "WIDESCREEN": SCREENW = SCREENW_WS; SCREENH = SCREENH_OG; break;
				case "ULTRA WIDE": SCREENW = SCREENW_UW; SCREENH = SCREENH_UW; break;
				case "ROOM WIDTH": SCREENW = room_width; SCREENH = SCREENH_UW; break;
				case "LINE": SCREENW = 32; SCREENH = SCREENH_UW; break;
			}
			
			resize_screen();
			sfx(sndMenuselect,0);
		break;
	}
}