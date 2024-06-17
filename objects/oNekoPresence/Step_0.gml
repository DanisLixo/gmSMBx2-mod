/// @description Update NekoPresence so async events will execute.

np_update();

if global.level != 0
{
	if instance_exists(oRacemanager)	{where = "racing on "+string(global.world)+"-"+string(global.level);}
	else								{where = "gaming on "+string(global.world)+"-"+string(global.level);}
}
else
{
	where = "dumbass programming shit but forgot the rich presence message, here's some random message instead" //"this person broke the game and i don't know where they are so here's debug message"
}
if room = rmTitle	{where = "on the title screen";}
if room = rmLobby	{where = "on the lobby";}


switch(global.environment)
{
	case e.overworld: envspr = "ow"; break;
	case e.underground: envspr = "ug"; break;
	case e.underwater: envspr = "uw"; break;
	case e.castle: envspr = "cs"; break;
	case e.mushroom: envspr = "ms"; break;
	case e.snow: envspr = "sn"; break;
	
	default: envspr = "unknown";
}

