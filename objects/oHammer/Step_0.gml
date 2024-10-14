if mario_freeze()	
{image_speed = 0; exit;}

if throwed {
	vspd += 0.1
	c ++;

	x += 1.1*facingdir
	y += vspd
}
else if instance_exists(holder) {
	var yplus = (holder == oBowser)? 8: 4 
	x = holder.x
	y = holder.bbox_top-yplus
	
	if holder.state = es.die {throwed = true;}
}
if !instance_exists(holder) {throwed = true}