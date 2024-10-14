if !instance_exists(oClient)
{instance_destroy();}

if room != myroom || !global.schutmode || !onview()
{exit;}



try {draw_self();} 
catch(missingspr) {
	if !warning 
	{show_message("Someone maybe has a skin mod installed, it is recommended that you ask him for his mod."); warning = true;}
	draw_sprite_ext(sGun_Default, image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
