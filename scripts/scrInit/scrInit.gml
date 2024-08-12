function timeunits(amt)
{return (TIMESEC*room_speed)*amt}

function init()
{
	randomize();
	
	if file_exists("gmsmbsave.ini")
	{
		ini_open("gmsmbsave.ini");
		var secETC = "etc";
		var aspectratio = ini_read_string(secETC,"resolution","WIDESCREEN");
		global.aspectratio = aspectratio;
	}
	else {global.aspectratio = "WIDESCREEN";}
	
	//#macro SCREENW 416 // 384 // 256
	#macro SCREENW_WS 412.5
	#macro SCREENW_OG 256
	#macro SCREENW_UW 569
	#macro SCREENH_UW 240 // 232 // 240 
	#macro SCREENH_OG 232 // 232 // 240 
	
	globalvar SCREENW; SCREENW = SCREENW_WS;
	globalvar SCREENH; SCREENH = SCREENH_OG;
	if global.aspectratio = "ORIGINAL" {
		SCREENW = SCREENW_OG
	}
	else if global.aspectratio = "ULTRA WIDE" {
		SCREENW = SCREENW_UW
		SCREENH = SCREENH_UW
	}
	
	#macro TIMESEC 0.4
	#macro FNT font_add_sprite_ext(sFont,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-+*!.:©bredi/_",0,0)
	#macro VERSION "MODDED 2.5"
	
	global.score = 0;
	global.coins = 0;
	global.time = -1
	
	global.player = "Mario"
	global.palettesprite = sPalette_mario;
	global.paletteindex = 1;
	
	global.playertwo = "Luigi";
	global.p2_palettesprite = sPalette_luigi;
	global.p2_paletteindex = 1;	
	
	global.gunskin = "Default"
	global.letterboxSprite = sBG_0
	
	global.demo = false;
	
	global.showfps = true;
	global.showpfp = true;

	global.ch[0] = -1 //Sound
	global.ch[1] = -1 //Sound
	global.ch[2] = -1 //Sound
	global.ch[3] = -1 //Sound
	global.ch[4] = -1 //Sound

	global.sfx[0] = -1 //Sound
	global.sfx[1] = 0; //Channel
	
	global.musicchannels = true
	global.opacandastar = true
	global.volsfx = 0.5;
	global.volbgm = 0.5;
	
	global.keyr = vk_right//ord("D");
	global.keyl = vk_left//ord("A");
	global.keyu = vk_up//ord("W");
	global.keyd = vk_down//ord("S");
	global.keya = ord("X")//vk_lcontrol;
	global.keyj = ord("Z")//vk_space;
	global.keyh = ord("C")//ord("E");
	
	global.p2_keyr = ord("D");
	global.p2_keyl = ord("A");
	global.p2_keyu = ord("W");
	global.p2_keyd = ord("S");
	global.p2_keya = vk_shift
	global.p2_keyj = vk_space;
	global.p2_keyh = ord("E");
	
	//global.keyrun = vk_shift;
	
	global.moveenys = true;
	global.moveobjs = true;
	global.movestatics = false;
	global.multiplayer = false;
	global.abilities = true;
	
	global.ch_allowed[0] = true //Sound
	global.ch_allowed[1] = true //Sound
	global.ch_allowed[2] = true //Sound
	global.ch_allowed[3] = true //Sound
	
	#region environment

	enum e
	{
		overworld,
		underground,
		castle,
		underwater,
		mushroom,
		snow,
		night,
		snowday
	}
	global.environment = e.overworld


	function tile_brownpalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tilebrown,global.environment,1)
	}
	function tile_greenpalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tilegreen,global.environment,1)
	}
	function tile_bluepalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tileblue,global.environment,1)
	}
	function bg_palswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_background,global.environment,1)
	}
	function retro_palswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_mario,global.paletteindex,1)
	}
	function tile_palreset()
	{
		shader_reset();
	}
	#endregion
	
	#region screen
	
		window_set_caption("gmSMB "+VERSION);
		
		
		var scrsizemult = 3;
		/*var displayw = display_get_width();
		var displayh = display_get_height();
		var xpos = (displayw / 2) - (SCREENW*scrsizemult)/2;
		var ypos = (displayh / 2) - (SCREENH*scrsizemult)/2;
		*/
		
		window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
		window_center()

		view_enabled = true;
		view_visible[0] = true;

		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = SCREENW;
		view_hport[0] = SCREENH;

		surface_resize(application_surface,SCREENW,SCREENH);
		//display_set_gui_size(SCREENW,SCREENH)
		
	#endregion
	
	global.debug = true;
	
	global.rtxmode = false;
	global.schutmode = false;
	global.commandenys = false;
	global.race = false;
	global.challenge = false;
	global.extra = false;
	global.playercol = false;
	global.freecam = false;
	global.trippymode = false;
	
	global.racepos = ds_grid_create(3,1);
	global.nextlvltimer = 10
	global.waiting = true
	global.sync = false
	
	global.arena = 0
	//global.extra = false
	global.goalofstars = 15;
	global.onlinealpha = 0.5;
	
	global.ip = "12345.ddns.net"
	global.port = 7676;
	global.maxplayers = 8;
	global.username = ""
	global.insertclient = false
	global.clientid = irandom_range(0,10000);
	
	global.CHAT = ds_list_create();
	global.chatfocus = false;
	
	global.level = 0;
	global.world = 0;
}
