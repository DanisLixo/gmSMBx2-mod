if !onview() and (oMario.x > x+SCREENW || oMario.x < x-SCREENW)
{instance_destroy();}

if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*facingdir,image_yscale,image_angle,image_blend,image_alpha)
shader_reset();

