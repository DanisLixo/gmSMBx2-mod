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

// Coins
shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite(sCoinicon,0,tile+(tile*10)+cx,tile+tile+cy)
shader_reset();

var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
draw_text((tile*2)+(tile*10)+cx,tile+tile+cy,"*"+coinstr)

// WORLD
//draw_text((SCREENW/2)+(tile*2)+cx,cy+tile,"WORLD")
//draw_text((SCREENW/2)+(tile*2)+tile+cx,cy+tile+tile,"1-"+string(global.level))

if !instance_exists(oIsArena) && room != rmTitle && room != rmLobby
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile,"WORLD")
	if global.level != 0 
	{
		if oGame.extra {draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile+tile,"EXTRA")}
		else {draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,cy+tile+tile,string(global.world)+"-"+string(global.level))}
	}
}
//draw_text((SCREENW/2)+(tile*2)+(tile*7)+cx,cy+tile,"TIME")
draw_text((SCREENW-(256/2))+(tile*2)+(tile*7)+cx,cy+tile,"TIME")