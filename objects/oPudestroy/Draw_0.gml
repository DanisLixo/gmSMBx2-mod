if !onview() {instance_destroy();}

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,1)
	draw_self();
shader_reset();

