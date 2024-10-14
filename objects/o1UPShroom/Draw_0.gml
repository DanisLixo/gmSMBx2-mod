if !onview()
{exit;}

switch(global.game) {
	case gm.SMB:
		sprite_index = s1UPShroom;
	break;
	case gm.LL:
		sprite_index = s1UPShroom_LL;
	break;
	case gm.ANN:
		sprite_index = s1UPShroom_LL;
	break;
}

shader_set(shdColorswap)
	apply_palette(sPalette_nokonoko,global.environment,1);
	draw_self()
shader_reset()









