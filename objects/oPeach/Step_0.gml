if place_meeting(x,y,oMario) && collided = false
{
	collided = true;
	alarm[0] = room_speed * 1.5
}

if instance_place(x-1,y,oMario) and instance_place(x-1,y,oMario).state = ps.nah {nah = true; sfx(sndBump,0);}

if instance_place(x,y,oBullet) {instance_destroy(instance_place(x,y,oBullet)); instance_destroy()}

if moving = true {x += 1}