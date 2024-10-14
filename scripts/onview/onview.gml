/// @self
/// @description Returns if the object is inside the camera's range.
function onview()
{
	if global.sync {return true}
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var tile = object_index = oBowser? 8 : 16
	if bbox_right+tile > cx && bbox_left-tile < cx+SCREENW && bbox_bottom+tile > cy && bbox_top-tile < cy+SCREENH
	{return true;}
	return false;
}