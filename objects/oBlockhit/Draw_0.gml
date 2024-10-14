y += vspd

vspd += 0.3

if y > ystart+2
{instance_destroy();}

if (global.environment = e.castle or global.environment = e.underground) && image_index = 0
{image_index = 1;}
if (global.environment != e.castle && global.environment != e.underground) && image_index = 1
{image_index = 0;}

switch(global.game) {
	case gm.SMB:
		sprite_index = sHitblock;
	break;
	case gm.LL:
		sprite_index = sHitblock_LL;
	break;
	case gm.ANN:
		sprite_index = sHitblock_LL;
	break;
}

shader_set(shdColorswap)
	if image_index = 1
	{apply_palette(sPalette_nokonoko,global.environment,image_alpha);}
	else
	{apply_palette(sPalette_goomba,global.environment,image_alpha);}


	draw_self();
shader_reset();







