event_inherited();

global.stars = 0 

my_id = global.clientid
if !instance_exists(oDoor) and 
(room = asset_get_index("rm"+string(global.world)+"_"+string(global.level)) 
|| room = asset_get_index("rm"+string(global.world)+"_"+string(global.level)+"_under"))
{if instance_exists(oClient) instance_create_layer(x-8,room_height-32,"Instances",oDoor)}

if instance_exists(oGame)
{powerup = oGame.savedpowerup;}

palindex = global.p2_paletteindex
global.pind = 0;

spr =  ms("sMario_{}_idle");

//Demo setup
frame = 0;
demoFileName = "demo.json";

//Load Data
if file_exists(demoFileName)
{
	demoFile = file_text_open_read(demoFileName);
	demoDataRoot = json_decode(file_text_read_string(demoFile));
	demoData = demoDataRoot[? "root"];
	demoFrames = ds_list_size(demoData);
	demoFile = file_text_close(demoFile);
} else {frame = -1;}