function ps_die()
{
	dietimer ++;
	var maxtime = 40;
	
	invincible = -2;
	
	depth = -1000
	
	if dietimer = 1
	{
		if instance_number(oMario) < 2 {bgm("GO",false);}
		else {sfx(musGO,4)}
		if global.stars != 0 
		{repeat(global.stars) {instance_create_depth(x,y,depth,oSuperstar).vspd = -10;}}
	}
	
	if dietimer < maxtime
	{hspd = 0; vspd = 0;}
	if dietimer = maxtime
	{vspd = -4.5;}
	if dietimer > maxtime
	{vspd += 0.2;}
	
	spr = ms("sMario_s_die")
	
	if y < room_height+sprite_get_height(spr)+8
	y += vspd
	else if instance_number(oMario) >= 2 {instance_destroy()}
}