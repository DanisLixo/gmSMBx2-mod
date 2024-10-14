if !instance_exists(oClient)
{instance_destroy();}

if room != myroom || !onview()
{exit;}

try {
	shader_set(shdColorswap)
		apply_palette(palspr,palette,image_alpha)
		draw_sprite_ext(spr,ind,x,y,image_xscale, abs(image_xscale),0,-1,image_alpha);
	shader_reset();
} catch(missingspr) {
	if !warning 
	{show_message("Someone maybe has a skin mod installed, it is recommended that you ask him for his mod. For now, he will be appering as SUPER FUCKING MARIO\nPlayer that caused error: " + string(username)); warning = true;}
	draw_sprite(superFUCKINGmario, 0, x, y)
}

if starman != 0
{
	gpu_set_fog(true,make_color_hsv((starman) mod 255,255,255),1,1);
	
	draw_sprite_ext(spr,ind,x,y,round(image_xscale),image_yscale,image_angle,image_blend,0.5)
	gpu_set_fog(false,-1,1,1);
	
	if starman mod 3 = 0 && starman > 120
	{var smsfx = instance_create_depth(x,y,depth+2,oOtherstarmanFX); smsfx.image_xscale = image_xscale; smsfx.col = make_color_hsv((starman) mod 255,255,255); smsfx.image_index = ind; smsfx.sprite_index = spr; smsfx.idd = id}
}

if instance_exists(debugtext) {draw_self()}

if sprite_get_height(spr) > 24 {sprite_index = sMariomask1;}
else {sprite_index = sMariomask0;}
draw_set_alpha(0.6);
draw_set_font(fntComic)
draw_set_halign(fa_center);
draw_text(x,bbox_top-16,username)
draw_set_halign(fa_left);
draw_set_font(-1);
draw_set_alpha(1);

image_yscale = abs(image_xscale)



if instance_exists(oIsArena)
{
	draw_set_color(c_orange);
	draw_set_font(global.fnt)
	draw_sprite_ext(sSuperstaricon,0,x-16,bbox_bottom,1,1,0,c_yellow,1);
	draw_text(x+8,bbox_bottom+6,mystars);
	draw_set_font(-1);
	draw_set_color(-1);
	

}