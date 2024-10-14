// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function debug_nearest(obj){
	var mariox = 0;
	var marioy = 0;
	
	if instance_exists(oMario) {
		mariox = oMario.x;
		marioy = oMario.y;
	}
	
	return instance_nearest(mariox, marioy, obj)
}