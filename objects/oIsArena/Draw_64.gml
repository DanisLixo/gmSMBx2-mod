if win >= 0 
{
	draw_set_halign(fa_center);
	draw_set_font(global.fnt);
	draw_text(SCREENH/2,SCREENW/2,"ROUND IS OVER\nTHE WINNER IS: "+ string_upper(winner));
}