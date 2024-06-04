hspd = facing*4

collide();

if place_meeting(x+facing,y,oMario) and throwed = true
{instance_destroy();}
if place_meeting(x+facing,y,oCol)
{facing = -facing; sfx(sndBump,1); throwed = true}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp
{
	sfx(sndKick,1);
	points(200,true)
	instance_place(x,y,oParenemy).vspd = -2;
	instance_place(x,y,oParenemy).state = es.die;
	instance_place(x,y,oParenemy).dieface = facing
	facing = -facing
	throwed = true
}
if instance_place(x,y,oPiranha)
{
	sfx(sndKick,1);
	points(200,true)
	instance_destroy(instance_place(x,y,oPiranha));
	facing = -facing
	throwed = true
}

if !onview()
{instance_destroy()}