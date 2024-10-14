if instance_exists(oOtherplayer) {
	global.prevroom = room;
	global.spectate = !global.spectate;
	if !global.spectate 
	{room_goto(global.prevroom); loadscreen = 0; global.prevroom = -1}
}