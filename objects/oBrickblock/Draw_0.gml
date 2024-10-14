if !instance_exists(oIsArena)
{
	if !onview()
	{exit;}
}

event_inherited()

if blockstate != -1 {
	switch(global.game) {
		case gm.SMB:
			sprite_index = sBrickblock;
		break;
		case gm.LL:
			sprite_index = sBrickblock_LL;
		break;
		case gm.ANN:
			sprite_index = sBrickblock_LL;
		break;
	}
}

shader_set(shdColorswap)
	if layer_exists("Tiles_secret") {apply_palette(sPalette_tilesecret,global.environment+1,image_alpha)}
	else {apply_palette(sPalette_tilebrown,global.environment,image_alpha)}
	draw_self();
shader_reset();
