if global.multiplayer and instance_number(oMario) < 2
{
	var m = instance_exists(oLuigi)? instance_create_depth(oMario.x,oMario.y,oMario.depth,oMario) : instance_create_depth(oMario.x,oMario.y,oMario.depth,oLuigi);
	instance_create_depth(m.x,m.y,m.depth-1,oBlow);
	m.vspd = -4
}