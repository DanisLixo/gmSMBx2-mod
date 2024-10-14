if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,image_alpha)

	if bstate >= 0 {draw_sprite(sprite_index,image_index,x,y);}
	else {draw_sprite_ext(sprite_index,image_index,x,y+8,image_xscale,image_yscale,0,-1,image_alpha);}

shader_reset();

