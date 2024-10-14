// Handle packets coming from clients

function server_data() {

	var packet = async_load[? "buffer"];		//Load the ID of the buffer that was sent to us
	var socket = async_load[? "id"];			//Get the socket of the client who sent this packet
	buffer_seek(packet, buffer_seek_start, 0);  //Make sure we are at start of the incoming packet
	
	var PACKET_ID = buffer_read(packet, buffer_u8); //Read the first value of the packet, which is the network enum
	
	switch (PACKET_ID) {
		
		#region Latency
		case network.latency:
			//Get the contents of the packet
			var _time = buffer_read(packet, buffer_u32);
			
			//Send this back to the client that sent it
			var lbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(lbuff, buffer_seek_start, 0);
			buffer_write(lbuff, buffer_u8, network.latency);
			buffer_write(lbuff, buffer_u32, _time);
			
			network_send_packet(socket, lbuff, buffer_tell(lbuff));
			buffer_delete(lbuff);
		break;
		
		case network.join:
			//read the contents of the packet
			var client_idd = buffer_read(packet, buffer_u16);
			var player_idd = buffer_read(packet, buffer_u16);
			var player_user = buffer_read(packet, buffer_string);
			
			//add these to the server's instance map
			ds_map_add(server_instances, client_idd, player_idd);
			
			//send these back to all connected clients
			var jbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(jbuff, buffer_seek_start, 0);
			buffer_write(jbuff, buffer_u8, network.join);	//remeber to send the id first
			buffer_write(jbuff, buffer_u16, client_idd);
			buffer_write(jbuff, buffer_string, player_user);
			buffer_write(jbuff, buffer_u16, ds_list_size(total_players));

			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), jbuff, buffer_tell(jbuff));	
			}
			//Delete the join buffer after it was sent
			buffer_delete(jbuff);
		break;
		#endregion
		
		#region Movement
		case network.move:			//If we recieve the move enum, this event will occur
			var player_idd =			buffer_read(packet, buffer_u16);	//Read the contents of the buffer IN THE ORDER IT WAS SENT
			var player_x =			buffer_read(packet, buffer_s16);
			var player_y =			buffer_read(packet, buffer_s16);
			var player_xscale =		buffer_read(packet, buffer_f16);
			var player_alpha =		buffer_read(packet, buffer_f16);
			var player_spr =		buffer_read(packet, buffer_u16);
			var player_depth =		buffer_read(packet, buffer_u16);
			var player_ind =		buffer_read(packet, buffer_u16);
			var player_star =		buffer_read(packet, buffer_s16);
			var player_user =		buffer_read(packet, buffer_string);
			var player_pal =		buffer_read(packet, buffer_u8);
			var player_palspr =		buffer_read(packet, buffer_u16);
			var player_room =		buffer_read(packet, buffer_s8);
			var player_stars =		buffer_read(packet, buffer_s8);
			
			//Now take all those variables, and send them to all of the other clients
			//Send them in the same order they were read above
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.move);
			buffer_write(buff, buffer_u16, player_idd);
			buffer_write(buff, buffer_s16, player_x);
			buffer_write(buff, buffer_s16, player_y);
			buffer_write(buff, buffer_f16, player_xscale);
			buffer_write(buff, buffer_f16, player_alpha);
			buffer_write(buff, buffer_u16, player_spr);
			buffer_write(buff, buffer_u16, player_depth);
			buffer_write(buff, buffer_u16, player_ind);
			buffer_write(buff, buffer_s16, player_star);
			buffer_write(buff, buffer_string, player_user);
			buffer_write(buff, buffer_u8, player_pal);
			buffer_write(buff, buffer_u16, player_palspr);
			buffer_write(buff, buffer_s8, player_room);
			buffer_write(buff, buffer_s8, player_stars);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		#endregion
		
		#region Movement
		case network.mcape:			//If we recieve the move enum, this event will occur
			var player_idd =	buffer_read(packet, buffer_u16);
			var player_room =	buffer_read(packet, buffer_s8);
			var cape_x =		buffer_read(packet, buffer_s16);
			var cape_y =		buffer_read(packet, buffer_s16);
			var cape_xscale =	buffer_read(packet, buffer_f16);
			var cape_spr =		buffer_read(packet, buffer_u16);
			var cape_depth =	buffer_read(packet, buffer_u16);
			var cape_ind =		buffer_read(packet, buffer_u16);
			var cape_pal =		buffer_read(packet, buffer_u8);
			
			//Now take all those variables, and send them to all of the other clients
			//Send them in the same order they were read above
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.mcape);
			buffer_write(buff, buffer_u16, player_idd);
			buffer_write(buff, buffer_s8, player_room);
			buffer_write(buff, buffer_s16, cape_x);
			buffer_write(buff, buffer_s16, cape_y);
			buffer_write(buff, buffer_f16, cape_xscale);						
			buffer_write(buff, buffer_u16, cape_spr);
			buffer_write(buff, buffer_u16, cape_depth);
			buffer_write(buff, buffer_u16, cape_ind);
			buffer_write(buff, buffer_u8, cape_pal);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		case network.mcaped:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			
			//write to new buffer
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.mcaped);
			buffer_write(dbuff, buffer_u16, discon_id);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			
			buffer_delete(dbuff);
		break;
		#endregion
		
		#region Movement
		case network.mgun:			//If we recieve the move enum, this event will occur
			var player_idd =	buffer_read(packet, buffer_u16);	//Read the contents of the buffer IN THE ORDER IT WAS SENT
			var gun_room =		buffer_read(packet, buffer_s8);
			var gun_x =			buffer_read(packet, buffer_s16);
			var gun_y =			buffer_read(packet, buffer_s16);
			var gun_yscale =	buffer_read(packet, buffer_f16);
			var gun_spr =		buffer_read(packet, buffer_u16);
			var gun_dir =		buffer_read(packet, buffer_f16);
			var gun_depth =		buffer_read(packet, buffer_s16);
			var gun_ind =		buffer_read(packet, buffer_u16);
			
			//Now take all those variables, and send them to all of the other clients
			//Send them in the same order they were read above
			var buff = buffer_create(128, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.mgun);
			buffer_write(buff, buffer_u16, player_idd);
			buffer_write(buff, buffer_s8, gun_room);
			buffer_write(buff, buffer_s16, gun_x);
			buffer_write(buff, buffer_s16, gun_y);
			buffer_write(buff, buffer_f16, gun_yscale);
			buffer_write(buff, buffer_u16, gun_spr);
			buffer_write(buff, buffer_f16, gun_dir);
			buffer_write(buff, buffer_s16, gun_depth);
			buffer_write(buff, buffer_u16, gun_ind);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		case network.mgund:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			
			//write to new buffer
			var dbuff = buffer_create(8, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.mgund);
			buffer_write(dbuff, buffer_u16, discon_id);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			
			buffer_delete(dbuff);
		break;
		#endregion
		
		#region Shooting
		case network.shoot:
			//Read the data that was sent to us, and store it in temporary variables
			var bullet_idd =		buffer_read(packet, buffer_u16);
			var player_idd =		buffer_read(packet, buffer_u16);	//Remember *** Read in the same order it was sent!
			var player_room =		buffer_read(packet, buffer_s8);
			var bullet_x =			buffer_read(packet, buffer_s16);
			var bullet_y =			buffer_read(packet, buffer_s16);
			var bullet_xstr =		buffer_read(packet, buffer_s16);
			var bullet_ystr =		buffer_read(packet, buffer_s16);
			var bullet_direction =	buffer_read(packet, buffer_u16);
			var bullet_sprite	=	buffer_read(packet, buffer_u16);
			
			//Now send this data back to all of the clients currently connected to the server
			var bullet_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(bullet_buff, buffer_seek_start, 0);
			buffer_write(bullet_buff, buffer_u8, network.shoot); //Remember to send the packet ID first!
			buffer_write(bullet_buff, buffer_u16, bullet_idd);		//Now send in the same order you read the data
			buffer_write(bullet_buff, buffer_u16, player_idd);
			buffer_write(bullet_buff, buffer_s8, player_room);
			buffer_write(bullet_buff, buffer_s16, bullet_x);
			buffer_write(bullet_buff, buffer_s16, bullet_y);
			buffer_write(bullet_buff, buffer_s16, bullet_xstr);
			buffer_write(bullet_buff, buffer_s16, bullet_ystr);
			buffer_write(bullet_buff, buffer_u16, bullet_direction);
			buffer_write(bullet_buff, buffer_u16, bullet_sprite);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), bullet_buff, buffer_tell(bullet_buff));	
			}
			
			//Delete the buffer after sending the data
			buffer_delete(bullet_buff);
		break;
		case network.shootd:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			
			//write to new buffer
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.shootd);
			buffer_write(dbuff, buffer_u16, discon_id);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			
			buffer_delete(dbuff);
		break;
		#endregion
		
		#region Firing
		case network.fire:
			//Read the data that was sent to us, and store it in temporary variables
			var fire_idd =		buffer_read(packet, buffer_u16);
			var player_idd =	buffer_read(packet, buffer_u16);
			var player_room =	buffer_read(packet, buffer_s8);
			var fire_x =		buffer_read(packet, buffer_s16);
			var fire_y =		buffer_read(packet, buffer_s16);
			var fire_xstr =		buffer_read(packet, buffer_s16);
			var fire_ystr =		buffer_read(packet, buffer_s16);
			var fire_spr =		buffer_read(packet, buffer_u16);
			var fire_ind =		buffer_read(packet, buffer_s16);
			//var fire_face =		buffer_read(packet, buffer_s8);

			//Now send this data back to all of the clients currently connected to the server
			var fire_buff = buffer_create(64, buffer_grow, 1);
			buffer_seek(fire_buff, buffer_seek_start, 0);
			buffer_write(fire_buff, buffer_u8, network.fire); //Remember to send the packet ID first!
			buffer_write(fire_buff, buffer_u16, fire_idd);		//Now send in the same order you read the data
			buffer_write(fire_buff, buffer_u16, player_idd);	//Now send in the same order you read the data
			buffer_write(fire_buff, buffer_s8, player_room);	
			buffer_write(fire_buff, buffer_s16, fire_x);
			buffer_write(fire_buff, buffer_s16, fire_y);
			buffer_write(fire_buff, buffer_s16, fire_xstr);
			buffer_write(fire_buff, buffer_s16, fire_ystr);
			buffer_write(fire_buff, buffer_u16, fire_spr);
			buffer_write(fire_buff, buffer_s16, fire_ind);

			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), fire_buff, buffer_tell(fire_buff));	
			}
			
			//Delete the buffer after sending the data
			buffer_delete(fire_buff);
		break;
		case network.fired:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			
			//write to new buffer
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.fired);
			buffer_write(dbuff, buffer_u16, discon_id);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			
			buffer_delete(dbuff);
		break;
		#endregion
		
		#region Disconnect
		case network.boombox:
			//read the value
			var player_idd = buffer_read(packet, buffer_u16);
			var xstr = buffer_read(packet, buffer_s16);
			var ystr = buffer_read(packet, buffer_s16);
			var my_room = buffer_read(packet, buffer_s8);
			
			//write to new buffer
			var bbox_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(bbox_buff, buffer_seek_start, 0);
			buffer_write(bbox_buff, buffer_u8, network.boombox);
			buffer_write(bbox_buff, buffer_u16, player_idd);
			buffer_write(bbox_buff, buffer_s16, xstr);
			buffer_write(bbox_buff, buffer_s16, ystr);
			buffer_write(bbox_buff, buffer_s8, my_room);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), bbox_buff, buffer_tell(bbox_buff));	
			}
			
			buffer_delete(bbox_buff);
		break;
		case network.boomboxd:
			//read the value
			
			//write to new buffer
			var bbox_buff = buffer_create(4, buffer_grow, 1);
			buffer_seek(bbox_buff, buffer_seek_start, 0);
			buffer_write(bbox_buff, buffer_u8, network.boomboxd);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), bbox_buff, buffer_tell(bbox_buff));	
			}
			
			buffer_delete(bbox_buff);
		break;
		#endregion
		
		#region Firing
		case network.hat:
			//Read the data that was sent to us, and store it in temporary variables
			var hat_idd =		buffer_read(packet, buffer_u16);	//Remember *** Read in the same order it was sent!
			var player_idd =	buffer_read(packet, buffer_u16);	//Remember *** Read in the same order it was sent!
			var hat_room =		buffer_read(packet, buffer_s8);
			var hat_x =			buffer_read(packet, buffer_s16);
			var hat_y =			buffer_read(packet, buffer_s16);
			var hat_xstr =		buffer_read(packet, buffer_s16);
			var hat_ystr =		buffer_read(packet, buffer_s16);
			var hat_ind =		buffer_read(packet, buffer_u16);

			//Now send this data back to all of the clients currently connected to the server
			var hat_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(hat_buff, buffer_seek_start, 0);
			buffer_write(hat_buff, buffer_u8, network.hat); //Remember to send the packet ID first!
			buffer_write(hat_buff, buffer_u16, hat_idd);	//Now send in the same order you read the data
			buffer_write(hat_buff, buffer_u16, player_idd);	
			buffer_write(hat_buff, buffer_s8, hat_room);
			buffer_write(hat_buff, buffer_s16, hat_x);
			buffer_write(hat_buff, buffer_s16, hat_y);
			buffer_write(hat_buff, buffer_s16, hat_xstr);
			buffer_write(hat_buff, buffer_s16, hat_ystr);
			buffer_write(hat_buff, buffer_u16, hat_ind);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), hat_buff, buffer_tell(hat_buff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(hat_buff);
		break;
		case network.hatd:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			
			//write to new buffer
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.hatd);
			buffer_write(dbuff, buffer_u16, discon_id);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			buffer_delete(dbuff);
		break;
		#endregion
		
		case network.explosion:
			//read the value
			var player_idd = buffer_read(packet, buffer_u16);
			var player_char = buffer_read(packet, buffer_string);
			var my_room = buffer_read(packet, buffer_s8);
			var bd_xstr = buffer_read(packet, buffer_s16);
			var bd_ystr = buffer_read(packet, buffer_s16);
			var bd_palind = buffer_read(packet, buffer_s8);
			var bd_palspr = buffer_read(packet, buffer_s8);
			var ex_xstr = buffer_read(packet, buffer_s16);
			var ex_ystr = buffer_read(packet, buffer_s16);
			
			//write to new buffer
			var bbox_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(bbox_buff, buffer_seek_start, 0);
			buffer_write(bbox_buff, buffer_u8, network.explosion);
			buffer_write(bbox_buff, buffer_u16, player_idd);
			buffer_write(bbox_buff, buffer_string, player_char);
			buffer_write(bbox_buff, buffer_s8, my_room);
			buffer_write(bbox_buff, buffer_s16, bd_xstr);
			buffer_write(bbox_buff, buffer_s16, bd_ystr);
			buffer_write(bbox_buff, buffer_s8, bd_palind);
			buffer_write(bbox_buff, buffer_s8, bd_palspr);
			buffer_write(bbox_buff, buffer_s16, ex_xstr);
			buffer_write(bbox_buff, buffer_s16, ex_ystr);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), bbox_buff, buffer_tell(bbox_buff));	
			}
			
			buffer_delete(bbox_buff);
		break;
		#region Chat
		case network.chat:
			//Get the string from the buffer
			var text_message = buffer_read(packet, buffer_string);
			
			ds_list_add(global.CHAT, text_message);	
			
			//Send that string back to all of the other clients
			var tbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(tbuff, buffer_seek_start, 0);
			buffer_write(tbuff, buffer_u8, network.chat);	//send our chat ID so clients know what the packet is
			buffer_write(tbuff, buffer_string, text_message); //send the message string
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), tbuff, buffer_tell(tbuff));	
			}
			//Delete the chat buffer after it was sent
			buffer_delete(tbuff);
		break;
		#endregion
		#region Where are them all?
		case network.sync:
			var lvlbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(lvlbuff, buffer_seek_start, 0);
			buffer_write(lvlbuff, buffer_u8, network.sync);	//send our level so clients know what the packet is
			buffer_write(lvlbuff, buffer_bool, global.race);	
			buffer_write(lvlbuff, buffer_u8, global.nextlvltimer);	
			buffer_write(lvlbuff, buffer_bool, global.schutmode);	
			buffer_write(lvlbuff, buffer_bool, global.rtxmode);
			buffer_write(lvlbuff, buffer_bool, global.commandenys);
			buffer_write(lvlbuff, buffer_u8, global.arena);	
			buffer_write(lvlbuff, buffer_bool, global.challenge);
			buffer_write(lvlbuff, buffer_bool, global.pvp);
			buffer_write(lvlbuff, buffer_bool, global.waiting);
			buffer_write(lvlbuff, buffer_bool, global.extra);
			buffer_write(lvlbuff, buffer_bool, global.playercol);
			buffer_write(lvlbuff, buffer_bool, global.abilities);
			buffer_write(lvlbuff, buffer_u8, global.world);	
			buffer_write(lvlbuff, buffer_u8, global.level);	
			buffer_write(lvlbuff, buffer_bool, global.teleport_tolvl);	
			
			network_send_packet(ds_list_find_value(total_players, ds_list_size(total_players)-1), lvlbuff, buffer_tell(lvlbuff));	
			//Delete the chat buffer after it was sent
			buffer_delete(lvlbuff)
		break;
		#endregion
				
		#region Disconnect
		case network.disconnect:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			var user = buffer_read(packet, buffer_string);
			
			//write to new buffer
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.disconnect);
			buffer_write(dbuff, buffer_u16, discon_id);
			buffer_write(dbuff, buffer_string, user);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			//remove them from the list
			ds_list_delete(total_players, ds_list_find_index(total_players, socket));
		break;
		#endregion

		#region Where are them all?
		case network.raceplace:
			var packet = async_load[? "buffer"];
			buffer_seek(packet, buffer_seek_start, 0);

			var PACKET_ID = buffer_read(packet, buffer_u8);
			
			var world = buffer_read(PACKET_ID, buffer_u8);	
			var level = buffer_read(PACKET_ID, buffer_u8);	
			
			global.world = world
			global.level = level
			
			var wbuff = buffer_create(6, buffer_grow, 1);
			buffer_seek(wbuff, buffer_seek_start, 0);
			buffer_write(wbuff, buffer_u8, network.raceplace);
			buffer_write(wbuff, buffer_u8, world);
			buffer_write(wbuff, buffer_u8, level);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), wbuff, buffer_tell(wbuff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(wbuff);
		break;
		#endregion

		#region Race results
		case network.sendraceresult:
			var realcounter =	buffer_read(packet, buffer_u16);
			var stringtime =	buffer_read(packet, buffer_string);
			var username =		buffer_read(packet, buffer_string);
		
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.sendraceresult);
			buffer_write(buff, buffer_u16, realcounter);
			buffer_write(buff, buffer_string, stringtime);
			buffer_write(buff, buffer_string, username);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		
		case network.finished:
			var buff = buffer_create(8, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.finished);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		#endregion
		
		case network.starspawn:
			var star_facing =	buffer_read(packet, buffer_s8);
			var spawner_id =	buffer_read(packet, buffer_s8);
			var spawner_alarm =	buffer_read(packet, buffer_u16);
		
			var buff = buffer_create(4, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.starspawn);
			buffer_write(buff, buffer_s8, star_facing);
			buffer_write(buff, buffer_s8, spawner_id);
			buffer_write(buff, buffer_u16, spawner_alarm);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
	}
}
