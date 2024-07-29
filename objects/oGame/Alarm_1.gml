global.level += 1;
room_goto(rmLeveltransition)

if global.level != 0 && global.race = true
{
	if instance_exists(oRacemanager) 
	{instance_destroy(oRacemanager);}
}
if room = rmExtra_under || global.challenge
	{
		if instance_exists(oClient) {room_goto(rmLobby); global.challenge = false;}
		else {room_goto(rmTitle)}
	 }