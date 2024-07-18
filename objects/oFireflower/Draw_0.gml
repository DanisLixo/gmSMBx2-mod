 if !onview()
{exit;}

if instance_nearest(x,y,oMario).char =  "Pokey" or instance_nearest(x,y,oMario).char =  "Gemaplys" {
shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,1)
	draw_sprite(sFireHat,0,x,y);
shader_reset();
}

else if instance_nearest(x,y,oMario).char = "Dawn" {
	draw_sprite(sFirebow,0,x,y);
}
else {
shader_set(shdColorswap)
	{
		if round(image_index) = 0
			{apply_palette(sPalette_goomba,global.environment,1);}
		if round(image_index) = 1
			{apply_palette(sPalette_nokonoko,global.environment,1);}
	draw_self()
shader_reset()
draw_sprite(sFireflower_stem,0,x,y);}
}







