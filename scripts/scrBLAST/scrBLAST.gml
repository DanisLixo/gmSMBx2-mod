/// @function BLAST
/// @description Used for Anton, it will creates an explosion effect on the object after Anton touches it.
function BLAST()
{
	if instance_nearest(x,y,oMario).char = "Anton"
	{
		var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
		ins.image_xscale = 0.2
		ins.image_yscale = 0.2
	
		ins.x -= (sprite_width*0.2)/2
		ins.y -= (sprite_height*0.2)/2
	}
}