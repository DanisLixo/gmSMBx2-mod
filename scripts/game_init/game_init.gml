/// @self
/// @description Game start function.
function init()
{
	randomize();
	
	//#macro SCREENW 416 // 384 // 256
	#macro SCREENW_WS 412
	#macro SCREENW_OG 256
	#macro SCREENW_UW 568
	
	#macro SCREENH_UW 240 // 232 // 240 
	#macro SCREENH_OG 232 // 232 // 240 
	
	if file_exists("gmsmbsave.ini")
	{
		ini_open("gmsmbsave.ini");
		global.aspectratio = ini_read_string("etc","resolution","WIDESCREEN");
	}
	else {global.aspectratio = "WIDESCREEN";}
	
	globalvar SCREENW; SCREENW = SCREENW_WS;
	globalvar SCREENH; SCREENH = SCREENH_OG;
	switch (global.aspectratio) {
	    case "ORIGINAL":
	        SCREENW = SCREENW_OG
	    break;
	    case "WIDESCREEN":
	        SCREENW = SCREENW_WS
			SCREENH = SCREENH_OG
	    break;
	    case "ULTRA WIDE":
	        SCREENW = SCREENW_UW
			SCREENH = SCREENH_UW
	    break;
	}
	
	#macro TIMESEC 0.4
	#macro FNT_SMB font_add_sprite_ext(sFont,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-+*!.:©bredi/_",0,0)
	#macro FNT_LL font_add_sprite_ext(sFont_LL,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-+*!.:©bredi/_",0,0)
	#macro FNT_SECRT font_add_sprite_ext(sFont_secrets,"0123456789CDEFNORSTUY!",0,0)
	global.fnt = FNT_SMB
	#macro VERSION "MOD 2.5"
	
	global.score = 0;
	global.coins = 0;
	global.time = -1
	
	global.player = "Mario"
	global.playerName = "Mario"
	global.palettesprite = sPalette_mario;
	global.paletteindex = 1;
	
	global.p2_score = 0;
	global.p2_coins = 0;
	
	global.playertwo = "Luigi";
	global.playertwoName = "Luigi"
	global.p2_palettesprite = sPalette_luigi;
	global.p2_paletteindex = 1;	
	
	global.gunskin = "Default"
	
	global.letterboxSprite = sLetterbox_Character;
	
	global.letterboxSelected = 0
	global.letterboxDark = 0
	global.letterboxes = [
	{	
		name : "RED",
		spr : sLetterbox_Modern_Red
	},
	{	
		name : "BLUE",
		spr : sLetterbox_Modern_Blue
	},
	{	
		name : "GREEN",
		spr : sLetterbox_Modern_Green
	},
	{	
		name : "YELLOW",
		spr : sLetterbox_Modern_Yellow
	},
	{	
		name : "PINK",
		spr : sLetterbox_Modern_Pink
	},
	{	
		name : "PURPLE",
		spr : sLetterbox_Modern_Purple
	},
	{	
		name : "ORANGE",
		spr : sLetterbox_Modern_Orange
	},
	{	
		name : "SIMPLE",
		spr : sLetterbox_Simple
	},
	{	
		name : "CHARACTER",
		spr : sLetterbox_Character
	},
	]
	
	global.titleroom = rmTitle_new;
	
	global.titleroom_selected = 0;
	global.titlerooms = [
	{	
		name : "NEW",
		room : rmTitle_new
	},
	{	
		name : "OLD",
		room : rmTitle_old
	},
	{	
		name : "MARIOKET",
		room : rmTitle_MK
	},
	{	
		name : "X2",
		room : rmTitle_x2
	},
	]
	
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
	global.partner_active = false;
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
	
	enum gm
	{
		SMB, LL, ANN
	}
	global.game = gm.SMB;
	
	global.hiddenoneup = false;
	global.secrets_found = 0;

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
	
		window_set_caption("gmSMBx2 "+VERSION);
		
		/*var displayw = display_get_width();
		var displayh = display_get_height();
		var xpos = (displayw / 2) - (SCREENW*scrsizemult)/2;
		var ypos = (displayh / 2) - (SCREENH*scrsizemult)/2;
		*/
		var scrsizemult = 3;
		window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
		surface_resize(application_surface,SCREENW,SCREENH);

		view_enabled = true;
		view_visible[0] = true;

		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = SCREENW;
		view_hport[0] = SCREENH;
		//display_set_gui_size(SCREENW,SCREENH)
		
	#endregion
	
	#region characters
	
	global.moddedSprites = ds_map_create();
	global.moddedSounds = ds_map_create();
	global.moddedChars = ds_map_create();
	global.charlist = ds_list_create();
	global.creatorlist = ds_list_create();
	global.idlist = ds_list_create();
	global.gunlist = ds_list_create();
	
	ImportModSprites("mods\\character")
	ImportModGSpr("mods\\gun")
	ImportModSounds("mods\\character")

	addplist = function(name,creator,_id = name)
	{
		ds_list_add(global.charlist,name);
		ds_list_add(global.creatorlist,creator);
		ds_list_add(global.idlist,_id); 
	}
		
	//Characters

	addplist("Mario","nintendo")
	addplist("Luigi","bredi")
	addplist("Toad","nintendo")
	addplist("Wario","sans1m0n")
	addplist("Goomba","seven")
	addplist("Sonic","pixelmarioxp")
	addplist("Syobon","syobon action")

	addplist("Bredi","bredi")
	addplist("Goober","toasterman")
	addplist("Iris","madnyle")
	addplist("Owen","owen")
	addplist("Seven","seven")
	addplist("SucculentKicker","dermo")
	addplist("Goldron","goldron")
	addplist("Dawn","dawlate")
	addplist("Feathy","buchotnik da dolly")
		
	addplist("Anton","summitsphere")
	addplist("Peter Griffin",".")
	addplist("Duke","pacolagamer444")
	addplist("Pokey","POKEY'S MOM")
	addplist("Really small Mario","gemaplys", "1pixelmario")
	addplist("Max Verstappen","enciroyeah")
	addplist("Peppino","tour de la pizza")

	addplist("Martin","seven")
	addplist("Peter","seven")
	addplist("Vito","dawlate", "Gemaplys")
	ImportModCharacter(working_directory + "mods\\character")
		
	// Guns

	addgunlist = function(name)
	{
		ds_list_add(global.gunlist,name);
	}
		
	addgunlist("Default")
	addgunlist("BigHand")
	addgunlist("Emoji")
	addgunlist("AppleEmoji")
	addgunlist("MiniGun")
	ImportModGuns(working_directory + "mods\\gun")
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
	global.pvp = false;
	
	global.hardmode = false;
	global.warpzone = false;
	
	global._1upclonebug = false //returns the mario 1 up clone bug
	global.hatblockspambug = false //returns hat broken hitbox
	global.enemiesrain = false
	
	global.racepos = ds_grid_create(3,1);
	global.nextlvltimer = 10
	global.waiting = false
	global.sync = false;
	
	global.arena = 0
	global.goalofstars = 15;
	global.onlinealpha = 0.5;
	
	global.spectate = false;
	
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
