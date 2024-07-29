instance_activate_object(id);

y += gspd

var m = instance_place(x,y-4,oMario)

if m
{
	m.y = bbox_top-1; m.vspd = 0; m.grounded = true
	if not fall {
		gspd += 0.05
		op.gspd = -gspd
	}
}

else if not fall {
	if gspd > 0.0000 {
		gspd -= 0.05
		op.gspd = -gspd
	}
}

if m {if m.vspd >= 0 {m.y += gspd;}}

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