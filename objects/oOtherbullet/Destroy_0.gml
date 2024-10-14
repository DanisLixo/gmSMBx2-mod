if onview() && myroom == room
{
	var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
	ins.image_xscale = 0.3
	ins.image_yscale = 0.3
	ins.image_alpha = global.onlinealpha;
	
	ins.x -= (sprite_width*0.3)/2
	ins.y -= (sprite_height*0.3)/2
	if global.pvp {ins.ds = true;}
}



