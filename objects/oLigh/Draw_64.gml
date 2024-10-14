draw_set_font(global.fnt);
draw_set_halign(fa_center);
if show_text 
{draw_text(SCREENW/2, 24, "YOU HEARD HER...\n PUSH " + keycode_to_string(global.keya) + " TO GO BACK NOW!");}
draw_set_halign(-1);
draw_set_font(-1);