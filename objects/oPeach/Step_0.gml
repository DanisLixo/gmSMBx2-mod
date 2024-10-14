if place_meeting(x,y,oMario) && collided = false
{
	collided = true;
	alarm[0] = room_speed * 1.5
}

if moving = true {x += 1}

if can_go 
{
	if keyboard_check_pressed(global.keya) {
		if instance_exists (oClient) {room_goto(rmLobby);}
		else {room_goto(rmTitle);}
	}
	
	global.hardmode = true;
}