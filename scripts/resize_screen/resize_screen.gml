/// @self
/// @description Resizes the screen to the selected resolution option.
function resize_screen()
{
	var scrsizemult = 3;
	window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
	surface_resize(application_surface,SCREENW,SCREENH);
	camera_set_view_size(view_camera[0], SCREENW, SCREENH)
}