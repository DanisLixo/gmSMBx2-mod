if !instance_exists(oClient)
{instance_destroy();}

if room != myroom || !onview()
{exit;}

image_alpha = global.onlinealpha

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,1)
	draw_self();
shader_reset();

