/// @description Update NekoPresence so async events will execute.

np_update();

if (global.world == 0 || global.level == 0) 
{
	//where = "this person broke the game or smth idk where they are";
	where = "idk where they are, " + fact //"this person broke the game and i don't know where they are so here's debug message"
}

else
{
	if instance_exists(oRacemanager)	{where = "racing online on "+string(global.world)+"-"+string(global.level);}
	else if global.extra				{where = "gaming on an extra level yuh uh"}
	else								{where = "gaming on "+string(global.world)+"-"+string(global.level);}
}


if instance_exists(oPaused) {where = where + " - PAUSED"}
if global.multiplayer {where = where + " - Playing multiplayer"}

/*
if room = rmTitle	{where = "on the title screen";}
if room = rmLobby	{where = "on the lobby";}
if room = rmServer	{where = "hosting a server go play with them!!!!!!!!!!!";}
*/

switch(room)
{
	case rmServer: where = "hosting a server go play with them!!!!!!!!!!!"; break;
	case rmLobby: where = "on the lobby"; break;
	case rmLeveltransition: where = "level transitioning (I'm so proud)"; break; 
} 

if string_pos("Title", room_get_name(room)) != 0 {where = "on the title screen";}
if string_pos("Template", room_get_name(room)) != 0 {where = "playing on a template level... huh";}

switch(global.environment)
{
	case e.overworld: envspr = "ow"; break;
	case e.night: envspr = "ow"; break;
	case e.underground: envspr = "ug"; break;
	case e.underwater: envspr = "uw"; break;
	case e.castle: envspr = "cs"; break;
	case e.mushroom: envspr = "ms"; break;
	case e.snow: envspr = "sn"; break;
	case e.snowday: envspr = "sn"; break;
	
	default: envspr = "unknown";
}

