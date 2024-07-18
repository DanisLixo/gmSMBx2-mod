if mario_freeze()	{exit;}

var cx = camera_get_view_x(view_camera[0])-16
if x < cx {instance_destroy()}

event_inherited();

if cheeptype = 1 {stomptype = -1}

switch(state)
{
	case es.patrol:
	if cheeptype < 2 {
		x += hspd*facingdir;
		y += vspd*dir;
	
		hspd = 0.4
		if bar != 0 {
			vspd = 0.2
		}
		if y < vlimit and dir = -1 {
			vlimit = y+bar*2;
			vspd = -vspd;
			dir = 1;
		}
		else if y > vlimit and dir = 1 {
			vlimit = y-bar*2;
			vspd = -vspd;
			dir = -1;
		}
		
		if y < 42 {
			vlimit = y+bar*2;
		}
	}
	else {
		x += hspd*facingdir;
		y += vspd;
		
		if vspd = 0 {vspd = -4}
		
		hspd = choose(0.4,0.6,0.8,random_range(1,1.6));
		var m = collision_rectangle(x-2,y-2,x+2,y,oMario,true,false);
		if m {state = es.die; m.vspd = -3; m.holdjump = 0; BLAST()}
		
		if y < 80 {vspd += 0.15}
		if y > SCREENH+16 {instance_destroy()}
	}
	break;
	case es.die:
		image_index = 1;
	break;
}