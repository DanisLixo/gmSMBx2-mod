draw_self()

x = m.x
y = m.y-(sprite_get_height(m.spr)*0.5)*m.scale;

if image_index >= sprite_get_number(sprite_index)-1 
{image_index = sprite_get_number(sprite_index)-1;}