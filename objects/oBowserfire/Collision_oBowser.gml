if image_xscale = -1 
{
	instance_place(x,y,oBowser).life -= 1
	instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5;
	instance_place(x-8,y-8,oFireworks).arrow = false
	instance_destroy()
}


