var m = collision_rectangle(x-xdist,0,x+xdist,room_height,oMario,false,true)

if m {
	if m.x <= x {m.x+=0.75}
	else if m.x >= x {m.x-=0.75}
	if m.y <= y and not m.grounded {m.y+=0.45}
}