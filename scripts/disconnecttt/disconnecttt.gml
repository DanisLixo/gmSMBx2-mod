
function disconnecttt() {
	if object_index == oPaused {instance_activate_object(oClient);}
	var disconnected = false
	if (!instance_exists(oClient)) {
		show_message("You're no longer connected.");	
	} else {
		if (instance_exists(oClient.Player)) {
			
			var dis_buff = buffer_create(8, buffer_grow, 1);
			buffer_seek(dis_buff, buffer_seek_start, 0);
			buffer_write(dis_buff, buffer_u8, network.disconnect);
			buffer_write(dis_buff, buffer_u16, oClient.Player.my_id);
			buffer_write(dis_buff, buffer_string, global.username);
			
			network_send_packet(oClient.client, dis_buff, buffer_tell(dis_buff));
			buffer_delete(dis_buff);
			
			var dis_buff = buffer_create(8, buffer_grow, 1);
			buffer_seek(dis_buff, buffer_seek_start, 0);
			buffer_write(dis_buff, buffer_u8, network.mcaped);	
			buffer_write(dis_buff, buffer_u16, oClient.Player.my_id);
			buffer_write(dis_buff, buffer_string, global.username);
			
			network_send_packet(oClient.client, dis_buff, buffer_tell(dis_buff));
			buffer_delete(dis_buff);
			
			var dis_buff = buffer_create(8, buffer_grow, 1);
			buffer_seek(dis_buff, buffer_seek_start, 0);
			buffer_write(dis_buff, buffer_u8, network.mgund);
			buffer_write(dis_buff, buffer_u16, oClient.Player.my_id);
			buffer_write(dis_buff, buffer_string, global.username);
			
			network_send_packet(oClient.client, dis_buff, buffer_tell(dis_buff));
			buffer_delete(dis_buff);
			
			disconnected = true;
			
		} else {
			show_message("The player existing is not!");	
		}
	}
}
