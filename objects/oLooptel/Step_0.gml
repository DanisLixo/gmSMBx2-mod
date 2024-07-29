var m = instance_place(x,y,oMario);

if m {
	global.warpsound = false;
	
	if global.wwtrigger = true and warptrigger = false {
		//oMario.image_alpha = 0;
		instance_create_depth(oMario.x,oMario.bbox_top+8,depth,oBlow);
		if instance_exists(oLuigi) instance_create_depth(oLuigi.x,oLuigi.bbox_top+8,depth,oBlow);
		
		warptrigger = true;
		
		savedhspd = oMario.hspd;
		savedvspd = oMario.vspd;
		savedy = oMario.y+fd;
		saveddepth = oMario.depth;
	}
}

if warptrigger = true {
	oMario.depth = 600; oMario.vspd = 0; oMario.hspd = 0; oMario.y = -16;
	if i = 0 {sfx(sndBowserfire,3)}
	i++
	
	if oMario.x > x-warp {
		if i >= 60 {
			oMario.x -= 8;
			oCamera.x -= 8;
		}
	}
	else {
		alarm[0] = 1;
	}
}



