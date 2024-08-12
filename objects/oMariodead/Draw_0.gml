//spr = ms("sMario_s_die")

shader_set(shdColorswap);
apply_palette(global.palettesprite,oMario.palindex,image_alpha)
	draw_sprite_ext(spr,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
shader_reset()
