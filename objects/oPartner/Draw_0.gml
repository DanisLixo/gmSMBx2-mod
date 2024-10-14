draw_self();

if mario_freeze() == 1 && oPlayer.state != ps.die && oPlayer.state != ps.shrink 
{state = 5;}
else if mario_freeze() == 1 {state = 6;}
if state == 3 && image_index >= sprite_get_number(sAki_crouchstart)-1 
{crouching = true;}
if state != 3 {crouching = false;}
if crouching == false {sprite_index = sprites[state];}
else {sprite_index = ms("sMario_crouch", char);}

if starman != 0
{
	gpu_set_fog(true,make_color_hsv((starman) mod 255,255,255),1,1);
	draw_sprite_ext(sprite_index,image_index,x,y,round(image_xscale),image_yscale,image_angle,image_blend,0.5);
	gpu_set_fog(false,-1,1,1);
	
	if starman mod 3 = 0 && starman > 120
	{var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); smsfx.image_xscale = image_xscale; smsfx.col = make_color_hsv((starman) mod 255,255,255); smsfx.image_index = image_index; smsfx.sprite_index = sprite_index;}
}