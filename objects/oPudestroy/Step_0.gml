if sprite_index != sFeather || sprite_index == sFeather && vspd < 0 
{vspd += 0.15;}
if sprite_index == sFeather && vspd >= 0 {instance_create_depth(x,y,depth-1, oBlow); instance_destroy();}

x += hspd;
y += vspd;

if sprite_index == sFireflower_wooble 
{
	c++;
	if c == 4 
	{image_angle += 90; c = 0;}
}
if sprite_index != sFireHat_throw
{
	c++;
	if c == 2 
	{image_angle += 45; c = 0;}
}