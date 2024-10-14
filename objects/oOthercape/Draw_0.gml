if room != myroom || !onview()
{exit;}

if !instance_exists(oClient)
{instance_destroy();}

var yoff = 8;

shader_set(shdColorswap);
	apply_palette(sPalette_feathy,palette,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x,y+yoff,image_xscale,1,0,-1,image_alpha)
shader_reset()