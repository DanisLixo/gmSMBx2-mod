if moving = true and point_streak < 3 {
	vspd -= 0.2
	
	y += vspd;
}

var mt = collision_rectangle(bbox_left-8,bbox_top,bbox_right+8,bbox_bottom+8,oMario,false,true)

if mt {
	if !play_animation && delay == 0
	{
		m = mt;
		bub_ind += 0.3
		play_animation = true;
		alarm[0] = 1; sfx(snd1UP,0)
	}
}