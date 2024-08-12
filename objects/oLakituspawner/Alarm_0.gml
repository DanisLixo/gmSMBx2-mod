if !instance_exists(oLakitu) and oMario.x < oEndspawner.x {
	var lakitu = instance_create_layer(camera_get_view_x(view_camera[0])-60,y,"Instances",oLakitu)
	lakitu.goin = true;
}