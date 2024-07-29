shader_set(shdColorswap)
	apply_palette(sPalette_tilebrown,global.environment,image_alpha);
	draw_sprite_ext(sprite_index,-1,round(x),round(y),1,image_yscale,0,c_white,1);
shader_reset();