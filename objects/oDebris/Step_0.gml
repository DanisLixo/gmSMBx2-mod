x += hspd;
y += vspd;

vspd += 0.3;

if instance_place(x,bbox_bottom,oMario) and instance_place(x,bbox_bottom,oMario).char = "Syobon" 
and global.abilities
{instance_place(x,bbox_bottom,oMario).gethit = 1; vspd = -4; hspd = -hspd}

/*
counter ++

if counter mod 10 = 0
{
	image_angle -= 90
	image_angle = round(image_angle/90)*90
}
