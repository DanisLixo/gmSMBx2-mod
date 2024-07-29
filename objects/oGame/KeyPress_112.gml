if !instance_exists(oClient) {

	if !global.multiplayer and instance_exists(oMario) {
		instance_create_depth(oMario.x+16,oMario.y,oMario.depth,oLuigi)
		instance_create_depth(oMario.x+16,oMario.bbox_top+8,oMario.depth-1,oBlow)
		global.multiplayer = true;
	}
	else if global.multiplayer {
		if instance_exists(oLuigi) 
		{instance_create_depth(oLuigi.x,oLuigi.bbox_top+8,oMario.depth-1,oBlow)
		instance_destroy(oLuigi);}
		global.multiplayer = false;
		global.playertwo = "Luigi"
		p2savedpowerup = "s"
	}
}