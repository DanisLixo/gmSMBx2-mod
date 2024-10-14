if !onview()
{exit;}

switch(global.game) {
	case gm.SMB:
		sprite_index = sSpring;
	break;
	case gm.LL:
		sprite_index = sSpring_LL;
	break;
	case gm.ANN:
		sprite_index = sSpring_LL;
	break;
}

shader_set(shdColorswap)
	if layer_exists("Tiles_secret") {apply_palette(sPalette_tilesecret,global.environment+1,image_alpha)}
	else {apply_palette(sPalette_tilebrown,global.environment,image_alpha)}
	draw_self();
shader_reset();
//draw_text(x,y,SPRINGST);