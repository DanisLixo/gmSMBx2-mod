if instance_number(oMario) < 2 and instance_exists(oLuigi) {
	instance_create_depth(oMario.x+16,oMario.y-16,oMario.depth,oMario)
	instance_create_depth(oMario.x+16,oMario.y-16,oMario.depth-1,oBlow)
}