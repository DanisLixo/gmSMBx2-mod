if !(mario_freeze() = 0 or mario_freeze() = 4) || oMario.x < xstart-16*96
{exit;}

if die = -1 
{
	image_speed = imgspd*3;
	hspd = 0; vspd = -0.3;
	if !audio_is_playing(sndP) {sfx(sndP,1)}
}

if state = -1
{
	if bboxturn {y = bbox_top; vspd = -2; bboxturn = false; sfx(sndBowserdie,1);}
	die = 2;
	image_speed = 0;
	image_yscale = -1;
	
	hspd = 0;
	vspd += 0.15;
	y += vspd;
}

else collide();

var mspd = 0.3

if instance_exists(oMario) && die = false
{
	if oMario.x > x && firetimer = 0
	{
		image_xscale = -abs(image_xscale);
		
		hspd = 0;
		if instance_exists(oAxe)
		{
			if x < oAxe.bbox_left-16 && !place_meeting(x+1,y,oCol)
			{x += 0.7;}
			else if x > oAxe.bbox_left-16 && !place_meeting(x+1,y,oCol)
			{x -= 0.7}
			c ++;
		}
	}
	else
	{
		image_xscale = abs(image_xscale);

		c ++;
	
		if c mod 100 = 0 && grounded
		{hspd = choose(-abs(mspd),abs(mspd));}
	
		if c mod 150 = 0 && grounded
		{vspd = -2.9;}
		
		if c mod 120 = 0
		{
			if choose(0,1,1) = 1 && spit != 1
			{
				if !onview() {firetimer = 90;}
				else {firetimer = 30;}
			}
		}
	}
}

if x <= xstart-(16*4) && hspd < 0
{hspd = abs(mspd);}
if instance_exists(oAxe) && x >= oAxe.bbox_left-16 && hspd > 0
{hspd = -abs(mspd);}

if die = true && state != -1
{
	die = 2;
	image_speed = 0;
	hspd = 0;
}

if !grounded and state != -1 and die != true
{vspd -= 0.3;}
vspd = clamp(vspd,-4,3);
 

var m1 = collision_rectangle(x-(sign(image_xscale)*5),y-sprite_height,x+(sign(image_xscale)*8),y-sprite_height*2+4,oMario,true,true);
var m2 = instance_place(x,y,oMario);
if m1 && m1.invincible = 0 && state != -1		{m1.gethit = 1;}
else if m2 && m2.invincible = 0 &&  state != -1	{m2.gethit = 1;}

if place_meeting(x,y,oBullet) {life = 0; instance_destroy(oBullet)}

if life <= 0 {if state != -1 {points(5000,true);} state = -1;}
	
if instance_place(x,y,oBowserfire) && instance_place(x,y,oBowserfire).clashroyale = true {instance_destroy(); instance_destroy(oBowserfire)}

if die != false
{firetimer = -1; hammertimer = -1;}

if spit == 0 {hammertimer = -1;}
if spit == 1 {firetimer = -1;}

if firetimer > 0 
{firetimer --;}
if hammertimer > 0 && onview()
{hammertimer --;}

if firetimer = 1
{instance_create_depth(bbox_left-8,bbox_top,depth,oBowserfire).readjust = true;}

if hammertimer == 1 && (state != -1 || !oMario.x > x) {
	if hammers > 0 
	{
		var hammer = instance_create_depth(x,bbox_top-8,depth-1,oHammer); 
		hammer.holder = id;
		hammer.alarm[0] = 10;
		hammers--; hammertimer = choose(2,8,10,16,20);
	} else {
		hammertimer = floor(room_speed*1.25);
		hammers = 6
	}
}