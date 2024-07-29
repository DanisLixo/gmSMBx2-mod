if place_meeting(x,y+1,oCol) && m.char != "Dawn" 
{vspd = -2.5;}

hspd = facing*4

collide();

if place_meeting(x+facing,y,oCol)
{instance_destroy(); sfx(sndBump,1);}
if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).stomptype = 2
{instance_destroy(); sfx(sndBump,1);}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp and instance_place(x,y,oParenemy).stomptype != 2
{
	sfx(sndKick,1);
	points(200,true)
	instance_place(x,y,oParenemy).vspd = -2;
	instance_place(x,y,oParenemy).state = es.die;
	instance_place(x,y,oParenemy).dieface = facing
	instance_destroy();
}
if instance_place(x,y,oPiranha)
{
	sfx(sndKick,1);
	points(200,true)
	instance_destroy(instance_place(x,y,oPiranha));
	instance_destroy();
}

if instance_place(x,y,oBowser)
{
	instance_place(x,y,oBowser).life -= 1
	instance_destroy();
}

if !onview()
{instance_destroy(id,false);}

if m.char = "Dawn" 
{
	if place_meeting(x,y+1,oCol) {
		boings += 1
		if boings >= 1 {
			vspd = vspd*-boings;
			if boings >= 3 {image_speed *= 2}
			}
	}
}