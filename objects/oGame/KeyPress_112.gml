if room == rm1_1
{
	if !instance_exists(oRecorder) instance_create_depth(0,0,depth,oRecorder);
	else instance_destroy(oRecorder)
}