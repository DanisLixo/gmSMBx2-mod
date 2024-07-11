instance_activate_object(id);

y += gspd

if place_meeting(x,y-3,oMario)
{
	oMario.y = bbox_top-1; oMario.vspd = 0; oMario.grounded = true
	if not fall {
		gspd += 0.1
		op.gspd = -gspd
	}
}

else if not fall {
	if gspd > 0.0000 {
		gspd -= 0.1
		op.gspd = -gspd
	}
}

if place_meeting(x,y-4,oMario) && oMario.vspd >= 0
	{oMario.y += gspd;}

/*else if gspd > 0 {
	gspd -= 0.1
		
	with (op) {
	gspd += 0.1
	}
}*/
	
/*if gspd = 0.025 {
	gspd = 0
	with (op) {gspd = 0}
}*/

if fall {
	maxgspd = 2.5
	gspd += 0.1
	with (op) {gspd += 0.1}
	}
	
else {
	maxgspd = 1
	
	if y < limit {
		gspd = 0;
		fall = true;
		
		with (op) {
		gspd = 0;
		fall = true;
		}
		
		points(1000,true)
	}
}

if (gspd > maxgspd) gspd = maxgspd;
if (gspd < -maxgspd) gspd = -maxgspd;