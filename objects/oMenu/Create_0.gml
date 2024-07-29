menu = ds_grid_create(10,10)
optionsnum = array_create(10,0)

timetoparty = rmLeveltransition

section = 0;
if section = 0
{sel = 1;}
else
{sel = 0;}

addmenu = function(sec,pos,label)
{
	menu[# sec,pos] = label
	optionsnum[sec] += 1;
}

addmenu(0,0,"EXTRA LEVEL")
addmenu(0,1,"1 PLAYER GAME")
addmenu(0,2,"NETWORK GAME")
addmenu(0,3,"OPTIONS")

addmenu(1,0,"JOIN")
addmenu(1,1,"HOST")
addmenu(1,2,"BACK")

addmenu(2,0,"CUSTOMIZE")
addmenu(2,1,"VIDEO")
addmenu(2,2,"AUDIO")
addmenu(2,3,"CONTROLS")
addmenu(2,4,"OTHER")
addmenu(2,5,"BACK")

addmenu(3,0,"CATEGORY - ")
addmenu(3,1,"PLAYER - ")
addmenu(3,2,"PALETTE - ")
addmenu(3,3,"GUN - ")
addmenu(3,4,"BACK")

addmenu(4,0,"USERNAME - ")
addmenu(4,1,"SET IP - ")
addmenu(4,2,"SET PORT - ")
addmenu(4,3,"JOIN GAME")
addmenu(4,4,"BACK")

addmenu(5,0,"SET PORT - ")
addmenu(5,1,"MAX PLAYERS - ")
addmenu(5,2,"HOST GAME")
addmenu(5,3,"BACK")

addmenu(6,0,"SOUND MODE - ")
addmenu(6,1,"SFX")
addmenu(6,2,"BGM")
addmenu(6,3,"PLAY GANGNAM - ")
addmenu(6,4,"BACK")

addmenu(7,0,"TOGGLE FULLSCREEN")
addmenu(7,1,"RESET WINDOW")
addmenu(7,2,"DISCORD PFP - ")
addmenu(7,3,"SHOW FPS - ")
addmenu(7,4,"RESOLUTION - ")
addmenu(7,5,"BACK")

addmenu(8,0,"UP")
addmenu(8,1,"DOWN")
addmenu(8,2,"LEFT")
addmenu(8,3,"RIGHT")
addmenu(8,4,"ACTION")
addmenu(8,5,"JUMP")
addmenu(8,6,"HOLDACT")
addmenu(8,7,"BACK")

addmenu(9,0,"- COMMANDER SETTINGS -")
	addmenu(9,1,"  COMMAND ENEMIES - ")
	addmenu(9,2,"  COMMAND MOVABLE OBJS - ")
	addmenu(9,3,"  COMMAND STATICS - ")
addmenu(9,4,"- CLASSIC AUDIO MOD -")
	addmenu(9,5,"  SQUARE 0 - ")
	addmenu(9,6,"  SQUARE 1 - ")
	addmenu(9,7,"  TRIANGLE 2 - ")
	addmenu(9,8,"  NOISE 3 - ")
addmenu(9,9,"BACK")
the = 0

playerlist = ds_list_create();
creatorlist = ds_list_create();
gunlist = ds_list_create();



addplist = function(name,creator)
{
	ds_list_add(playerlist,name);
	ds_list_add(creatorlist,creator);
	//ds_list_add(insertorlist,insertor);
}

addgunlist = function(name)
{
	ds_list_add(gunlist,name);
}

category = "Characters"
categorysel = 0;
//Characters
charslist = 6

addplist("Mario","nintendo")
addplist("Luigi","bredi")
addplist("Toad","nintendo")
addplist("Wario","sans1m0n")
addplist("Goomba","seven")
addplist("Sonic","pixelmarioxp")
//OCs
ocslist = charslist + 9

addplist("Bredi","bredi")
addplist("Goober","toasterman")
addplist("Iris","MadNyle")
addplist("Owen","owen")
addplist("Seven","seven")
addplist("SucculentKicker","dermo")
addplist("Goldron","goldron")
addplist("Dawn","dawnlr")
addplist("Feathy","buchotnik da dolly")
//LQ jokes
lqlist = ocslist + 6

addplist("Anton","summitsphere")
addplist("Peter Griffin",".")
addplist("Duke","pacolagamer444")
addplist("Pokey","POKEY'S MOM")
addplist("1pixelmario","gemaplys")
addplist("Max_Verstappen","EnciroYeah")
//HQ jokes
hqlist = lqlist + 2

addplist("Martin","seven")
addplist("Peter","seven")
addplist("Gemaplys","gemaplys")

addgunlist("Default")
addgunlist("BigHand")
addgunlist("Emoji")
addgunlist("AppleEmoji")
addgunlist("MiniGun")

gamemodes = ds_list_create();
ds_list_add(gamemodes, "CLASSIC");
ds_list_add(gamemodes, "RACE");
ds_list_add(gamemodes, "VERSUS");

additions = ds_list_create();
ds_list_add(additions, "NONE");
ds_list_add(additions, "GUNS");
ds_list_add(additions, "DARKMODE");
ds_list_add(additions, "VERSUS");



waitforcontrol = 0
settingkey = global.keyu
setcontrol = function(whichglobalvarname)
{
	waitforcontrol = 60*5;
	settingkey = whichglobalvarname;
}


updtplayerpalette = function()
{
	if sprite_exists(asset_get_index("sPalette_"+string_lower(global.player)))
	{
		if global.player = "Goomba"	{global.palettesprite = asset_get_index("sPalette_goombaplayer");}
		else	{global.palettesprite = asset_get_index("sPalette_"+string_lower(global.player));}
	}
	else
	{global.palettesprite = sPalette_mario;}
}


marioxs = 0;
marioys = 0;
gunxs = 0;
gunys = 0;

curplayersel = 0;
curgunsel = 0;

depth = -9999

transtext = (global.aspectratio = "ORIGINAL")? 0.8 : 1

if global.aspectratio = "WIDESCREEN" {inithorse = 0;}
if global.aspectratio = "ORIGINAL" {inithorse = 1;}
if global.aspectratio = "ULTRA WIDE" {inithorse = 2;}
horse = inithorse;

resapply = false;