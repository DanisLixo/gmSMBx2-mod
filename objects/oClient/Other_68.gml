/// @description Recieve Incoming Data

/*
This is the same scenario as the server, more or less. Here we simply do the same as the server, and get the incoming buffer packet
Then, we can read this data and assign it to whoever we need to

See more below
*/
try {
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
			warntimer = addwarn
		break;
		#endregion
	
		#region Let me go to there too
		case network.sync:
			//read everything so they can sync with the rest without having to rehost
			var race = buffer_read(packet,buffer_bool);
			var timer = buffer_read(packet,buffer_u8);
			var schut = buffer_read(packet,buffer_bool);
			var rtx = buffer_read(packet,buffer_bool);
			var command = buffer_read(packet,buffer_bool);
			var arenaindex = buffer_read(packet,buffer_u8);
			var challenge = buffer_read(packet,buffer_bool);
			var pvp = buffer_read(packet,buffer_bool);
			var waiting = buffer_read(packet,buffer_bool);
			var extra = buffer_read(packet,buffer_bool);
			var playercol = buffer_read(packet,buffer_bool);
			var playerabs = buffer_read(packet,buffer_bool);
			var world = buffer_read(packet,buffer_u8);
			var level = buffer_read(packet,buffer_u8);
			var goto = buffer_read(packet,buffer_bool);
		
			global.nextlvltimer = timer
			
			global.schutmode = schut;
			global.rtxmode = rtx;
			global.commandenys = command;
			global.waiting = waiting;
			global.pvp = pvp;
			global.playercol = playercol;
			global.abilities = playerabs;
		
			global.world = world;
			global.level = level;
		
			global.extra = extra;
			global.arena = arenaindex;
			global.challenge = challenge;
			global.race = race;
		
			if goto {
				var roomtogo = asset_get_index("rm" + string(global.world) + "_" + string(global.level));
		
				if global.challenge {room_goto(rm1_1)}
				else if global.extra {room_goto(rmExtra)} 
				else if global.arena != 0
				{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
				else if room_exists(roomtogo) {room_goto(roomtogo);}
			
			}
			warning = "SYNCED WITH THE SERVER!"
			warntimer=addwarn; ds_list_add(global.CHAT, warning);
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
			var pvp = buffer_read(packet,buffer_bool);
			var waiting = buffer_read(packet,buffer_bool);
			var extra = buffer_read(packet,buffer_bool);
			var playercol = buffer_read(packet,buffer_bool);
			var playerabs = buffer_read(packet,buffer_bool);
			var world = buffer_read(packet,buffer_u8);
			var level = buffer_read(packet,buffer_u8);
			var goto = buffer_read(packet,buffer_bool);
	
			global.race = race;
			global.nextlvltimer = timer
			global.schutmode = schut;
			global.rtxmode = rtx;
			global.commandenys = command;
			global.arena = arenaindex;
			global.challenge = challenge;
			
			global.pvp = pvp;
			
			global.waiting = waiting;
		
			global.extra = extra;
		
			global.playercol = playercol;
			global.abilities = playerabs;
			global.world = world;
			global.level = level;
			if global.challenge 
			{warning = "HOST STARTED CHALLENGE!"}
			else 
			{warning = "HOST HAS UPDATED THE SETTINGS!"}
			if global.race || goto {
				var roomtogo = asset_get_index("rm" + string(global.world) + "_" + string(global.level));
		
				if global.challenge {room_goto(rm1_1)}
				else if global.extra {room_goto(rmExtra)} 
				else if global.arena != 0
				{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
				else {room_goto(roomtogo);}
			}
			else if global.extra {room_goto(rmExtra)}
			else if global.arena != 0
			{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
			else if global.challenge {room_goto(rm1_1)}
			else {warntimer=addwarn; ds_list_add(global.CHAT, warning);}
		break;
		#endregion
	
		#region Chat
		case network.chat:
			//Read the message from the packet
			var msg = buffer_read(packet, buffer_string);
		
			//Now we need to add that string to the chat list
		
			ds_list_add(global.CHAT, msg);
			warntimer = addwarn;
		
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
				show_message("You got disconnected from the server.")
				alarm[3] = 60;
				endcounter = 60;
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
		
		
			if instance_exists(oRacemanager) {
				if global.nextlvltimer = 0 {
					oRacemanager.alarm[2] = room_speed*10
					oRacemanager.endcounter = room_speed*10
				} else {
					oRacemanager.alarm[2] = room_speed*global.nextlvltimer
					oRacemanager.endcounter = room_speed*global.nextlvltimer
				}
			}
		break;
		case network.finished: Iended++; break;
		
		case network.raceplace:
			var world = buffer_read(packet,buffer_u8);
			var level = buffer_read(packet,buffer_u8);
		
			global.world = world;
			global.level = level;	
		break;
		#endregion

		#region Movement
		case network.move:	//If we get the packet for movement, assign it to the correct player
			var player_id = buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}
		
			var find_player = ds_map_find_value(instances, player_id);		//Find the instance ID of the player through the instance map
		
			//Read the rest of the data from the packet
			var player_x =		buffer_read(packet, buffer_s16);
			var player_y =		buffer_read(packet, buffer_s16);
			var player_xscale =	buffer_read(packet, buffer_f16);
			var player_alpha =	buffer_read(packet, buffer_f16);
			var player_spr =	buffer_read(packet, buffer_u16);
			var player_depth =	buffer_read(packet, buffer_u16);
			var player_ind =	buffer_read(packet, buffer_u16);
			var player_star =	buffer_read(packet, buffer_s16);
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
					find_player.spr =			player_spr;
					find_player.depth =			player_depth;
					find_player.ind =			player_ind;
					find_player.starman =			player_star;	
					find_player.username =		player_user;
					find_player.palette =		player_pal;
					find_player.palspr =		player_palspr;
					find_player.myroom =		player_room;
					find_player.mystars =		player_stars;
				
					find_player.image_alpha =	player_alpha*global.onlinealpha;
				}
			}
		break;
		#endregion
	
		#region Movement
		case network.mgun:	//If we get the acket for movement, assign it to the correct player
			var player_id =		buffer_read(packet, buffer_u16);	//Read the contents of the buffer IN THE ORDER IT WAS SENT
			if player_id = global.clientid {break;}
		
			var player_room =	buffer_read(packet, buffer_s8);
			if player_room != room {break;}
			var gun_x =			buffer_read(packet, buffer_s16);
			var gun_y =			buffer_read(packet, buffer_s16);
			var gun_yscale =	buffer_read(packet, buffer_f16);
			var gun_spr =		buffer_read(packet, buffer_u16);
			var gun_dir =		buffer_read(packet, buffer_f16);
			var gun_depth =		buffer_read(packet, buffer_s16);
			var gun_ind =		buffer_read(packet, buffer_u16);
		
		
			var gun_id = player_id+500
			var find_gun = ds_map_find_value(instances, gun_id);		//Find the instance ID of the player through the instance map
			//If there is no player with that ID in our map, then create one and add it to the map
			if (is_undefined(find_gun)) {
				var p = instance_create_layer(0, 0, "Instances", oOthergun);
				ds_map_add(instances, gun_id, p);
			} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
				if (idd+500 != gun_id) && (instance_exists(find_gun)) {

					//Assign this data to the correct player
					find_gun.myroom =			player_room;
					find_gun.x =				gun_x;
					find_gun.y =				gun_y;
					find_gun.image_yscale =		gun_yscale;
					find_gun.sprite_index =		gun_spr;
					find_gun.image_angle =		gun_dir;
					find_gun.depth =			gun_depth;
					find_gun.image_index =		gun_ind;
				
					find_gun.image_alpha =		global.onlinealpha;
				}
			}
		break;
		case network.mgund:
			//read the ID of the player to disconnect
			var disconnect_id = buffer_read(packet, buffer_u16);
		
			//find the instance that corresponds to that ID
			var disconnect_gun = ds_map_find_value(instances, disconnect_id+500);
		
			//if that player exists, find and destroy them for all clients
			if (disconnect_id != idd+500) {
				if (!is_undefined(disconnect_gun)) {
					//destaroy the player disconnecting
					with (disconnect_gun) {instance_destroy();}	
				}
			}
		break;
		#endregion
	
		#region Movement
		case network.mcape:	//If we get the packet for movement, assign it to the correct player
			var player_id =		buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}

			var player_room =	buffer_read(packet, buffer_s8);
			if player_room != room {break;}
			var cape_x =		buffer_read(packet, buffer_s16);
			var cape_y =		buffer_read(packet, buffer_s16);
			var cape_xscale =	buffer_read(packet, buffer_f16);
			var cape_spr =		buffer_read(packet, buffer_u16);
			var cape_depth =	buffer_read(packet, buffer_u16);
			var cape_ind =		buffer_read(packet, buffer_u16);
			var cape_pal =		buffer_read(packet, buffer_u8);
		
			var cape_id = player_id+1000
			var find_cape = ds_map_find_value(instances, cape_id);		//Find the instance ID of the player through the instance map
			//If there is no player with that ID in our map, then create one and add it to the map
			if (is_undefined(find_cape)) {
				var p = instance_create_layer(0, 0, "Instances", oOthercape);
				ds_map_add(instances, cape_id, p);
			} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
				if (idd+1000 != cape_id) && (instance_exists(find_cape)) {

					//Assign this data to the correct player
					find_cape.myroom =			player_room;
					find_cape.x =				cape_x;
					find_cape.y =				cape_y;
					find_cape.image_xscale =	cape_xscale;
					find_cape.sprite_index =	cape_spr;
					find_cape.depth =			cape_depth;
					find_cape.image_index =		cape_ind;
					find_cape.palette =			cape_pal;
				
					find_cape.image_alpha =		global.onlinealpha;
				}
			}
		break;
		case network.mcaped:
			//read the ID of the player to disconnect
			var disconnect_id = buffer_read(packet, buffer_u16);
		
			//find the instance that corresponds to that ID
			var disconnect_cape = ds_map_find_value(instances, disconnect_id+1000);
		
			//if that player exists, find and destroy them for all clients
			if (disconnect_id != idd+1000) {
				if (!is_undefined(disconnect_cape)) {
					//destaroy the player disconnecting
					with (disconnect_cape) {instance_destroy();}	
				}
			}
		break;
		#endregion
	
		#region Shooting
		case network.shoot:
			//When we get the packet of someone shooting, we need to read the data and perform a few actions
			//First we need to get the bullet's ID before anything
			var bullet_id =			buffer_read(packet, buffer_u16);
			var player_id =			buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}

			var player_room =		buffer_read(packet, buffer_s8);
			if player_room != room {break;}
			var bullet_x =			buffer_read(packet, buffer_s16);
			var bullet_y =			buffer_read(packet, buffer_s16);
			var bullet_xstr =		buffer_read(packet, buffer_s16);
			var bullet_ystr =		buffer_read(packet, buffer_s16);
			var bullet_direction =	buffer_read(packet, buffer_u16);
			var bullet_spr =	buffer_read(packet, buffer_u16);
		
			var find_bullet = ds_map_find_value(instances, bullet_id);		//Find the instance ID of the player through the instance map
		
			//Then we check to see if we shot the bullet or not
			if (is_undefined(find_bullet)) {
				var b = instance_create_layer(bullet_xstr, bullet_ystr, "Instances", oOtherbullet);
				ds_map_add(instances, bullet_id, b);
			} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
				if (bidd != bullet_id) && (instance_exists(find_bullet)) {
				//Now we create an instance of that bullet, and assign the data we just read
				find_bullet.my_id =			bullet_id;
				find_bullet.myroom =		player_room;
				find_bullet.x =				bullet_x;
				find_bullet.y =				bullet_y;
				find_bullet.image_angle =	bullet_direction;
				find_bullet.sprite_index =	bullet_spr;
			
				find_bullet.image_alpha =		global.onlinealpha;
				}
			}
		break;
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
			var fire_id =		buffer_read(packet, buffer_u16);
			var player_id =		buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}

			var player_room =	buffer_read(packet, buffer_s8);
			if player_room != room {break;}
			var fire_x =		buffer_read(packet, buffer_s16);
			var fire_y =		buffer_read(packet, buffer_s16);
			var fire_xstr =		buffer_read(packet, buffer_s16);
			var fire_ystr =		buffer_read(packet, buffer_s16);
			var fire_spr =		buffer_read(packet, buffer_u16);
		
			var find_fire = ds_map_find_value(instances, fire_id);		//Find the instance ID of the player through the instance map
		
			if (is_undefined(find_fire)) {
				var f = instance_create_layer(fire_xstr, fire_ystr, "Instances", oOtherfireball);
				ds_map_add(instances, fire_id, f);
			} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
				if (fidd != fire_id) && (instance_exists(find_fire)) {

					//Assign this data to the correct player
					find_fire.my_id =			fire_id;
					find_fire.x =				fire_x;
					find_fire.y =				fire_y;
					find_fire.sprite_index =	fire_spr;
				
					find_fire.image_alpha =		global.onlinealpha;
				}
			}
		break;
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
	
		#region Firing
		case network.hat:
			//When we get the packet of someone shooting, we need to read the data and perform a few actions
			//First we need to get the bullet's ID before anything
			var hat_id = buffer_read(packet, buffer_u16);
			var player_id = buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}
		
			var find_hat = ds_map_find_value(instances, hat_id);		//Find the instance ID of the player through the instance map
		
			var hat_room =		buffer_read(packet, buffer_s8);
			if hat_room != room {break;}
			
			var hat_x =			buffer_read(packet, buffer_s16);
			var hat_y =			buffer_read(packet, buffer_s16);
			var hat_xstr =		buffer_read(packet, buffer_s16);
			var hat_ystr =		buffer_read(packet, buffer_s16);
			var hat_ind =		buffer_read(packet, buffer_u16);	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
		
			if (is_undefined(find_hat)) {
				var f = instance_create_layer(hat_xstr, hat_ystr, "Instances", oOtherhatthrow);
				//fidd = find_hat.my_id;
				ds_map_add(instances, hat_id, f);
			} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
				if (fidd != hat_id) && (instance_exists(find_hat)) {

					//Assign this data to the correct player
					find_hat.my_id =			hat_id;
					find_hat.myroom =			hat_room;
					find_hat.x =				hat_x;
					find_hat.y =				hat_y;
					find_hat.image_index =		hat_ind;	
				
					find_hat.image_alpha =		global.onlinealpha;
				}
			}
		break;
		case network.hatd:
			//read the ID of the player to disconnect
			var disconnect_id = buffer_read(packet, buffer_u16);
		
			//find the instance that corresponds to that ID
			var disconnect_hat = ds_map_find_value(instances, disconnect_id);
		
			//if that player exists, find and destroy them for all clients
			if (disconnect_id != hidd) {
				if (!is_undefined(disconnect_hat)) {
					//destaroy the player disconnecting
					with (disconnect_hat) {instance_destroy();}	
				}
			}
		break;
		#endregion
	
		#region Boomboxing
		case network.boombox:
			var player_id = buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}
		
			var bbox_xstr =		buffer_read(packet, buffer_s16);
			var bbox_ystr =		buffer_read(packet, buffer_s16);//var fire_face =		buffer_read(packet, buffer_s8);	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			var player_room =	buffer_read(packet, buffer_s8);
		
			if !instance_exists(oBoombox) {
				var bbox = instance_create_layer(bbox_xstr, bbox_ystr, "Instances", oBoombox);
			
				bbox.myroom =			player_room;
				bbox.my_id =			player_id;
			
				bbox.notyours =			true;
				bbox.image_alpha =		global.onlinealpha;
			}
		break;
		case network.boomboxd:
			with(oBoombox) {if notyours && my_id != global.clientid {instance_destroy();}}
	 	break;
		#endregion
		
		case network.explosion:
			var player_id = buffer_read(packet, buffer_u16);
			if player_id = global.clientid {break;}
		
			var player_char =	buffer_read(packet, buffer_string);
			var player_room =	buffer_read(packet, buffer_s8);
			if player_room != room {break;}
			var bd_xstr =		buffer_read(packet, buffer_s16);
			var bd_ystr =		buffer_read(packet, buffer_s16);
			var bd_palind =		buffer_read(packet, buffer_s8);
			var bd_palspr =		buffer_read(packet, buffer_s8);
			var ex_xstr =		buffer_read(packet, buffer_s16);
			var ex_ystr =		buffer_read(packet, buffer_s16);
		
			var bd = instance_create_depth(bd_xstr,bd_ystr,1,oMariodead)
			bd.direction = irandom(360);
			bd.hspd = choose(1,-1)*irandom(5);
			bd.spr = ms("sMario_s_die", player_char);
			bd.mario_spr = player_char;
			bd.palind = bd_palind;
			bd.palspr = bd_palspr;
		
			var ins = instance_create_depth(ex_xstr,ex_ystr,-9999,oBLAST)
			ins.image_xscale = 0.2
			ins.image_yscale = 0.2
			ins.x -= (sprite_width*0.2)/2
			ins.y -= (sprite_height*0.2)/2
		break;
		
		case network.starspawn:
			var star_facing = buffer_read(packet, buffer_s8);
			var spawner_id = buffer_read(packet, buffer_s8);
			var spawner_alarm = buffer_read(packet, buffer_u16);
			
			var spawner = noone;
			
			with(oSuperstarspawn) 
			{
				if spawner_id == idd
				{spawner = id;}	
			}
			
			if instance_exists(spawner) {
				var star = instance_create_layer(spawner.x, spawner.y, "Instances", oSuperstar);
			
				star.facing =	star_facing;
				spawner.alarm[0] = spawner_alarm;
			}
		break;
	} 
} catch(q) {
	//show_message("gmSMB found an network buff mistake, the game will have to be restarted.");
	
	show_error("Error: " + string(q), false);
	//disconnecttt();
	
	exit;
}