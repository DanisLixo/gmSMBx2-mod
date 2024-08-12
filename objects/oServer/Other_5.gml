SCREENW = savedw
SCREENH = savedh

camera_set_view_size(view_camera[0], SCREENW, SCREENH)
surface_resize(application_surface,SCREENW,SCREENH)
var scrsizemult = 3;
window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);