/// @description Latency and Timeout

if global.spectate {
	if instance_exists(oOtherplayer) {
		with(oOtherplayer) {
			if room != myroom {
				room_goto(myroom);
			}
			oCamera.x = x;
			oCamera.y = y;
		}
	}
}

Player = oMario
//Send over the current time to the server
var lbuff = buffer_create(32, buffer_grow, 1);
buffer_seek(lbuff, buffer_seek_start, 0);
buffer_write(lbuff, buffer_u8, network.latency);
buffer_write(lbuff, buffer_u32, current_time);
network_send_packet(client, lbuff, buffer_tell(lbuff));

//Check to see if the player has timed-out
timeout ++;		//increment the timeout, so it can be reset in the latency packet

//If timeout wasn't reset in 5 seconds with fps in mind, disconnect and return to menu
if (timeout > fps*12) {
	disconnecttt();
	show_message("Disconnected (Time-out)")
	global.insertclient = false;
	game_restart();
}

with(oOtherplayer) {
	if myroom != rmLobby
	{
		if countme == false {countme = true;}
	}
	else if countme != false {other.players--; countme = false;}
		
	if countme {other.players++; countme = -1;}
}

if room = rmTitle
{
	disconnecttt();
}

if Iended >= players && !allfinished {
	if global.nextlvltimer = 0 {
		alarm[2] = room_speed*10
		endcounter = room_speed*10
	}
	else {
		alarm[2] = room_speed*global.nextlvltimer
		endcounter = room_speed*global.nextlvltimer
	}
	
	allfinished = true;
}