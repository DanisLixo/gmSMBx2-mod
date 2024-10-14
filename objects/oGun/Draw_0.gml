if instance_exists(oMario) {m = instance_nearest(x,y,oMario);}
else {m = instance_nearest(x,y,oGame);}

if global.schutmode = false && can = true
{instance_destroy();}

var mdir = point_direction(x,y,mouse_x,mouse_y);
var lenx = lengthdir_x(5,mdir);	var leny = lengthdir_y(5,mdir);


if instance_exists(m)
{
	x = m.x;
	y = m.bbox_top+4;
	face  = sign(m.image_xscale)
}
else {instance_destroy()}
	
if image_index >= sprite_get_number(sprite_index)-1
{
	image_index = 0;
	image_speed = 0;
}

if mouse_check_button(mb_left) && image_index = 0
{
	if instance_exists(m) && m.state != ps.flagpoledescend && m.state != ps.flagpolefinish
		 && m.state != ps.castleending
	{
		var lx = lengthdir_x(1,mdir); var ly = lengthdir_y(2,mdir);
		m.hspd -= lx;
		m.vspd -= ly;
	}
	image_speed = imgspd*4;
	audio_stop_sound(sndGunshot)
	audio_play_sound(sndGunshot,0,0,global.volsfx);
	var xm = global.gunskin = "MiniGun"? x+8 : x
	var ym = global.gunskin = "MiniGun"? y-2 : y
	var b = instance_create_depth(xm,ym,depth,oBullet)
	if instance_exists(b) {b.direction = mdir}
	var bd = instance_create_depth(x,y,depth,oBulletdropped);
	if instance_exists(bd) {
		bd.direction = mdir
		bd.hspd = -face*5
	}
}

spr = gs("sGun_Default");
draw_sprite_ext(spr,image_index,x+lenx,y+3+leny,1,face,mdir,-1,image_alpha)


