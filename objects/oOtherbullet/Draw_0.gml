if !instance_exists(oClient)
{instance_destroy();}

if room != myroom || !onview()
{exit;}

try {draw_self();} 
catch(missingspr) 
{draw_sprite_ext(sBullet_Default, image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);}