if mario_freeze()	{exit;}

event_inherited();

hspd = 0.3*c
facingdir = sign(instance_nearest(x,y,oMario).x-x)
 		
if x < xstart-16 {
	c = 1;
}
else if x > xstart {
	c = -1;
}

if onview() and state = es.patrol {
if jump > 0 {jump--}
if hammertimer > 0 {hammertimer--}
if aightcomehere > 0 {aightcomehere--}
}

if state = es.patrol {
	if jump >= 1 {
		var place = -10
		
		if jump = 1 {
			if actual < lowest {place = choose(-10,-3)}
			if place = -3 {smalljump = true;}
			vspd = place;
			jump = 0;
		}
		
		if instance_place(x,y+4,oCol) {actual = instance_place(x,y+4,oCol).y}

		collide()
	}
	else if jump = 0 {
		vspd += 0.3
		
		if smalljump = true and vspd > 6.2 {smalljump = false;}
		if vspd > 0 and smalljump = false {
			jump = 181; //vspd = 0;
		}
		x += hspd;
		y += vspd;
	}
}
if state = es.die {
	if bboxturn {y = bbox_top-20; bboxturn = false; /*points(1000,true)*/}
	image_index = 0;
	if blocked {x += hspd;}
}


if hammertimer <= 10 and state = es.patrol {
	spr = sHammerbro_ready;
	if hammertimer = 10 {instance_create_depth(x,bbox_top-4,depth-1,oHammer);}
	var hammer = instance_place(x,bbox_top-4,oHammer)
	if instance_exists(hammer) {
		hammer.facingdir = oMario.x > x? 1 : -1;
		hammer.holder = id;
		if hammertimer = 0 {
			hammer.throwed = true;
			hammertimer = choose(45,45,120)
			spr = sHammerbro;
		}
	}
	else {hammertimer = choose(45,45,120)}
}

if aightcomehere <= 500 and aightcomehere != -1 {
	if aightcomehere <= 0 || instance_nearest(x,y,oMario).x > x {aightcomehere = -1; xstart = x}
	c = sign(instance_nearest(x,y,oMario).x-x)*1.75; 
	if instance_place(x+facingdir*16,bbox_top,oCol) {jump = 0; vspd = -10;} else {jump = 50}
}

if place_meeting(x,y,oBullet) {state = es.die; instance_destroy(oBullet)}