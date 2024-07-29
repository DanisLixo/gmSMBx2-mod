if mario_freeze()	{exit;}

if instance_exists(oLuigi) {var m = choose(oMario,oLuigi)}
else {var m = oMario}

event_inherited();

if state = es.die {
	hspd = 0;
	bstate = -1;
	image_index = 1;
	anim = -1
}

else {
	x += hspd*facingdir;
	y += vspd;
}

if bstate = 0 {
	allowchange = true;
	vlimit = 0;
	midturnchance = 0;
	
	hspd = 0;
	vspd = 0.5;
	movement++;
	if movement > 45 {
		if m.bbox_top < y or y >= room_height-72 {
			bstate = 1;
			vspd = 0;
			movement = 0;
		}
	}
}

if bstate = 1 {
	movement++
	anim = 0;
	
	if movement > 8 {
		if midturnchance != -1 {
			midturnchance = random_range(0, 81);
			
			if movement > 15 and midturnchance >= 80 {
				facingdir = -facingdir;
				midturnchance = -1
			}
		}
	vlimit += vspd
	
	if hspd < maxhspd {hspd += 0.2}
	if vspd > maxvspd {vspd += -0.2;}
		
	if vlimit < -32 {
		vspd = 0; 
		hspd = 0; 
		bstate = 0; 
		movement = 0;
		}
	}
}

if y < 38 {
	y += 2.2
}

if movement > animtrigger and bstate = 0 {
	if anim != -1 {
		image_index = 1;
		anim++
				
		if anim > 24 {
			anim = -1;
			image_index = 0;
			animtrigger = random_range(6,18)
		}
	}
}

if allowchange {
	turnchance = random_range(0, 100);
	turnchance += (m.x > x)? 15 : -15

	if turnchance >= 50 {
		facingdir = 1;
	}
	if turnchance < 50 {
		facingdir = -1;
	}
	
	allowchange = false;
}