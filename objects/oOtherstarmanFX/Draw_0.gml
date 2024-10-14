if !onview() 
{exit;}

if instance_exists(idd) && idd.myroom == room
{
	gpu_set_fog(true,col,1,1);
	draw_sprite_ext(sprite_index,image_index,x,y,round(image_xscale),image_yscale,image_angle,image_blend,image_alpha*2)
	gpu_set_fog(false,-1,1,1);
	
	//depth += 1000


}

image_alpha -= 0.02
if image_alpha < 0 
{instance_destroy();}
