collide();

if counter == 0 {image_index = 0;}
if counter == 1
{
	with (m) {
		x = other.x;
		oCamera.x = x;
		y = other.bbox_top+2;
		state = -1;
		spr = ms("sMario_{}_idle");
	}
	
	if abs(hspd) < 4 {hspd += 0.2*g;}
	
	if instance_place(x+hspd,y,oCol) {instance_destroy();}
	if m.kjp {counter = 2; g = -1; instance_destroy()}
}

image_xscale = g