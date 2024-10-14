// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setTimer(time = 0)
{
	if time != 0 {global.time = timeunits(time); exit}
	
	global.time = timeunits(400)

	var wr = global.world; var lv = global.level;
	if lv == 3 ||
	(lv == 4 && (wr == 2 || wr == 5 || wr == 6)) ||
	(wr == 3 && lv = 2) ||
	(lv == 1 && (wr == 5 || wr == 6))
	{global.time = timeunits(300)}
	
	if global.extra 
	{
		if room != rmExtra_under {global.time = timeunits(500);}
		else {global.time = timeunits(200);}
	}
}