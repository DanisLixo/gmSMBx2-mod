
if room != rmServer
{
	if instance_exists(oClient)
	{
		np_setpresence(where, "playing online as "+global.player, envspr, "");
	}
	else if global.multiplayer = true
	{
		np_setpresence(where, "P1: "+global.player+" | P2: "+global.playertwo, envspr, "");
	}
	else
	{
		np_setpresence(where, "playing as "+global.player, envspr, "");
	}

	
	alarm[1] = room_speed * 10
}