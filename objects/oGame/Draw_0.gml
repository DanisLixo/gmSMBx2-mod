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
var tr = layer_get_id("RetroWPalette")
if layer_exists(tr)
{layer_script_begin(tr,retro_palswap);	layer_script_end(tr,tile_palreset);}

if room = rmServer
{exit;}

/// handle gui
draw_set_font(FNT)

var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])
var tile = 8;

// FPS
if global.showfps and room != rmTitle {draw_text(cx+(tile*3),cy+(tile*3),"FPS - " + string(fps) + "/" + string(room_speed))}

// Score
var scorestr = string(global.score)		
while (string_length(scorestr) < 6)	{scorestr = "0"+scorestr;}

if global.multiplayer {
	// MARIO and LUIGI
	var char = string_char_at(string_upper(global.player),1)
	draw_text((tile*3)+cx,tile+cy,char + "-" + scorestr)
	
	var p2_char = string_char_at(string_upper(global.playertwo),1)
	var p2_scorestr = string(global.p2_score)	while (string_length(p2_scorestr) < 6)	{p2_scorestr = "0"+p2_scorestr;}
	
	draw_text((tile*3)+cx,(tile*2)+cy,p2_char + "-" + p2_scorestr)

	// Coins
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sCoinicon,image_index,(tile*11)+cx,(tile)+cy)
		draw_sprite(sCoinicon,image_index,(tile*11)+cx,(tile*2)+cy)
	shader_reset();

	var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
	var p2_coinstr = string(global.p2_coins)	while (string_length(p2_coinstr) < 2)	{p2_coinstr = "0"+p2_coinstr;}
	draw_text((tile*12)+cx,(tile)+cy,"*"+coinstr)
	draw_text((tile*12)+cx,(tile*2)+cy,"*"+p2_coinstr)
	
	// Hats
	
	var coindist = string_length(coinstr) < 2? 1 : string_length(coinstr)-2;
	var p2_coindist = string_length(p2_coinstr) < 2? 1 : string_length(p2_coinstr)-2;
	
	if global.player = "Pokey" || global.player = "Gemaplys" || 
	global.playertwo = "Pokey" || global.playertwo = "Gemaplys" 
	{
		shader_set(shdColorswap);
			apply_palette(sPalette_goomba,global.environment,image_alpha)
			if global.player = "Pokey" or global.player = "Gemaplys" 
			{draw_sprite(sHaticon,image_index,(SCREENW-256)+(tile*(15+coindist))+cx,tile+cy);}
			if global.playertwo = "Pokey" or global.playertwo = "Gemaplys" 
			{draw_sprite(sHaticon,image_index,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy);}
		shader_reset();
		
		var hatstr = string(global.hats-instance_number(oHatThrow))
		if global.player = "Pokey" or global.player = "Gemaplys" {
			draw_text((SCREENW-256)+(tile*(16+coindist))+cx,tile+cy, "*" + hatstr);
		}
		if global.playertwo = "Pokey" or global.playertwo = "Gemaplys" {
			draw_text((SCREENW-256)+(tile*(16+p2_coindist))+cx,(tile*2)+cy, "*" + hatstr);
		}
		draw_set_font(FNT);
	}

	// P meter
	if instance_exists(oMario) and (oMario.powerup = "c" || global.player = "Feathy") || instance_exists(oLuigi) and
	(oLuigi.powerup = "c" || global.playertwo = "Feathy") {
		shader_set(shdColorswap);
			apply_palette(sPalette_gold,global.environment+1,image_alpha)
			if (oMario.powerup = "c" || global.player = "Feathy")
			{draw_sprite(sPmeter,global.pind,(SCREENW-256)+(tile*(15+coindist))+cx,tile+cy)}
			if instance_exists(oLuigi) {if (oLuigi.powerup = "c" || global.playertwo = "Feathy")
			{draw_sprite(sPmeter,global.p2_pind,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy)}}
			//draw_sprite(sPmeterbig,oMario.pind,(tile*5)+cx,(SCREENH-(240/2))+(tile*13)+cy)
		shader_reset();
	}	
}
else 
{
	// MARIO
	draw_text((tile*3)+cx,tile+cy,string_upper(global.player))
	
	// Score
	draw_text((tile*3)+cx,(tile*2)+cy,scorestr)

	// Coins
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sCoinicon,image_index,(tile*11)+cx,(tile*2)+cy)
	shader_reset();

	var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
	draw_text((tile*12)+cx,(tile*2)+cy,"*"+coinstr)
	
	// Hats
	if global.player = "Pokey" || global.player = "Gemaplys"
	{
		shader_set(shdColorswap);
			apply_palette(sPalette_goomba,global.environment,image_alpha)
			draw_sprite(sHaticon,image_index,(tile*11)+cx,tile+cy);
		shader_reset();
	
		var hatstr = string(global.hats-instance_number(oHatThrow))
		draw_text((tile*12)+cx,tile+cy, "*"+hatstr);
		
		draw_set_font(FNT);
	}

	// P meter
	if instance_exists(oMario) and (oMario.powerup = "c" || global.player = "Feathy") {
		shader_set(shdColorswap);
			apply_palette(sPalette_gold,global.environment+1,image_alpha)
			draw_sprite(sPmeter,global.pind,(tile*11)+cx,tile+cy)
		shader_reset();
	}	
}

// WORLD
var mptile = global.multiplayer? 4:2

if !global.challenge and !instance_exists(oIsArena) && room != rmTitle && room != rmLobby and room != rmDemoend
{
	draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile)+cy,"WORLD")
	if global.level != 0 
	{
		var level  = string(global.world)+"-"+string(global.level);
		if room = rmExtra or room = rmExtra_sky or room = rmExtra_under or global.extra 
		{draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile*2)+cy,"EXTRA")}
		else 
		{draw_text((SCREENW-(256/2))+(tile*mptile)+tile+cx,(tile*2)+cy,level)}
	}
}
if instance_exists(oIsArena)
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile)+cy,"GOAL")
	draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,(tile*2)+cy,global.goalofstars)
}
if global.challenge {
	draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile)+cy,"RETROED")
	draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*2)+cy,string(global.retros))
}

// Time
draw_text((SCREENW-(256/2))+(tile*9)+cx,(tile)+cy,"TIME")

if global.time >= 0 and room != rmLeveltransition and room != rmDemoend
{
	var timestr = string(round(global.time/(room_speed*TIMESEC)))
	while (string_length(timestr) < 3)	{timestr = "0"+timestr;}
	draw_text((SCREENW-(256/2))+(tile*10)+cx,(tile*2)+cy,timestr)


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
		draw_text((SCREENW-(256/2))+(tile*13)+cx,(tile*3)+cy,timestr)
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
	if (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter)) 
	&& global.chatfocus = false and !debug and !instance_exists(oPaused) and delay > 10
	{
		if !instance_exists(oClient) {instance_deactivate_all(true);} 
		instance_create_depth(0, 0, -999, oPaused); 
		sfx(sndPause,0);
		delay = 0;
	}
	if !instance_exists(oClient) {while !window_has_focus() {}} //LMAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
}
	
#endregion