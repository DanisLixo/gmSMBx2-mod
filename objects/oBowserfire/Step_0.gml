if mario_freeze() = 4
{instance_destroy();}

if !onview() or mario_freeze() != 0
{exit;}


var m = instance_place(x,y,oMario)
if m
{
	m.gethit = 1;
}

if scream = false
{
	scream = true;
	sfx(sndBowserfire,3);
}

x = x+(hspd*facingdir)

if readjust = true && round(y) != round(y/16)*16
{y++;}

if ((oMario.image_xscale = 1 && instance_place(x-1,y,oMario)) or (oMario.image_xscale = -1 && instance_place(x+1,y,oMario))) && oMario.hspd <= 0.5  && global.moveenys = true && oMario.state = ps.nah
{
	clashroyale = true
	facingdir = -facingdir
	//x += hspd; // I like this one specifically, he simply stops the enemy (no objectfication).
	sfx(sndBump,0);
	image_xscale = image_xscale*-1;
}