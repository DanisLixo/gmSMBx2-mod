var cy = camera_get_view_y(view_camera[0])

var xx = SCREENW/2 //88-cx;
var yy = 32-cy;
var tsep = 16;

global.time = -1;

draw_sprite_ext(sOptsborder, 0, 0, 0, SCREENW/sprite_get_width(sOptsborder), SCREENH/sprite_get_height(sOptsborder), 0, c_white, 1)

if section = 5 || section = 6
{
	global.environment = e.underground
	
	var g = sGun_Default
	if sprite_exists(gs("sGun_Default"))
	{g = gs("sGun_Default");}
		
	if section == 5
	{
		
	}
	else if section == 6
	{
		
	}
	var scale = 2;
	var scaleg = 2;
	/*if marSpr = sPeterGriffin
	|| marSpr = sDuke
	|| marSpr = sPokey
	|| marSpr = sMax_Verstappen_s_idle  {scale = 0.35;}*/
		
	draw_set_font(fntComicsmall);
	draw_set_halign(fa_center);
	if section == 5 {
		shader_set(shdColorswap)
		apply_palette(global.palettesprite,global.paletteindex,1)
		shader_reset();
			
		if sel = 3
		{draw_sprite_ext(g,0,SCREENW/2,64+(current_time/800)*5,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1)}
			
		draw_text(SCREENW/2, 32, "creator: "+global.creatorlist[| curplayersel])
	} else if section == 6 {
		shader_set(shdColorswap)
		apply_palette(global.p2_palettesprite,global.p2_paletteindex,1)
		shader_reset();
	
		draw_text(SCREENW/2, 32, "creator: "+global.creatorlist[| curplayer2sel])
	}
	draw_set_halign(fa_left);
	//marioX = lerp(marioX, SCREENW/2 - 24, .1);
}

if keyboard_check_pressed(global.keyu) && sel > 0
	{sel -= 1; sfx(sndMenumove,0);}
if keyboard_check_pressed(global.keyd) && sel < optionsnum[section]-1
	{sel += 1; sfx(sndMenumove,0);}

var p = (keyboard_check_pressed(global.keyr)-keyboard_check_pressed(global.keyl)); 

if p != 0 {
	if section = 0
	{global.multiplayer = !global.multiplayer;}
	
	if menu[# section, sel] = "PLYRS VISIBILITY"
	{global.onlinealpha += 0.1*p; sfx(sndMenumove,0); savesettings()}
	else if p != 0 {sfx(sndMenumove,0)}
	
	global.onlinealpha = clamp(global.onlinealpha,0,1);
}

if menu[# section, sel] = "PLAYER - "
{
	if p != 0 {}
		
	if section = 6 {curplayersel += p;}
	else if section = 7 {curplayer2sel += p;}
		
	if p != 0
	{
		if section = 6 {
		global.paletteindex = 1;
		updtplayerpalette();
		}
		else if section = 7 {
		global.p2_paletteindex = 1;
		updtplayertwopalette();
		}
		savesettings();
	}
	
	if curplayersel > ds_list_size(global.charlist)-1 {curplayersel = 0;}
	if curplayersel < 0 {curplayersel = ds_list_size(global.charlist)-1;}
	
	if curplayer2sel > ds_list_size(global.charlist)-1 {curplayer2sel = 0;}
	if curplayer2sel < 0 {curplayer2sel = ds_list_size(global.charlist)-1;}
	
	if section = 6 {
		global.player = global.charlist[| curplayersel]
			
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
		else {
			categorysel = 4
		}
	}
	else if section = 7 {
		global.playertwo = global.charlist[| curplayer2sel]
		
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
		else {
			categorysel = 4
		}
	}
}

if menu[# section, sel] = "PALETTE - "
{
	if p != 0 {}
	
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
	
draw_set_font(global.fnt);

for (var i = 0; i < optionsnum[section]; i ++;)
{
	var text = ""
	draw_set_halign(fa_center);
	
	if menu[# section, i] = "CATEGORY - "
	{text = menu[# section, i]+string_upper(category);}
	else if menu[# section, i] = "PLAYER - " and section = 5
	{text = menu[# section, i]+string_upper(global.charlist[| curplayersel]);}
	else if menu[# section, i] = "PLAYER - " and section = 6
	{text = menu[# section, i]+string_upper(global.charlist[| curplayer2sel]);}
	else if menu[# section, i] = "PALETTE - " and section = 5
	{text = menu[# section, i]+string_upper(global.paletteindex);}
	else if menu[# section, i] = "PALETTE - " and section = 6
	{text = menu[# section, i]+string_upper(global.p2_paletteindex);}
	else if menu[# section, i] = "GUN - "
	{text = menu[# section, i]+string_upper(global.gunskin);}
	else if menu[# section, i] = "PLAYERS ABILITIES - " 
	{
		var ex = "ON"
		if global.abilities = false {ex = "OFF";}
		text = menu[# section, i]+ex
	}
	else {text = menu[# section, i];}
	
	if i == sel {
		var mushx = xx - (string_width(text) / 2) - 16
		shader_set(shdColorswap) 
			apply_palette(sPalette_gold,global.environment+1,1); 
			draw_sprite(sMushsel,oGame.image_index, mushx,yy+(i*tsep));
		shader_reset();
	}
	
	var charlimit = (string_length(text) > 17)? 1-((string_length(text)-24)*0.025) : 1
	draw_text_transformed(xx,yy+(i*tsep),text,charlimit,1,0);
}

draw_set_font(-1)
draw_set_halign(-1)

if keyboard_check_pressed(global.keyj) or keyboard_check_pressed(vk_enter)	{ 
	switch(menu[# section, sel])
	{
		case "EXTRA LEVEL":
			room_goto(timetoparty);
			global.time = timeunits(500)
			global.extra = true;
		break;
		case "START GAME":
			room_goto(timetoparty);
			global.time = timeunits(400)
			global.world = 1 
			global.level = 1 
		break;
		case "LEVEL SELECT":
			var _gr = get_string("ROOM NAME", "rm1_1");
			if room_exists(asset_get_index(_gr))	{room_goto(asset_get_index(_gr));}
			global.time = timeunits(400)
		break;
		case "NETWORK GAME":
			section = 1;
			sel = 0;
			sfx(sndMenuselect,0);
		break
			
		case "HOST":
			section = 3
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "MAX PLAYERS - ":
			global.maxplayers = get_integer("How many max players?",global.maxplayers)
			try {global.maxplayers = clamp(global.maxplayers,2,50);}
			catch(mistake) {global.maxplayers = 2;}
			sfx(sndMenuselect,0);
		break;
		case "HOST GAME":
			room_goto(rmServer);
			sfx(sndMenuselect,0);
		break;
			
		case "JOIN":
			section = 2
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
			catch(mistake) {global.port = 7676;}
		break;
			
		case "CUSTOMIZE":
			section = 4;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYER 1":
			section = 5;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYER 2":
			section = 6;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYERS ABILITIES - ":
			global.abilities = !global.abilities;
			savesettings()
		break;
			
		case "BACK":
			if section = 1			{section = 0; sel = 3;}
			else if section = 2		{section = 1; sel = 4;}
			else if section = 3		{section = 1; sel = 0;}
			else if section = 4		{section = 0; sel = 1;}
			else if section = 5		{section = 4; sel = 0;}
			else if section = 6		{section = 4; sel = 0;}
		
			sfx(sndMenuback,0);
		break;
	}
}
if keyboard_check_pressed(global.keya) {room_goto(rmTitle_x2)}