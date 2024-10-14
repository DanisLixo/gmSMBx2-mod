/// @self
/// @description It takes an object out another object until it leaves the object. It goes unused as arena isn't up.
/// @param {Float} [Pixels] How many pixels will it go inside the object.
/// @param {Object Asset} [Collision] Object that it is inside.

function move_out(pixels,collision)
{
	for (var i = 0; i < pixels; i ++;)
	{
		if place_meeting(x,y,collision)
		{
			if !place_meeting(x+i,y,collision)		{x += i;}
			else if !place_meeting(x-i,y,collision)	{x -= i;}
			if !place_meeting(x,y-i,collision)		{y -= i;}
			else if !place_meeting(x,y+i,collision)	{y += i;}
		}
	}
}