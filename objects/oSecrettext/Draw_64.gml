draw_set_font(font);
draw_set_halign(fa_center);
	draw_text(text_x,text_y,text);
draw_set_font(-1);
draw_set_halign(-1);

c++

if c > 4 {
	text_x += pos;
	
	c = 0;
	pos = -pos
}

timer_goaway--;

if timer_goaway > 0 {
	if text_y > SCREENH-16 {text_y--;}
}
else {if text_y < SCREENH+8 {text_y += 0.25;}}