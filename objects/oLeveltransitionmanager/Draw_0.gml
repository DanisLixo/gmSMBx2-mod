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

// P meter
if (oGame.savedpowerup = "c" || global.player = "Feathy") {
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sPmeter,0,tile+(tile*10)+cx,tile+cy)
		//draw_sprite(sPmeterbig,oMario.pind,(tile*5)+cx,(SCREENH-(240/2))+(tile*13)+cy)
	shader_reset();
}