/// @self
/// @description Use for mimic NES sprite limitations, for some reason, it is applied for amount of enemies, not pixels. It goes unused.

function nes_flicker()
{
	var cx = camera_get_view_x(view_camera[0])
	
	var _list = ds_list_create();
	var _num = collision_line_list(cx,bbox_bottom-1,cx+SCREENW,bbox_bottom-1,oParenemy,true,true,_list,true)
	if _num >= 8
	{image_alpha = choose(0,1);}
	else
	{image_alpha = 1;}
	ds_list_destroy(_list);
	
}