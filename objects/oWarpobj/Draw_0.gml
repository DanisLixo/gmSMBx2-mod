var cx = camera_get_view_x(view_camera[0]);

if (cx + SCREENW) >= room_width {activated = true;}

if activated {
	draw_set_font(global.fnt);
		draw_text(bbox_right-string_width(text)/2,bbox_top,text);
	draw_set_font(-1);
}