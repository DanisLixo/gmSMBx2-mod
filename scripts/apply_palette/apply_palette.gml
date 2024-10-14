/// @function apply_palette
/// @description Change the palette of the sprite, it needs to be used before the draw_sprite() function
/// @param {Sprite Asset} [Palette Sprite] Sprite with the palette, it grabs at least a 4 colors palette
/// @param {Real} [Palette Index] Index with the color row to replace, replace the first color row with other row
/// @param {Float} [Alpha] Alpha to apply into the sprite.
function apply_palette(palspr,palind,alp)
{
	var ui; var uc;
	var ar0; var ar1;
	var palw = 0;
	if sprite_exists(palspr) {palw = sprite_get_width(palspr)-1;}
	
	try {
		for (var i = 0; i < palw; i ++;)
		{
			ui = shader_get_uniform(shdColorswap,"Index"+string(i));
			uc = shader_get_uniform(shdColorswap,"Color"+string(i));
		
			var ar0 = sprite_getpixel(palspr,0,i,0,true);
			var ar1 = sprite_getpixel(palspr,0,i,palind,true);
			
			ar0[3] = alp;
			ar1[3] = alp;
		
			shader_set_uniform_f_array(ui,ar0);
			shader_set_uniform_f_array(uc,ar1);
		}
	} catch(palerr) {
		show_message("Palette index or sprite does not exist, returning values to the last palette of the object: " + object_get_name(object_index));
		update_playerpalette();
		update_playerpalette(true);
		
		global.paletteindex = sprite_get_height(global.palettesprite)-1
		global.p2_paletteindex = sprite_get_height(global.p2_palettesprite)-1
		
	}
}