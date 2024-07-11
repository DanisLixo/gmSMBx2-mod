shader_set(shdColorswap);
apply_palette(sPalette_background,global.environment,image_alpha)
draw_sprite_tiled_ext(global.letterboxSprite, 0, 0, 0, 1, 1, c_white, 1)
shader_reset();