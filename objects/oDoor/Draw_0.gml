if instance_place(x,y,oMario) {
	draw_set_font(FNT)
	draw_set_halign(fa_center);
	if toLobby {
		draw_text(x,bbox_top-16,"BACK TO LOBBY")
	}
	else if global.world = 0 || global.level = 0 {
		draw_text(x,bbox_top-16,"NOT STARTED!!!")
	}
	else if global.extra {
		draw_text(x,bbox_top-16,"GO TO EXTRA LEVEL")
	}
	else if global.arena != 0 {
		draw_text(x,bbox_top-16,"GO TO ARENA MAP "+string(global.arena-1))
	}
	else if global.race {
		draw_text(x,bbox_top-16,"RACE IN PROGRESS... ")
	}
	else {
		draw_text(x,bbox_top-16,"GO TO "+string(global.world)+"-"+string(global.level))
	}
	draw_set_halign(fa_left);
	draw_set_font(-1);
	draw_set_alpha(1);
}   

draw_self()