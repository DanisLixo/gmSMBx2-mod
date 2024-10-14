// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_create() //REMEMBER THAT RENDERING IS INSIDE THE MENUS OBJECTS DRAW GUI SCRIPT
{
	menu = ds_grid_create(20,9)
	optionsnum = array_create(20,0)

	timetoparty = rmLeveltransition

	section = 0;
	sel = 1;

	addmenu = function(sec,pos,label)
	{
		menu[# sec,pos] = label
		optionsnum[sec] += 1;
	}

	addmenu(0,0,"EXTRA LEVEL")
	addmenu(0,1,"   PLAYER GAME")
	addmenu(0,2,"LEVEL SELECT")
	addmenu(0,3,"NETWORK GAME")
	addmenu(0,4,"OPTIONS")

	addmenu(1,0,"JOIN")
	addmenu(1,1,"HOST")
	addmenu(1,2,"PLYRS VISIBILITY")
	addmenu(1,3,"BACK")

	addmenu(2,0,"CUSTOMIZE")
	addmenu(2,1,"VIDEO")
	addmenu(2,2,"AUDIO")
	addmenu(2,3,"CONTROLS")
	addmenu(2,4,"OTHER")
	
	addmenu(3,0,"USERNAME - ")
	addmenu(3,1,"SET IP - ")
	addmenu(3,2,"SET PORT - ")
	addmenu(3,3,"JOIN GAME")
	addmenu(3,4,"BACK")

	addmenu(4,0,"SET PORT - ")
	addmenu(4,1,"MAX PLAYERS - ")
	addmenu(4,2,"HOST GAME")
	addmenu(4,3,"BACK")

	addmenu(5,0,"PLAYER 1")
	addmenu(5,1,"PLAYER 2")

	addmenu(6,0,"CATEGORY - ")
	addmenu(6,1,"PLAYER - ")
	addmenu(6,2,"PALETTE - ")
	addmenu(6,3,"GUN - ")
	addmenu(6,4,"BACK")

	addmenu(7,0,"CATEGORY - ")
	addmenu(7,1,"PLAYER - ")
	addmenu(7,2,"PALETTE - ")
	addmenu(7,3,"BACK")

	addmenu(8,0,"TOGGLE FULLSCREEN")
	addmenu(8,1,"RESET WINDOW")
	addmenu(8,2,"DISCORD PFP - ")
	addmenu(8,3,"SHOW FPS - ")
	addmenu(8,4,"LETTERBOX - ")
	addmenu(8,5,"TOGGLE LETTERBOX DARKEN")
	addmenu(8,6,"RESOLUTION")
	addmenu(8,7,"BACK")

	addmenu(9,0,"SOUND MODE - ")
	addmenu(9,1,"SFX")
	addmenu(9,2,"BGM")
	addmenu(9,3,"PLAY GANGNAM - ")
	addmenu(9,4,"BACK")

	addmenu(10,0,"PLAYER 1")
	addmenu(10,1,"PLAYER 2")
	addmenu(10,2,"BACK")

	addmenu(11,0,"UP")
	addmenu(11,1,"DOWN")
	addmenu(11,2,"LEFT")
	addmenu(11,3,"RIGHT")
	addmenu(11,4,"ACTION")
	addmenu(11,5,"JUMP")
	addmenu(11,6,"HOLDACT")
	addmenu(11,7,"BACK")

	addmenu(12,0,"UP")
	addmenu(12,1,"DOWN")
	addmenu(12,2,"LEFT")
	addmenu(12,3,"RIGHT")
	addmenu(12,4,"ACTION")
	addmenu(12,5,"JUMP")
	addmenu(12,6,"HOLDACT")
	addmenu(12,7,"BACK")

	addmenu(13,0,"COMMANDER SETTINGS")
	addmenu(13,1,"CLASSIC AUDIO MODIFIER")

	addmenu(14,0,"COMMAND ENEMIES - ")
	addmenu(14,1,"COMMAND MOVABLE OBJS - ")
	addmenu(14,2,"COMMAND STATICS - ")
	addmenu(14,3,"BACK")

	addmenu(15,0,"SQUARE 0 - ")
	addmenu(15,1,"SQUARE 1 - ")
	addmenu(15,2,"TRIANGLE 2 - ")
	addmenu(15,3,"NOISE 3 - ")
	addmenu(15,4,"BACK")

	addmenu(16,0,"WIDESCREEN")
	addmenu(16,1,"ORIGINAL")
	addmenu(16,2,"ULTRA WIDE")
	addmenu(16,3,"ROOM WIDTH")
	addmenu(16,4,"LINE")
	addmenu(16,5,"BACK")

	addmenu(17,0,"BACK")
	
	if object_index == oMenu
	{
		addmenu(2,5,"CREDITS1!!")
		addmenu(2,6,"BACK")
		
		addmenu(5,2,"PLAYERS ABILITIES - ")
		addmenu(5,3,"BACK")
		
		addmenu(13,2,"HARD MODE - ")
		addmenu(13,3,"WARP ZONE - ")
		addmenu(13,4,"TITLE SCREEN - ")
		addmenu(13,5,"BACK")
	} else if object_index == oOptsx2 {
		addmenu(2,0,"VIDEO")
		addmenu(2,1,"AUDIO")
		addmenu(2,2,"CONTROLS")
		addmenu(2,3,"OTHER")
		addmenu(2,4,"CREDITS1!!")
		addmenu(2,5,"BACK")
		
		addmenu(13,2,"HARD MODE - ")
		addmenu(13,3,"WARP ZONE - ")
		addmenu(13,4,"TITLE SCREEN - ")
		addmenu(13,5,"BACK")
	} else {
		addmenu(2,5,"BACK")
		addmenu(5,2,"BACK")
		addmenu(13,2,"BACK")
	}

	menuind = 0

	category = "Characters"
	categorysel = 0;
	//Characters
	charslist = 7
	//OCs
	ocslist = charslist + 9
	//LQ jokes
	lqlist = ocslist + 7
	//HQ jokes
	hqlist = lqlist + 3
	//mods
	mods = hqlist
	
	updtplayerpalette = function()
	{
		if sprite_exists(asset_get_index("sPalette_"+string_lower(global.player)))
		{
			if global.player = "Goomba"	{global.palettesprite = asset_get_index("sPalette_goombaplayer");}
			else	{global.palettesprite = asset_get_index("sPalette_"+string_lower(global.player));}
		}
		else
		{
			if ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(global.player)) != undefined
				global.palettesprite = ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(global.player))
			else
				global.palettesprite = sPalette_mario;
		}
	}

	updtplayertwopalette = function()
	{
		if sprite_exists(asset_get_index("sPalette_"+string_lower(global.playertwo)))
		{
			if global.playertwo = "Goomba"	{global.p2_palettesprite = asset_get_index("sPalette_goombaplayer");}
			else	{global.p2_palettesprite = asset_get_index("sPalette_"+string_lower(global.playertwo));}
		}
		else
		{
			if ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(global.playertwo)) != undefined
				global.p2_palettesprite = ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(global.playertwo))
			else
				global.p2_palettesprite = sPalette_luigi;
		}
	}

	curplayersel = 0;
	curplayer2sel = 0;
	curgunsel = 0;

	waitforcontrol = 0
	settingkey = global.keyu
	setcontrol = function(whichglobalvarname)
	{
		waitforcontrol = 60*5;
		settingkey = whichglobalvarname;
	}

	depth = -9999

	resapply = false;
}