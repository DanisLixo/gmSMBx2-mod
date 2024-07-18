if !instance_exists(oLuigi) and instance_exists(oMario) {
	instance_create_depth(oMario.x+16,y+48,oMario.depth,oLuigi)
	instance_create_depth(oMario.x+16,y+48,oMario.depth-1,oBlow)
}