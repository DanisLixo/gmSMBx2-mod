if place_meeting(x,y+1,oCol) && global.player != "Dawn" 
{vspd = -2.5;}

hspd = facing*4

collide();

if place_meeting(x+facing,y,oCol)
{instance_destroy(); instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5; sfx(sndBump,1);}
if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).stomptype = 2
{instance_destroy(); instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5; sfx(sndBump,1);}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp and instance_place(x,y,oParenemy).stomptype <= 1
{
	sfx(sndKick,1);
	instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5;
	points(200,true)
	instance_place(x,y,oParenemy).vspd = -2;
	instance_place(x,y,oParenemy).state = es.die;
	instance_place(x,y,oParenemy).dieface = facing
	instance_destroy();
}
if instance_place(x,y,oPiranha)
{
	sfx(sndKick,1);
	instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5;
	points(200,true)
	instance_destroy(instance_place(x,y,oPiranha));
	instance_destroy();
}

if instance_place(x,y,oBowser)
{
	instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5;
	instance_destroy();
	oBowser.life -= 1
}

if !onview()
{instance_destroy();}

if global.player = "Dawn" 
{
	if place_meeting(x,y+1,oCol) {
		boings += 1
		if boings >= 1 {
			vspd = vspd*-boings;
			if boings >= 3 {image_speed *= 2}
			}
	}
}