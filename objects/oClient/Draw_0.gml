draw_set_font(global.fnt);

if latency > 200 && instance_exists(oMario) 
{draw_text(oMario.x, oMario.bbox_top - 8, "UNSTABLE!!!")}
draw_set_font(-1);