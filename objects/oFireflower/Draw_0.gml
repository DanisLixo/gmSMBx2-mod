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
else if instance_nearest(x,y,oMario).char = "Max_Verstappen" {
	draw_sprite(sTire,0,x,y);
}
else if float {
	shader_set(shdColorswap)
		if round(image_index) = 0
			{apply_palette(sPalette_goomba,global.environment,1);}
		if round(image_index) = 1
			{apply_palette(sPalette_nokonoko,global.environment,1);}
		draw_sprite_ext(sFireflower_wooble,image_index,x,y-8,1,1,image_angle,c_white,image_alpha);
	shader_reset()
	if image_alpha%0.4 = 0 || image_alpha%0.4 = 0.2 {image_angle += 90*-g}
	image_alpha -= 0.025
	g = -sign(feathy.x - x);
	gspd = 2;
	vspd = 0
	moving = true;
	if image_alpha < 0 {instance_destroy()}
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







