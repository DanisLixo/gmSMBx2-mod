
if (demoRecord)
{
	draw_set_colour(c_red);
	draw_set_font(global.fnt);
	draw_circle(24,32,1,false);
	draw_text(32,32, string(demoRecordFrames));
	draw_set_colour(-1);
	draw_set_font(-1);
}
