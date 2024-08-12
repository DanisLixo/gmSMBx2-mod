 /// handle gui
draw_set_font(FNT)

var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])
var tile = 8;

// Coins
shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite(sCoinicon,0,tile+(tile*10)+cx,tile+tile+cy)
shader_reset();

var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
draw_text((tile*2)+(tile*10)+cx,tile+tile+cy,"*"+coinstr)

// P meter
if (oGame.savedpowerup = "c" || global.player = "Feathy") {
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sPmeter,0,tile+(tile*10)+cx,tile+cy)
		//draw_sprite(sPmeterbig,oMario.pind,(tile*5)+cx,(SCREENH-(240/2))+(tile*13)+cy)
	shader_reset();
}

// MARIO
var tile = 8;
draw_text((tile*2)+tile+cx,tile+cy,string_upper(global.player))


// Score
var scorestr = string(global.score)		while (string_length(scorestr) < 6)	{scorestr = "0"+scorestr;}
draw_text((tile*2)+tile+cx,tile+tile+cy,scorestr)

if global.showfps = true and room != rmTitle {
	if !instance_exists(oClient) {draw_text(cx+(tile*3),cy+tile*2+tile,"FPS - "+string(fps));}
	else {draw_text(cx+(tile*3),cy+tile*3+tile,"FPS - "+string(fps));}
}

// WORLD
//draw_text((SCREENW/2)+(tile*2)+cx,cy+tile,"WORLD")
//draw_text((SCREENW/2)+(tile*2)+tile+cx,cy+tile+tile,"1-"+string(global.level))

// Hats
if global.player = "Pokey" or global.player = "Gemaplys" {
	shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,image_alpha)
		draw_sprite(sHaticon,image_index,tile+(tile*10)+cx,tile+cy)
	shader_reset();
	
	var hatstr = string(global.hats-instance_number(oHatThrow))
	draw_set_font(FNT);
	draw_text((tile*2)+(tile*10)+cx,tile+cy, "*" + hatstr);
}

if !instance_exists(oIsArena) && room != rmTitle && room != rmLobby and room != rmDemoend
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile,"WORLD")
	if global.level != 0 
	{
	if room = rmExtra or room = rmExtra_sky or room = rmExtra_under or global.extra {draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile+tile,"EXTRA")}
	else {draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,cy+tile+tile,string(global.world)+"-"+string(global.level))}
	}
}

// Time
//draw_text((SCREENW/2)+(tile*2)+(tile*7)+cx,cy+tile,"TIME")
draw_text((SCREENW-(256/2))+(tile*2)+(tile*7)+cx,cy+tile,"TIME")