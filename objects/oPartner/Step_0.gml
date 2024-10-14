if mario_freeze() == 1 {exit;}

with (oPlayer) {
	other.starman = starman;
	// number of steps the player made so far
	var steps_count = array_length(follow_coords) - 1;
	var follow_index = steps_count >= other.follow_delay ? steps_count - other.follow_delay : 0;
	
	var coords = follow_coords[follow_index];
	if other.state != 4 && other.turning == 120 && mario_freeze() == 0
	{other.x = coords.x-16;}
	else {other.x = coords.x;}
	other.y = coords.y;
	other.depth = coords.depth;
	other.x_togo = coords.x_togo;
	other.grounded = true;
	switch (coords.state) {
	    case ps.normal:
	        if coords.hspd == 0 {other.state = 0;}
	        else {other.state = 1;}
			other.image_xscale = coords.image_xscale;
	    break;
	    case ps.jump:
	        other.state = 2;
			other.image_xscale = coords.image_xscale;
			other.grounded = false;
	    break;
	    case ps.crouch:
	        other.state = 3;
			other.image_xscale = x-other.x > 0? 1:-1;
	    break;
		case ps.flagpoledescend:
		    other.state = 4;
			other.image_xscale = coords.image_xscale;
	    break;
	    default:
	        if instance_place(x,bbox_bottom+1,oCol) {other.state = 0;}
			else {other.state = 2; other.grounded = false;}
			other.image_xscale = coords.image_xscale;
	    break;
	}
}

partner_collision()
//collide();