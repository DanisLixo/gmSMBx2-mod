var cx = camera_get_view_x(view_camera[0])
var cy = SCREENH

//for the other corner of the screen
var cwview = cx+SCREENW+24

//for 1:1 comparision screen
if global.aspectratio = "ORIGINAL"
{
	var cheepspawn = round(random_range(cx,cwview))
}
else {
	var firstx =  cx+SCREENW/4
	var endx =  cx+SCREENW-(SCREENW/4)
	var cheepspawn = round(random_range(firstx,endx))
}

if oMario.x >= x {start = true;}

if start {
	if spawn > 0 {
		spawn--
		if oMario.hspd > 0 {spawn--}
	}

	else if spawn <= 0 and spawn != -100 {
		if instance_number(o2Cheep) < round(SCREENW/85) {
			if spawntype = 0 {
				instance_create_depth(cwview,round(random_range(48,room_height-64)),depth,o2Cheep);
				spawn = 120;
			}
			else if spawntype = 1 {
				if oMario.hspd = 0 {cwview = cx+SCREENW-64}
				
				var cheep = instance_create_depth(cheepspawn,cy,depth,o2Cheep);
				cheep.cheeptype = 2
				spawn = choose(0,60,60,60,60,100,100,100,100,100,100,120,120);
			}
		}
	}

	with(oEndspawner) {
	if place_meeting(x,y,oMario) {oCheepspawner.spawn = -100;}
	}
}