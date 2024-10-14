depth = dep;

// handle tile palette
var tbr = layer_get_id("Tiles_brown")
if layer_exists(tbr)
{layer_script_begin(tbr,tile_brownpalswap);	layer_script_end(tbr,tile_palreset); dep = layer_get_depth(tbr)-1}

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

switch(global.game) {
	case gm.SMB:
		global.fnt = FNT_SMB;
		var btile_id = layer_tilemap_get_id(tbr); tilemap_tileset(btile_id, tileBrown);
		var gtile_id = layer_tilemap_get_id(tgr); tilemap_tileset(gtile_id, tileGreen);
		var bltile_id = layer_tilemap_get_id(tbl); tilemap_tileset(bltile_id, tileBlue);
	break
	case gm.LL:
		global.fnt = FNT_LL;
		var btile_id = layer_tilemap_get_id(tbr); tilemap_tileset(btile_id, tileBrown_LL);
		var gtile_id = layer_tilemap_get_id(tgr); tilemap_tileset(gtile_id, tileGreen_LL);
		var bltile_id = layer_tilemap_get_id(tbl); tilemap_tileset(bltile_id, tileBlue_LL);
	break
	case gm.ANN:
		global.fnt = FNT_LL;
		var btile_id = layer_tilemap_get_id(tbr); tilemap_tileset(btile_id, tileBrown_LL);
		var gtile_id = layer_tilemap_get_id(tgr); tilemap_tileset(gtile_id, tileGreen_LL);
		var bltile_id = layer_tilemap_get_id(tbl); tilemap_tileset(bltile_id, tileBlue_LL);
	break
}

if room = rmServer
{exit;}

game_hud();

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
if debug && instance_exists(oPaused) 
{
	destroy++; 
	if destroy%12 = 0 && global.environment != e.snow 
	{global.environment++;} 
	else if destroy%12 = 0 && global.environment = e.snow 
	{global.environment = -1;} 
	if destroy = 100 
	{game_end()}
}
	
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
	
if string_pos("Title",room_get_name(room)) == 0 and room != rmServer and room != rmLeveltransition and triggercastleflag = false
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