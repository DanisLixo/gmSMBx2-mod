if global.aspectratio = "ROOM WIDTH" && !instance_exists(oClient) {
	SCREENW = room_width;
	camera_set_view_size(view_camera[0], SCREENW, SCREENH);
	surface_resize(application_surface,SCREENW,SCREENH);
	var scrsizemult = (room_width > display_get_width())? 2-((room_width-display_get_width())*0.001) : 2;
	window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
	window_center()
}
if instance_exists(oClient) {global.aspectratio = "WIDESCREEN"}

alarm[1] = -1
warned = false;

if global.player = "Gemaplys" {sfx(sndVineboom,4)}
if global.multiplayer and instance_exists(oMario) {
	if oMario.state = ps.exitpipeup {instance_create_depth(oMario.x,oMario.y,oMario.depth,oLuigi)}
	else {instance_create_depth(oMario.x+16,oMario.y,oMario.depth,oLuigi)}
	oLuigi.state = oMario.state
}

if global.insertclient = true && !instance_exists(oClient)
{instance_create_depth(x,y,depth,oClient); global.insertclient = false;}

if instance_exists(oClient) and instance_exists(oMario) {oMario.invincible = room_speed*4;}

if room = rmTitle
{
	savedpowerup = "s"; if instance_exists(oMario) {oMario.powerup = "s";}
	p2savedpowerup = "s"; if instance_exists(oLuigi) {oLuigi.powerup = "s";}
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

pitch = 1
audio_sound_pitch(global.ch[0],pitch)
audio_sound_pitch(global.ch[1],pitch)
audio_sound_pitch(global.ch[2],pitch)
audio_sound_pitch(global.ch[3],pitch)
audio_sound_pitch(global.ch[4],pitch)
timeup = 0;

if instance_exists(oCheckpointmask) //room != rmTitle && room != rmServer && room != rmLobby && room != rmLeveltransition
{
	if spawnx = -1 && instance_exists(oMario) {spawnx = oMario.xstart;}
	else if spawnx != -1 && instance_exists(oMario) && oMario.state != ps.exitpipeup {oMario.x = spawnx; if instance_exists(oLuigi) {oLuigi.x = spawnx+16}}
	if spawny = -1 && instance_exists(oMario) {spawny = oMario.ystart;}
	else if spawny != -1 && instance_exists(oMario) && oMario.state != ps.exitpipeup {oMario.y = spawny; if instance_exists(oLuigi) {oLuigi.y = spawny}}
}
else //if (room = rmTitle or room = rmServer or room = rmLobby or room = rmLeveltransition) 
{spawnx = -1; spawny = -1; global.killenys = false;}

if global.world >= 6 and global.level >= 1 /*and not instance_exists(oClient)*/ {
	room_goto(rmDemoend)
	global.world = 0; global.level = 0;
}

if global.challenge = true and !audio_is_playing(musChallenge) {
	global.curbgm = "Challenge"
	bgm(global.curbgm, true);
}
if global.challenge = false {
	global.retros = 0
}