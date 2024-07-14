if mario_freeze()	{exit;}

var cx = camera_get_view_x(view_camera[0])
if x < cx {instance_destroy()}

event_inherited();

if cheeptype = 1 {stomptype = -1}

switch(state)
{
	case es.patrol:
		x += hspd*facingdir;
		y += vspd*dir;
	
		hspd = 0.4
		if bar != 0 {
			vspd = 0.4
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
	
	break;
	case es.die:
		hspd = 0;
		image_index = 1;
	break;
}