/// @description Recieve Incoming Data

/*
This is the same scenario as the server, more or less. Here we simply do the same as the server, and get the incoming buffer packet
Then, we can read this data and assign it to whoever we need to

See more below
*/

var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {

	#region Latency
	case network.latency:
		//Read the time that was sent to us in the packet
		var _got_time = buffer_read(packet, buffer_u32);
		
		//Set our latency to be the difference
		latency = current_time - _got_time;
		
		//Reset the timeout because we are still connected
		timeout = 0;
	break;
	#endregion
	
	#region Join
	case network.join:
		//read the ID of the player connecting
		var player_id = buffer_read(packet, buffer_u16);
		var player_user = buffer_read(packet, buffer_string);
		var find_player = ds_map_find_value(instances, player_id);
		players++;
		
		ds_list_add(global.CHAT, player_user + " joined.");
		
	break;
	#endregion
	
	#region Let me go to there too
	case network.asklevel:
		//read the ID of the player connecting
		var world = buffer_read(packet,buffer_u8);
		var level = buffer_read(packet,buffer_u8);
		
		if room = rmLobby {
		global.world = world;
		global.level = level;
		}
	break;
	#endregion

	#region Movement
	case network.move:	//If we get the packet for movement, assign it to the correct player
		var player_id = buffer_read(packet, buffer_u16);
		var find_player = ds_map_find_value(instances, player_id);		//Find the instance ID of the player through the instance map
		
		//Read the rest of the data from the packet
		var player_x =		buffer_read(packet, buffer_s16);
		var player_y =		buffer_read(packet, buffer_s16);
		var player_xscale =	buffer_read(packet, buffer_f16);
		//var player_alpha =	buffer_read(packet, buffer_f16);
		var player_spr =	buffer_read(packet, buffer_u16);
		var player_depth =	buffer_read(packet, buffer_u16);
		var player_ind =	buffer_read(packet, buffer_u16);
		var player_user =	buffer_read(packet, buffer_string);
		var player_pal =	buffer_read(packet, buffer_u8);
		var player_palspr =	buffer_read(packet, buffer_u16);
		var player_room =	buffer_read(packet, buffer_s8);
		var player_stars =	buffer_read(packet, buffer_s8);
		
		//If there is no player with that ID in our map, then create one and add it to the map
		if (is_undefined(find_player)) {
			var p = instance_create_layer(0, 0, "Instances", oOtherplayer);
			ds_map_add(instances, player_id, p);
		} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			if (idd != player_id) && (instance_exists(find_player)) {

				//Assign this data to the correct player
				find_player.x =				player_x;
				find_player.y =				player_y;
				find_player.image_xscale =	player_xscale;
				//find_player.image_alpha =	player_alpha;
				find_player.sprite_index =	player_spr;
				find_player.depth =			player_depth;
				find_player.image_index =	player_ind;
				find_player.username =		player_user;
				find_player.palette =		player_pal;
				find_player.palspr =		player_palspr;
				find_player.myroom =		player_room;
				find_player.mystars =		player_stars;
			}
		}
	break;
	#endregion
	
	#region Shooting
	case network.shoot:
		//When we get the packet of someone shooting, we need to read the data and perform a few actions
		//First we need to get the bullet's ID before anything
		var bullet_id = buffer_read(packet, buffer_u16);
		var find_bullet = ds_map_find_value(instances, bullet_id);		//Find the instance ID of the player through the instance map
		
		var bullet_x = buffer_read(packet, buffer_s16);
		var bullet_y = buffer_read(packet, buffer_s16);
		var bullet_direction = buffer_read(packet, buffer_s16);
		
		//Then we check to see if we shot the bullet or not
		if (is_undefined(find_bullet)) {
			b = instance_create_layer(0, 0, "Instances", oBullet);
			if bullet_id != b.my_id 
			{instance_destroy(b,false)}
			ds_map_add(instances, bullet_id, b);
		} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			if (find_bullet.my_id != bullet_id) && (instance_exists(find_bullet)) {
			//Now we create an instance of that bullet, and assign the data we just read
			find_bullet.my_id = bullet_id;
			find_bullet.x = bullet_x;
			find_bullet.y = bullet_y;
			find_bullet.direction = bullet_direction;
			}
		}
	break;
	#endregion
	
	#region Firing
	case network.fire:
		//When we get the packet of someone shooting, we need to read the data and perform a few actions
		//First we need to get the bullet's ID before anything
		var fire_id = buffer_read(packet, buffer_u16);
		var find_fire = ds_map_find_value(instances, fire_id);		//Find the instance ID of the player through the instance map
		
		var fire_x =		buffer_read(packet, buffer_s16);
		var fire_y =		buffer_read(packet, buffer_s16);
		var fire_xstr =		buffer_read(packet, buffer_s16);
		var fire_ystr =		buffer_read(packet, buffer_s16);
		var fire_spr =		buffer_read(packet, buffer_u16);
		var fire_ind =		buffer_read(packet, buffer_u16);	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
		
		if is_undefined(find_fire) {
			f = instance_create_layer(fire_xstr, fire_ystr, "Instances", oFireball);
			if fire_id != f.my_id 
			{instance_destroy(f,false)}
			ds_map_add(instances, fire_id, f);
			}
		else {
		if (instance_exists(find_fire)) {
			//var f = instance_create_layer(camera_get_view_x(view_camera[0]), 0, "Instances", oFireball);
			//Now we create an instance of that bullet, and assign the data we just read
			find_fire.my_id =			fire_id;
			find_fire.x =				fire_x;
			find_fire.y =				fire_y;
			find_fire.sprite_index =	fire_spr;
			find_fire.image_index =		fire_ind;
		}
		else {ds_map_delete(instances, fire_id) instance_destroy(f); f = noone}
		}
	break;
	#endregion
	
	#region Host beginner
	case network.hostbegin:
		var race = buffer_read(packet,buffer_bool);
		var timer = buffer_read(packet,buffer_u8);
		var schut = buffer_read(packet,buffer_bool);
		var rtx = buffer_read(packet,buffer_bool);
		var command = buffer_read(packet,buffer_bool);
		var arenaindex = buffer_read(packet,buffer_u8);
		var challenge = buffer_read(packet,buffer_bool);
		var waiting = buffer_read(packet,buffer_bool);
		var extra = buffer_read(packet,buffer_bool);
		var playercol = buffer_read(packet,buffer_bool);
		var playerabs = buffer_read(packet,buffer_bool);
		var world = buffer_read(packet,buffer_u8);
		var level = buffer_read(packet,buffer_u8);
	
		global.race = race;
		global.nextlvltimer = timer
		global.schutmode = schut;
		global.rtxmode = rtx;
		global.commandenys = command;
		global.arena = arenaindex;
		global.challenge = challenge;
		global.waiting = waiting;
		global.extra = extra;
		global.playercol = playercol;
		global.abilities = playerabs;
		global.world = world;
		global.level = level;
		
		if global.challenge {warning = "HOST STARTED CHALLENGE"}
		else {warning = "HOST STARTED A NEW GAME"}
		if global.race {
			var roomtogo = asset_get_index("rm" + string(global.world) + "_" + string(global.level));
		
			if global.arena = 0
			{if global.extra = false {room_goto(roomtogo);} else {room_goto(rmExtra)}}
			else
			{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
		}
		else {warntimer=500}
	
	break;
	#endregion
	
	#region Chat
	case network.chat:
		//Read the message from the packet
		var msg = buffer_read(packet, buffer_string);
		
		//Now we need to add that string to the chat list
		
		ds_list_add(global.CHAT, msg);
		
	break;
	#endregion
	
	#region Disconnect
	case network.disconnect:
		//read the ID of the player to disconnect
		var disconnect_id = buffer_read(packet, buffer_u16);
		var user = buffer_read(packet, buffer_string);
		
		//find the instance that corresponds to that ID
		var disconnect_player = ds_map_find_value(instances, disconnect_id);
		
		//if that player exists, find and destroy them for all clients
		if (disconnect_id != idd) {
			if (!is_undefined(disconnect_player)) {
				//destaroy the player disconnecting
				with (disconnect_player) { instance_destroy(); }	
				
				//display in chat that they left the game
				ds_list_add(global.CHAT, user + " left.");
			}
		} else {
			show_message("disconnected")
			game_end();
		}
	break;
	case network.sendraceresult:
	
		var realcounter =	buffer_read(packet, buffer_u16);
		var stringtime =	buffer_read(packet, buffer_string);
		var username =		buffer_read(packet, buffer_string);
		
		
		global.racepos[# 0,ds_grid_height(global.racepos)-1] = realcounter;
		global.racepos[# 1,ds_grid_height(global.racepos)-1] = stringtime;
		global.racepos[# 2,ds_grid_height(global.racepos)-1] = username;
		ds_grid_resize(global.racepos,3,ds_grid_height(global.racepos)+1)
		
		
		if instance_exists(oRacemanager)
		{
			if global.waiting {
				if Iended = players-1 {
					if global.nextlvltimer = 0 {
						oRacemanager.alarm[2] = room_speed*10
						oRacemanager.endcounter = room_speed*10
					}
					else {
						oRacemanager.alarm[2] = room_speed*global.nextlvltimer
						oRacemanager.endcounter = room_speed*global.nextlvltimer
					}
				}
			}
			else
			{
				if global.nextlvltimer = 0 {
						oRacemanager.alarm[2] = room_speed*10
						oRacemanager.endcounter = room_speed*10
					}
					else {
						oRacemanager.alarm[2] = room_speed*global.nextlvltimer
						oRacemanager.endcounter = room_speed*global.nextlvltimer
					}
			}
		}
	break;
	#endregion
	
	#region Finished level, waiting for others
	case network.finished:
		var pepended =	buffer_read(packet, buffer_u16);
		
		Iended = pepended
		
		if Iended = players {
			if global.nextlvltimer = 0 {
				alarm[2] = room_speed*10
				endcounter = room_speed*10
			}
			else {
				alarm[2] = room_speed*global.nextlvltimer
				endcounter = room_speed*global.nextlvltimer
			}
		}
	break;
	#endregion
}
