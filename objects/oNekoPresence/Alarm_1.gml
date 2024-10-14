if instance_exists(oClient)
{
	np_setpresence(where, "playing online as "+global.playerName, envspr, "");
}
else if global.multiplayer = true
{
	np_setpresence(where, "P1: "+global.playerName+" | P2: "+global.playertwoName, envspr, "");
}
else if where = ""
{
	np_setpresence(where, "playing as "+global.playerName, envspr, "");
}
else
{
	np_setpresence(where, "playing as "+global.playerName, envspr, "");
}

alarm[1] = room_speed * 10