if !onview() and goin = false {
	if goaway = true {instance_destroy();}
	else {exit;}
}

shader_set(shdColorswap);
	apply_palette(sPalette_nokonoko,global.environment,image_alpha)
	draw_self();
shader_reset();

image_xscale = sign(facingdir)