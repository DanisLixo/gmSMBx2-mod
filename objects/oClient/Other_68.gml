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
	try {
		//read the ID of the player connecting
		var player_id = buffer_read(packet, buffer_u16);
		var player_user = buffer_read(packet, buffer_string);
		var find_player = ds_map_find_value(instances, player_id);
		players++;
		
		ds_list_add(global.CHAT, player_user + " joined.");
		
	} catch(e) {show_message("gmSMB found a network error. You'll be disconnected." + e + "Sorry about that. :[") disconnecttt(); room_goto(rmTitle);}
	break;
	#endregion
	
	#region Let me go to there too
	case network.sync:
	try {
		//read everything so they can sync with the rest without having to 
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
		
		ds_list_add(changes, "Waiting time")
		ds_list_add(boolchanges, "nextlvltimer")
		global.nextlvltimer = timer
		
		ds_list_add(changes, "Gun")
		ds_list_add(boolchanges, "schutmode")
		global.schutmode = schut;
		
		ds_list_add(changes, "Latern")
		ds_list_add(boolchanges, "rtxmode")
		global.rtxmode = rtx;
		
		ds_list_add(changes, "Commander")
		ds_list_add(boolchanges, "commandenys")
		global.commandenys = command;
		
		ds_list_add(changes, "Wait for others")
		ds_list_add(boolchanges, "waiting")
		global.waiting = waiting;
		
		ds_list_add(changes, "Collision between players")
		ds_list_add(boolchanges, "playercol")
		global.playercol = playercol;
		
		ds_list_add(changes, "Characters abilities")
		ds_list_add(boolchanges, "abilities")
		global.abilities = playerabs;
		
		ds_list_add(changes, "World")
		ds_list_add(boolchanges, "")
		global.world = world;
		global.level = level;
		
		global.extra = extra;
		global.arena = arenaindex;
		global.challenge = challenge;
		global.race = race;
		
		if global.extra {room_goto(rmExtra)}
		else if global.arena != 0
		{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
		else if global.challenge {room_goto(rm1_1)}
		warntimer=500
		
	} catch(e) {show_message("gmSMB found a network error. You'll be disconnected." + e + "Sorry about that. :[") disconnecttt(); room_goto(rmTitle);}
	break;
	#endregion
	#region Let me go to there too
	case network.raceplace:
		var world = buffer_read(packet,buffer_u8);
		var level = buffer_read(packet,buffer_u8);
		
		global.world = world;
		global.level = level;	
	break;
	#endregion

	#region Movement
	case network.move:	//If we get the packet for movement, assign it to the correct player
	try {
		var player_id = buffer_read(packet, buffer_u16);
		var find_player = ds_map_find_value(instances, player_id);		//Find the instance ID of the player through the instance map
		
		//Read the rest of the data from the packet
		var player_x =		buffer_read(packet, buffer_s16);
		var player_y =		buffer_read(packet, buffer_s16);
		var player_xscale =	buffer_read(packet, buffer_f16);
		var player_alpha =	buffer_read(packet, buffer_f16);
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
				find_player.image_alpha =	global.onlinealpha;
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
		
	} catch(e) {
		show_message("gmSMB found a network error. You'll be disconnected." + e + "Sorry about that. :[") 
		disconnecttt(); room_goto(rmTitle);}
	break;
	#endregion
	
	#region Shooting
	case network.shoot:
	try {
		//When we get the packet of someone shooting, we need to read the data and perform a few actions
		//First we need to get the bullet's ID before anything
		var bullet_id = buffer_read(packet, buffer_u16);
		var find_bullet = ds_map_find_value(instances, bullet_id);		//Find the instance ID of the player through the instance map
		
		var bullet_x = buffer_read(packet, buffer_s16);
		var bullet_y = buffer_read(packet, buffer_s16);
		var bullet_xstr = buffer_read(packet, buffer_s16);
		var bullet_ystr = buffer_read(packet, buffer_s16);
		var bullet_direction = buffer_read(packet, buffer_s16);
		
		//Then we check to see if we shot the bullet or not
		if (is_undefined(find_bullet)) {
			var b = instance_create_layer(bullet_xstr, bullet_ystr, "Instances", oOtherbullet);
			ds_map_add(instances, bullet_id, b);
		} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			if (bidd != bullet_id) && (instance_exists(find_bullet)) {
			//Now we create an instance of that bullet, and assign the data we just read
			find_bullet.my_id = bullet_id;
			find_bullet.x = bullet_x;
			find_bullet.y = bullet_y;
			find_bullet.direction = bullet_direction;
			}
		}
		
	} catch(e) {
		show_message("gmSMB found a network error. You'll be disconnected." + e + "Sorry about that. :[") 
		disconnecttt(); room_goto(rmTitle);}
	break;
	#endregion
	
	
	#region Disconnect
	case network.shootd:
		//read the ID of the player to disconnect
		var disconnect_id = buffer_read(packet, buffer_u16);
		
		//find the instance that corresponds to that ID
		var disconnect_bullet = ds_map_find_value(instances, disconnect_id);
		
		//if that player exists, find and destroy them for all clients
		if (disconnect_bullet != bidd) {
			if (!is_undefined(disconnect_bullet)) {
				//destaroy the player disconnecting
				with (disconnect_bullet) {instance_destroy();}	
			}
		}
	break;
	#endregion
	
	#region Firing
	case network.fire:
	try {
		//When we get the packet of someone shooting, we need to read the data and perform a few actions
		//First we need to get the bullet's ID before anything
		var fire_id = buffer_read(packet, buffer_u16);
		var player_id = buffer_read(packet, buffer_u16);
		
		if player_id = Player.my_id {break;}
		var find_fire = ds_map_find_value(instances, fire_id);		//Find the instance ID of the player through the instance map
		
		var fire_x =		buffer_read(packet, buffer_s16);
		var fire_y =		buffer_read(packet, buffer_s16);
		var fire_xstr =		buffer_read(packet, buffer_s16);
		var fire_ystr =		buffer_read(packet, buffer_s16);
		var fire_spr =		buffer_read(packet, buffer_u16);
		var fire_ind =		buffer_read(packet, buffer_u16);	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
		//var fire_face =		buffer_read(packet, buffer_s8);	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
		
		
		if (is_undefined(find_fire)) {
			var f = instance_create_layer(fire_xstr, fire_ystr, "Instances", oOtherfireball);
			//fidd = find_fire.my_id;
			ds_map_add(instances, fire_id, f);
		} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			if (fidd != fire_id) && (instance_exists(find_fire)) {

				//Assign this data to the correct player
				find_fire.my_id =			fire_id;
				find_fire.x =				fire_x;
				find_fire.y =				fire_y;
				find_fire.sprite_index =	fire_spr;
				find_fire.image_index =		fire_ind;
				//find_fire.facing =		fire_face;
			}
		}
		
	} catch(e) {
		show_message("gmSMB found a network error. You'll be disconnected." + e + "Sorry about that. :[") 
		disconnecttt(); room_goto(rmTitle);}
	break;
	#endregion
	
	#region Disconnect
	case network.fired:
		//read the ID of the player to disconnect
		var disconnect_id = buffer_read(packet, buffer_u16);
		
		//find the instance that corresponds to that ID
		var disconnect_fire = ds_map_find_value(instances, disconnect_id);
		
		//if that player exists, find and destroy them for all clients
		if (disconnect_id != fidd) {
			if (!is_undefined(disconnect_fire)) {
				//destaroy the player disconnecting
				with (disconnect_fire) {instance_destroy();}	
			}
		}
	break;
	#endregion
	
	#region Host beginner
	case network.hostbegin:
	try {
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
		
		if timer != global.nextlvltimer {
			ds_list_add(changes, "Waiting time")
			ds_list_add(boolchanges, "nextlvltimer")
			global.nextlvltimer = timer
		}
		if schut != global.schutmode {
			ds_list_add(changes, "Gun")
			ds_list_add(boolchanges, "schutmode")
			global.schutmode = schut;
		}
		if rtx != global.rtxmode {
			ds_list_add(changes, "Latern")
			ds_list_add(boolchanges, "rtxmode")
			global.rtxmode = rtx;
		}
		if command != global.commandenys {
			ds_list_add(changes, "Commander")
			ds_list_add(boolchanges, "commandenys")
			global.commandenys = command;
		}
		
		global.arena = arenaindex;
		global.challenge = challenge;
		
		if waiting != global.waiting {
			ds_list_add(changes, "Wait for others")
			ds_list_add(boolchanges, "waiting")
			global.waiting = waiting;
		}
		
		global.extra = extra;
		
		if playercol != global.playercol {
			ds_list_add(changes, "Collision between players")
			ds_list_add(boolchanges, "playercol")
			global.playercol = playercol;
		}
		if playerabs != global.abilities {
			ds_list_add(changes, "Characters abilities")
			ds_list_add(boolchanges, "abilities")
			global.abilities = playerabs;
		}
		if world != global.world || level != global.level {
			ds_list_add(changes, "World")
			global.world = world;
			global.level = level;
		}
		
		if global.challenge {warning = "HOST STARTED CHALLENGE"}
		else {warning = "HOST STARTED A NEW GAME"}
		if global.race {
			var roomtogo = asset_get_index("rm" + string(global.world) + "_" + string(global.level));
		
			if global.challenge {room_goto(rm1_1)}
			else if global.extra {room_goto(rmExtra)} 
			else {room_goto(roomtogo);}
		}
		else if global.extra {room_goto(rmExtra)}
		else if global.arena != 0
		{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
		else if global.challenge {room_goto(rm1_1)}
		else {warntimer=500}
		
	} catch(e) {
		show_message("gmSMB found a network error. You'll be disconnected." + e + "Sorry about that. :[") 
		disconnecttt(); room_goto(rmTitle);}
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
	#endregion
	
	#region Disconnect
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
		else {
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
	
	#region Finished level, waiting for others
	case network.finished:
		var pepended =	buffer_read(packet, buffer_u16);
		Iended = pepended
		
		if !instance_exists(oRacemanager) {
			if Iended >= players {
				if global.nextlvltimer = 0 {
					alarm[2] = room_speed*10
					endcounter = room_speed*10
				}
				else {
					alarm[2] = room_speed*global.nextlvltimer
					endcounter = room_speed*global.nextlvltimer
				}
			}
		}
	break;
	#endregion
} 