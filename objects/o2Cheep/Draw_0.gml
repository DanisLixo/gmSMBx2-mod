//if !onview() //and cheeptype < 2
//{exit;}

shader_set(shdColorswap);
if cheeptype = 1	{apply_palette(sPalette_nokonoko,global.environment,image_alpha); sprite_index = s1Cheep}
else				{apply_palette(sPalette_nokonoko_red,global.environment,image_alpha);}
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*facingdir,image_yscale,image_angle,image_blend,image_alpha)
shader_reset();

