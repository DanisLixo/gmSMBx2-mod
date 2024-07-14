var m = collision_rectangle(x-xdist,0,x+xdist,room_height,oMario,false,true)

if m {
	if m.x <= x {m.x+=0.5}
	else if m.x >= x {m.x-=0.5}
	//if m.y <= y {m.y+=2}//0.5}
}