 event_inherited()

//nes_flicker()

if state = es.patrol
{
	if instance_place(x+facingdir,y,oPiranha) and stomptype != 4
	{facingdir = -facingdir;}
}

if instance_place(x+facingdir,y,oParenemy) && instance_place(x+facingdir,y,oParenemy).state = es.shellhit
	&& state != es.die && state != es.stomp and stomptype != 4
{
	instance_place(x+facingdir,y,oParenemy).shellcombo++
	points(instance_place(x+facingdir,y,oParenemy).shellcombo,true)
	sfx(sndKick,0);
	vspd = -2;
	state = es.die;
	dieface = sign(instance_place(x+facingdir,y,oParenemy).hspd);
}

if shellcooldown > 0
{shellcooldown --;}

if state = es.stomp
{
	stomptimer --;
	if stomptimer < 0
	{instance_destroy();}
}


if state = es.die
{
	hspd = dieface*1.5;
	vspd += 0.15;
	image_yscale = -abs(image_yscale);
	
	if stomptype < 3 and cheeptype = -1 {x += hspd;}
	y += vspd;
}


if !instance_exists(oIsArena)
{
	var cx = camera_get_view_x(view_camera[0])
	if x-16 < cx + SCREENW && state = es.frozen
	{state = es.patrol;}
}

var m = instance_place(x+8*facingdir,y,oMario);

if m && global.moveenys = true && m.state = ps.nah
{
	facingdir = -facingdir
	//x += hspd; // I like this one specifically, he simply stops the enemy (no objectfication).
	sfx(sndBump,0);
}