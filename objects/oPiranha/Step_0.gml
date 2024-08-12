depth = 299
var m = instance_place(x,y,oMario)

if instance_exists(m) {if !(m.x > bbox_left - 20 && m.x < bbox_right + 20) && moving = false
	&& st = 1
{
	st = 2;
}}

if st >= 2
{
	st ++;
	
	if y > ystart - sprite_height-8
	{y -= 0.5;}
	
	if st > room_speed * 2
	{st = -1;}
}
if st <= -1
{
	if y < ystart
	{y += 0.5;}
	else
	{st = 0;}
}

if st >= 0 && st < 1
{
	st += 0.01;
}

if m && m.starman > 0
{sfx(sndKick,0); instance_destroy();}

if m && m.shoulderbash > 0
{sfx(sndKick,0); oMario.shoulderbash = room_speed*0.5; instance_destroy();}

if m && m.spintimer > 0
{instance_destroy(); sfx(sndKick,0);}

if m && oMario.invincible = 0
{
	m.gethit = 1;
}


