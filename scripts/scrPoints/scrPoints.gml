/// @function points
/// @description Returns points.
/// @param {Real} [Amount] How much will Mario gain you can use 1-10 or 100-8000
/// @param {Bool} [Return Uppercase] If it should return in uppercase, necessary for the game's font.
function points(amnt,give,show = true, m = noone)
{
	var p = instance_create_depth((bbox_left+sprite_width/2),bbox_top-8,-9999,oPoints);
	if m == noone {m = instance_nearest(p.x,p.y,oMario);}
	
	if !show {instance_destroy(p)}
	var ind = 0
	switch(amnt)
	{
		case 1: ind = 1; amnt = 100; break;
		case 2: ind = 2; amnt = 200; break;
		case 3: ind = 3; amnt = 400; break;
		case 4: ind = 4; amnt = 500; break;
		case 5: ind = 5; amnt = 800; break;
		case 6: ind = 6; amnt = 1000; break;
		case 7: ind = 7; amnt = 2000; break;
		case 8: ind = 8; amnt = 4000; break;
		case 9: ind = 9; amnt = 5000; break;
		case 10: ind = 10; amnt = 8000; break;
		//
		case 100: ind = 1; break;
		case 200: ind = 2; break;
		case 400: ind = 3; break;
		case 500: ind = 4; break;
		case 800: ind = 5; break;
		case 1000: ind = 6; break;
		case 2000: ind = 7; break;
		case 4000: ind = 8; break;
		case 5000: ind = 9; break;
		case 8000: ind = 10; break;
	}
	if ind != 0
	{
		if give = true
		{
			if m.object_index = oLuigi {global.p2_score += amnt;}
			else {global.score += amnt;}
		}
		if show {p.image_index = ind;}
	}
}