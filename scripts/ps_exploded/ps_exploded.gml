function ps_exploded()
{
	y += 4;
	
	if sprite_exists(asset_get_index(ms("sMario_{}_fall"))) {spr = ms("sMario_{}_fall");}
	else {spr = ms("sMario_{}_jump");}
	
	if place_meeting(x,y+4,oCol) || place_meeting(x,y+4,oElevator) {state = ps.normal;}
}
