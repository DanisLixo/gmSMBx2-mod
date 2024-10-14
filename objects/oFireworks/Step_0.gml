if image_index >= sprite_get_number(sprite_index)-1.5
{instance_destroy();}

var mariocol = collision_rectangle(bbox_left-2,bbox_top-2,bbox_right+2,bbox_bottom+2,oMario,false,true)

if ds && global.pvp && mariocol
{mariocol.gethit = 1;}