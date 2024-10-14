if !onview()
{exit;}

if c > 4 && mario_freeze() = 0
{
	{direction += 90;}
	c = 0;
}

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,image_alpha)
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,direction,c_white,image_alpha)
shader_reset()
