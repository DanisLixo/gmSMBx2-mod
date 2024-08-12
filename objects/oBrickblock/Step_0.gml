event_inherited();

var m = collision_rectangle(bbox_left-2,bbox_bottom,bbox_right+2,SCREENH,oMario,false,true)

if m {
	if m.char = "Syobon" and global.abilities and fallchance <= 20 {
		falling = true;
	}
}

if falling {
	if vspd < 3 {vspd += 0.2;}
	
	if instance_place(x,y,oMario) {instance_place(x,y,oMario).gethit = 1; triggerbreak = true}
	if instance_place(x,y,oCol) {triggerbreak = true;}
	
	y += vspd;
}