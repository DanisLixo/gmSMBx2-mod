if warper {
	if !global.warpzone {instance_destroy();}
	troom = rmLeveltransition;
	
	if instance_exists(oWarpobj) && instance_nearest(x,y,oWarpobj).activated {
		tworld = worldhold;
		activated = true;
		
		instance_destroy(oPiranha, false);
	
		var t = instance_create_depth(x,bbox_top-8,1,oText);
	
		t.center = true;
		t.text = string(tworld);
	}
}