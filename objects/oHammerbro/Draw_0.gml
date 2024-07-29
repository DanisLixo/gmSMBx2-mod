
shader_set(shdColorswap);
	apply_palette(sPalette_nokonoko,global.environment,image_alpha)
	draw_sprite_ext(spr,-1,x,y,image_xscale*facingdir,image_yscale,0,image_blend,image_alpha)
shader_reset()

if !onview()
{exit;}

