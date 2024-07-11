 shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,1)
	if !instance_exists(oHatThrow) {draw_self()}
shader_reset();

