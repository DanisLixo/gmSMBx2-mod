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
addmenu(0,1,"START GAME")
addmenu(0,2,"LEVEL SELECT")
addmenu(0,3,"NETWORK GAME")
addmenu(0,4,"CUSTOMIZE")

addmenu(1,0,"JOIN")
addmenu(1,1,"HOST")
addmenu(1,2,"PLYRS VISIBILITY")
addmenu(1,3,"BACK")

addmenu(2,0,"USERNAME - ")
addmenu(2,1,"SET IP - ")
addmenu(2,2,"SET PORT - ")
addmenu(2,3,"JOIN GAME")
addmenu(2,4,"BACK")

addmenu(3,0,"SET PORT - ")
addmenu(3,1,"MAX PLAYERS - ")
addmenu(3,2,"HOST GAME")
addmenu(3,3,"BACK")

addmenu(4,0,"PLAYER 1")
addmenu(4,1,"PLAYER 2")
addmenu(4,2,"PLAYERS ABILITIES - ")
addmenu(4,3,"BACK")

addmenu(5,0,"CATEGORY - ")
addmenu(5,1,"PLAYER - ")
addmenu(5,2,"PALETTE - ")
addmenu(5,3,"GUN - ")
addmenu(5,4,"BACK")

addmenu(6,0,"CATEGORY - ")
addmenu(6,1,"PLAYER - ")
addmenu(6,2,"PALETTE - ")
addmenu(6,3,"BACK")

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
			global.palettesprite = ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(global.playertwo))
		else
			global.palettesprite = sPalette_luigi;
	}
}

curplayersel = 0;
curplayer2sel = 0;
curgunsel = 0;

bgx = 0
mntsx = 0

depth = -9999
vspd = 0
oGame.loadscreen = -1