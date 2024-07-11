hspd = facing*4

collide();

if place_meeting(x+facing,y,oCol) and !back
{facing = -facing; sfx(sndBump,1); throwed = true}

if place_meeting(x+facing,y,oMario) and throwed = true {
	if oMario.powerup != "f" {pufunc();}
	else {instance_destroy();}
}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp
{
		sfx(sndKick,1);
		points(200,true)
		instance_place(x,y,oParenemy).vspd = -2;
		instance_place(x,y,oParenemy).state = es.die;
		instance_place(x,y,oParenemy).dieface = facing
		if !back facing = -facing
		throwed = true
	}
	if instance_place(x,y,oPiranha)
	{
		sfx(sndKick,1);
		points(200,true)
		instance_destroy(instance_place(x,y,oPiranha));
		if !back facing = -facing
		throwed = true
}


if back {
	throwed = true;
	facing = (oMario.x > x)? 1:-1
	vspd += (oMario.bbox_top-2 > y)? 1:-1
	if y = oMario.bbox_top-2 {vspd = 0}
	
	expire++
	if expire >= 360 {instance_destroy()}
}

if !onview()
	{back = true;}