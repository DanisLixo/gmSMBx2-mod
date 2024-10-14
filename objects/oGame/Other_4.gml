if spawnx != -2 {
	global.level_score = global.score;
	global.level_coins = global.coins;
	global.level_p2_score = global.p2_score;
	global.level_p2_coins = global.p2_coins;
} else {
	var _score_subs = global.score - global.level_score;
	var _coins_subs = global.coins - global.level_coins;
	var _p2_score_subs = global.p2_score - global.level_p2_score;
	var _p2_coins_subs = global.p2_coins - global.level_p2_coins;
	
	global.score -= _score_subs;
	global.coins -= _coins_subs;
	global.p2_score -= _p2_score_subs;
	global.p2_coins -= _p2_coins_subs;
}

if global.aspectratio = "ROOM WIDTH" && !instance_exists(oClient) {
	SCREENW = room_width;
	camera_set_view_size(view_camera[0], SCREENW, SCREENH);
	surface_resize(application_surface,SCREENW,SCREENH);
	var scrsizemult = (room_width > display_get_width()/4.5)? 2-((room_width-display_get_width())*0.001) : 2;
	window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
	window_center()
}
if instance_exists(oClient) {global.aspectratio = "WIDESCREEN"}

if global.musicchannels {audio_group_load(classic);} else {audio_group_unload(classic);}

alarm[1] = -1

if global.player = "Gemaplys" {sfx(sndVineboom,4)}

if global.multiplayer and instance_exists(oMario) and room != rmTitle {
	if oMario.state = ps.exitpipeup {instance_create_depth(oMario.x,oMario.y,oMario.depth,oLuigi)}
	else {instance_create_depth(oMario.x+16,oMario.y,oMario.depth,oLuigi)}
	oLuigi.state = oMario.state
}

if global.insertclient = true && !instance_exists(oClient)
{instance_create_depth(x,y,depth,oClient); global.insertclient = false;}

if instance_exists(oClient) and instance_exists(oMario) {oMario.invincible = room_speed*4;}

if room == global.titleroom && string_pos("Title",room_get_name(global.titleroom)) == 0
{global.titleroom_selected = 0; savesettings();  room_goto(rmTitle_new)}

triggercastleflag = false;
diec = 0;

if !instance_exists(oCamera)
{instance_create_depth(0,0,depth,oCamera);}

timeup = 0;
if warned == 2 || room = rmLeveltransition || string_pos("Title",room_get_name(room)) != 0 
{warned = false;}

if instance_exists(oCheckpointmask) //room != rmTitle && room != rmServer && room != rmLobby && room != rmLeveltransition
{
	if spawnx <= -1 && instance_exists(oMario) {spawnx = oMario.xstart;}
	else if spawnx > -1 && instance_exists(oMario) && oMario.state != ps.exitpipeup {oMario.x = spawnx; if instance_exists(oLuigi) {oLuigi.x = spawnx+16}}
	if spawny <= -1 && instance_exists(oMario) {spawny = oMario.ystart;}
	else if spawny > -1 && instance_exists(oMario) && oMario.state != ps.exitpipeup {oMario.y = spawny; if instance_exists(oLuigi) {oLuigi.y = spawny}}
}
else //if (room = rmTitle or room = rmServer or room = rmLobby or room = rmLeveltransition) 
{spawnx = -1; spawny = -1; global.killenys = false;}

if global.challenge = true and !audio_is_playing(musChallenge) {
	global.curbgm = "Challenge"
	bgm(global.curbgm, true);
}
if global.challenge = false {
	global.retros = 0
}

if string_pos("Secret",room_get_name(room)) != 0 && found_secret[global.world] == false
{instance_create_depth(x,y,depth,oSecrettext); found_secret[global.world] = true;} 

if room == rmTitle {room_goto(global.titleroom)}

if global.enemiesrain && (string_pos(string(global.world)+"_"+string(global.level), room_get_name(room)) != 0 || global.extra)
{instance_create_depth(0,0,0,oSpawner)}