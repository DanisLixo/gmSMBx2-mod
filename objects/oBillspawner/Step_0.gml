var m = oMario;

if (instance_exists(m) && (m.x > bbox_left - 20 && m.x < bbox_right + 20)) || !onview()
{
	cannontimer = 34-irandom_range(0,32)
}
if spawntype = 0 {
	if !instance_exists(bill) {decrease = choose(true,false,false,false);}
	else {decrease = false;}
	
	if cannontimer = 0 && onview() && instance_number(oBill) < 2
	{bill = instance_create_depth(x+8,y-8,depth+1,oBill); cannontimer = 34; sfx(sndBoom,1);}
}
else if spawntype = 1 {
	var cx = camera_get_view_x(view_camera[0])
	var cwview = cx+SCREENW+8
	
	if instance_number(oBill) < round(SCREENW/200) {decrease = choose(true,false,false);}
	else {decrease = false;}
	
	if cannontimer = 0 && onview() && instance_number(oBill) < 2
	{instance_create_depth(cwview,round(random_range(48,room_height-64)),depth,oBill); 
	cannontimer = 34; sfx(sndBoom,1);}
	
	with(oEndspawner) {
		if place_meeting(x,y,oMario) {oBillspawner.cannontimer = -100;}
	}
}

if cannontimer > 0 and decrease {cannontimer--}