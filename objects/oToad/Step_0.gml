if place_meeting(x,y,oMario) && collided = false
{
	collided = true;
	alarm[0] = room_speed * 1.5
}

if instance_place(x-1,y,oMario) and instance_place(x-1,y,oMario).state = ps.nah {nah = true; sfx(sndBump,0);}

if instance_place(x,y,oBullet) {instance_destroy(instance_place(x,y,oBullet)); instance_destroy()}

if instance_place(x-1,y,oMario) && global.moveenys = true && instance_place(x-1,y,oMario).state = ps.nah && global.player != "Dawn" 
{
	//x += hspd; // I like this one specifically, he simply stops the enemy (no objectfication).
	sfx(sndBump,0);
	moving = true
}

if moving = true {x += 1}