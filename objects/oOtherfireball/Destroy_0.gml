if myroom == room {
	var expl = instance_create_depth(x-8,y-8,depth-1,oFireworks); 
	expl.image_speed *= 1.5; 
	expl.arrow = true; 
	expl.m = noone; 
	expl.image_alpha = image_alpha
	if global.pvp {expl.ds = true;}
}