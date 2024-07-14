var platform = collision_rectangle(x-1,y,x+1,y+room_height,oSeesaw,false,true)
//image_yscale = oSeesaw.y-y;

if fall = 0 {
	if platform {
		image_yscale = platform.y-y;
		if platform.fall {fall = 1; image_yscale = platform.y-y;}
		else {image_yscale = platform.y-y;}
	}
}
else {exit;}