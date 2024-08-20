 /// handle gui
draw_set_font(FNT)

var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])
var tile = 8;

// FPS
if global.showfps {draw_text(cx+(tile*3),cy+(tile*3),"FPS - " + string(fps) + "/" + string(room_speed))}

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
		draw_sprite(sCoinicon,0,(tile*11)+cx,(tile)+cy)
		draw_sprite(sCoinicon,0,(tile*11)+cx,(tile*2)+cy)
	shader_reset();

	var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
	var p2_coinstr = string(global.p2_coins)	while (string_length(p2_coinstr) < 2)	{p2_coinstr = "0"+p2_coinstr;}
	draw_text((tile*12)+cx,(tile)+cy,"*"+coinstr)
	draw_text((tile*12)+cx,(tile*2)+cy,"*"+p2_coinstr)
	
	// Hats
	
	var coindist = string_length(coinstr) < 2? 1 : string_length(coinstr)-2;
	var p2_coindist = string_length(p2_coinstr) < 2? 1 : string_length(p2_coinstr)-2;
	shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,image_alpha)
		if global.player = "Pokey" or global.player = "Gemaplys" 
		{draw_sprite(sHaticon,0,(SCREENW-256)+(tile*(15+coindist))+cx,tile+cy);}
		if global.playertwo = "Pokey" or global.playertwo = "Gemaplys" 
		{draw_sprite(sHaticon,0,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy);}
	shader_reset();
	
	var hatstr = string(global.hats-instance_number(oHatThrow))
		if global.player = "Pokey" or global.player = "Gemaplys" {
			draw_text((SCREENW-256)+(tile*(16+coindist))+cx,tile+cy, "*" + hatstr);
		}
		if global.playertwo = "Pokey" or global.playertwo = "Gemaplys" {
			draw_text((SCREENW-256)+(tile*(16+p2_coindist))+cx,(tile*2)+cy, "*" + hatstr);
		}
	
	draw_set_font(FNT);

	// P meter
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		if (oGame.savedpowerup = "c" || global.player = "Feathy")
		{draw_sprite(sPmeter,global.pind,(tile*(15+coindist))+cx,tile+cy)}
		if (oGame.p2savedpowerup = "c" || global.playertwo = "Feathy")
		{draw_sprite(sPmeter,global.p2_pind,(tile*(15+p2_coindist))+cx,(tile*2)+cy)}
		//draw_sprite(sPmeterbig,oMario.pind,(tile*5)+cx,(SCREENH-(240/2))+(tile*13)+cy)
	shader_reset();
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
		draw_sprite(sCoinicon,0,(tile*11)+cx,(tile*2)+cy)
	shader_reset();

	var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
	draw_text((tile*12)+cx,(tile*2)+cy,"*"+coinstr)
	
	// Hats
	if global.player = "Pokey" || global.player = "Gemaplys"
	{
		shader_set(shdColorswap);
			apply_palette(sPalette_goomba,global.environment,image_alpha)
			draw_sprite(sHaticon,0,(tile*11)+cx,tile+cy);
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

if !global.challenge and !instance_exists(oIsArena)
{
	draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile)+cy,"WORLD")
	if global.level != 0 
	{
		var level  = string(global.world)+"-"+string(global.level);
		if global.extra 
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