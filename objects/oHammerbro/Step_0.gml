if mario_freeze()	{exit;}

event_inherited();

if state = es.die
{
	if bboxturn {y = bbox_top-8; vspd = -2; bboxturn = false;}
	image_speed = 0;
	image_yscale = -1;
}

else 
{

var mspd = 0.75


if instance_exists(oMario)
{
		image_xscale = abs(image_xscale);

		c ++;
	
		if c mod 100 = 0 && grounded
		{hspd = choose(-abs(mspd),abs(mspd));}
	
		if c mod 150 = 0 && grounded
		{vspd = -6; jump = true}
		
		if c mod 120 = 0
		{
			if choose(0,1,1) = 1
			{
				firetimer = 30;
			}
	}
}

if x <= xstart-8 && hspd < 0
{hspd = abs(mspd);}
if x >= xstart+8 && hspd > 0
{hspd = -abs(mspd);}

if !grounded and state != es.die
{vspd -= 0.3;}
vspd = clamp(vspd,-4,3);

if jump = false {collide();}
if grounded {jump = false}

if place_meeting(x,y,oBullet) {state = es.die; instance_destroy(oBullet)}
}