draw_set_font(font);

event_user(0);

for (line = 0; line < ds_list_size(debuglist); line++) {
	var text = string(debuglist[| line]);
	
	var charlimit = (string_length(text) > 20)? 1-((string_length(text)-20)*0.025) : 1
    draw_text_transformed(24, 8*(line + 4), text, charlimit, 1, 0);
}

if line == ds_list_size(debuglist) {ds_list_clear(debuglist)}

if warning > 0 {
	warning--;
	
	draw_set_alpha(warning/100)
	draw_text(24,SCREENH-16,"VARIABLES READING PROBLEMS, TRYING TO REDO IT")
	draw_set_alpha(1)
}