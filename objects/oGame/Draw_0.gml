depth = dep;


// handle tile palette
var tbr = layer_get_id("Tiles_brown")
if layer_exists(tbr)
{layer_script_begin(tbr,tile_brownpalswap);	layer_script_end(tbr,tile_palreset);  dep = layer_get_depth(tbr)-1}
var tgr = layer_get_id("Tiles_green")
if layer_exists(tgr)
{layer_script_begin(tgr,tile_greenpalswap);	layer_script_end(tgr,tile_palreset);}
var tbl = layer_get_id("Tiles_blue")
if layer_exists(tbl)
{layer_script_begin(tbl,tile_bluepalswap);	layer_script_end(tbl,tile_palreset);}
var tbg = layer_get_id("Background")
if layer_exists(tbg)
{layer_script_begin(tbg,bg_palswap);	layer_script_end(tbg,tile_palreset);}

if room = rmServer
{exit;}

/// handle gui
draw_set_font(FNT)

var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])

// MARIO
var tile = 8;
draw_text((tile*2)+tile+cx,tile+cy,string_upper(global.player))


// Score
var scorestr = string(global.score)		while (string_length(scorestr) < 6)	{scorestr = "0"+scorestr;}
draw_text((tile*2)+tile+cx,tile+tile+cy,scorestr)

if global.showfps = true {
	if !instance_exists(oClient) {draw_text(cx+(tile*3),cy+tile*2+tile,"FPS - "+string(fps));}
	else {draw_text(cx+(tile*3),cy+tile*3+tile,"FPS - "+string(fps));}
}

if global.challenge {
	draw_text(cx+(tile*2),cy+tile*5+tile,"RETROED - "+string(global.retros));
}

// Coins
shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite(sCoinicon,image_index,tile+(tile*10)+cx,tile+tile+cy)
shader_reset();

var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
draw_text((tile*2)+(tile*10)+cx,tile+tile+cy,"*"+coinstr)

// WORLD
//draw_text((SCREENW/2)+(tile*2)+cx,cy+tile,"WORLD")
//draw_text((SCREENW/2)+(tile*2)+tile+cx,cy+tile+tile,"1-"+string(global.level))

// Hats
if global.player = "Pokey" or global.player = "Gemaplys" {
	shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,image_alpha)
		draw_sprite(sHaticon,image_index,tile+(tile*10)+cx,tile+cy)
	shader_reset();
	
	var hatstr = string(hats-instance_number(oHatThrow))
	draw_set_font(FNT);
	draw_text((tile*2)+(tile*10)+cx,tile+cy, "*" + hatstr);
}

// P meter
if instance_exists(oMario) and (oMario.powerup = "c" || global.player = "Feathy") {
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sPmeter,oMario.pind,tile+(tile*10)+cx,tile+cy)
		//draw_sprite(sPmeterbig,oMario.pind,(tile*5)+cx,(SCREENH-(240/2))+(tile*13)+cy)
	shader_reset();
}


if !instance_exists(oIsArena) && room != rmTitle && room != rmLobby and room != rmDemoend
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile,"WORLD")
	if global.level != 0 
	{
		if room = rmExtra or room = rmExtra_sky or room = rmExtra_under or extra {draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile+tile,"EXTRA")}
		else {draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,cy+tile+tile,string(global.world)+"-"+string(global.level))}
	}
}
if instance_exists(oIsArena)
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile,"GOAL")
	{draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,cy+tile+tile,global.goalofstars)}
}

// Time
//draw_text((SCREENW/2)+(tile*2)+(tile*7)+cx,cy+tile,"TIME")
draw_text((SCREENW-(256/2))+(tile*2)+(tile*7)+cx,cy+tile,"TIME")

if global.time >= 0 and room != rmLeveltransition and room != rmDemoend
{
	var timestr = string(round(global.time/(room_speed*TIMESEC)))		while (string_length(timestr) < 3)	{timestr = "0"+timestr;}
	//draw_text((SCREENW/2)+(tile*2)+(tile*8)+cx,cy+tile+tile,timestr)
	draw_text((SCREENW-(256/2))+(tile*2)+(tile*8)+cx,cy+tile+tile,timestr)


	if instance_exists(oRacemanager) && global.race = true
	{
		var mm = string(oRacemanager.minutes);
		var ss = string(oRacemanager.seconds);
		var mls = string(oRacemanager.milliseconds);
		
		
		while (string_length(mm) < 2)	{mm = "0"+mm;}
		while (string_length(ss) < 2)	{ss = "0"+ss;}
		while (string_length(mls) < 3)	{mls = "0"+mls;}
		
		timestr = mm+":"+ss+":"+mls;
		
		draw_set_halign(fa_right);
		//draw_text((SCREENW/2)+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
		draw_text((SCREENW-(256/2))+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
		draw_set_halign(fa_left);
	}
}




if global.race = true && instance_exists(oRacemanager)
{
	draw_set_font(fntComic)
	
	var relist = ds_grid_create(ds_grid_width(global.racepos),ds_grid_height(global.racepos))
	
	ds_grid_copy(relist,global.racepos)
	
	ds_grid_sort(relist,0,true);
		
	for (var i = 0; i < ds_grid_height(relist); i++;)
	{
		if relist[# 0,i] > 0
		{
			if i = 1		{draw_set_color(c_yellow);}
			else if i = 2	{draw_set_color(c_ltgrey);}
			else if i = 3	{draw_set_color(c_maroon);}
			else			{draw_set_color(c_white);}
			
			var timestr = string(relist[# 1,i])
			draw_set_font(fntComic)
			draw_text(cx+(tile*2),cy+tile*3+tile*3+(16*i),timestr + " - " + string(relist[# 2,i]))
		}
	}
	draw_set_font(-1);
	draw_set_color(-1);
	
	ds_grid_destroy(relist);
}

draw_set_font(-1);

#region //Pause gui

var cx = 0; cy = 0;
var tile = 8

//Cant keep the scary cuz bad game design
if debug && instance_exists(oPaused) {destroy ++; 
	if destroy%12 = 0 && global.environment != e.snow {global.environment++;} else if destroy%12 = 0 && global.environment = e.snow {global.environment = -1;} 
	if destroy = 100 {game_end()}}
	
if destroy > 0 {debug = true; instance_create_depth(x,y,depth,oPaused); 
	audio_stop_all();
	global.time = random(10000); 
	global.score = random(10000);
	global.player = "Oh no...";
	global.world = random(8);
	global.level = random(8);
	global.coins = random(99);
	global.showfps = false;
	global.showpfp = false;} 
	
	if delay < 11 {delay++}
	
if room != rmTitle and room != rmServer and room != rmLeveltransition and triggercastleflag = false
{
	if (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter)) && global.chatfocus = false and !debug and !instance_exists(oPaused) and delay > 10
	{if !instance_exists(oClient) {instance_deactivate_all(true);} instance_create_depth(0, 0, -999, oPaused); sfx(sndPause,0); delay = 0;}
}
	
#endregion