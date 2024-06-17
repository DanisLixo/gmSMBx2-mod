alarm[1] = -1
warned = 0

if global.insertclient = true && !instance_exists(oClient)
{instance_create_depth(x,y,depth,oClient); global.insertclient = false;}

if room = rmTitle
{
	savedpowerup = "s"; if instance_exists(oMario) {oMario.powerup = "s";}
	global.score = 0;
	global.time = -1;
	global.coins = 0;
	global.level = 1;
	
	audio_stop_sound(global.ch[0]);
	audio_stop_sound(global.ch[1]);
	audio_stop_sound(global.ch[2]);
	audio_stop_sound(global.ch[3]);
	audio_stop_sound(global.ch[4]);
}

triggercastleflag = false;
diec = 0;

if !instance_exists(oCamera)
{instance_create_depth(0,0,depth,oCamera);}


audio_sound_pitch(global.ch[0],pitch)
audio_sound_pitch(global.ch[1],pitch)
audio_sound_pitch(global.ch[2],pitch)
audio_sound_pitch(global.ch[3],pitch)
audio_sound_pitch(global.ch[4],pitch)
timeup = 0;

if instance_exists(oCheckpointmask) //room != rmTitle && room != rmServer && room != rmLobby && room != rmLeveltransition
{
	if spawnx = -1 && instance_exists(oMario) {spawnx = oMario.xstart;}
	else if spawnx != -1 && instance_exists(oMario) && oMario.state != ps.exitpipeup {oMario.x = spawnx;}
	if spawny = -1 && instance_exists(oMario) {spawny = oMario.ystart;}
	else if spawny != -1 && instance_exists(oMario) && oMario.state != ps.exitpipeup {oMario.y = spawny;}
}
else //if (room = rmTitle or room = rmServer or room = rmLobby or room = rmLeveltransition) 
{spawnx = -1; spawny = -1;}

curRoom = room;