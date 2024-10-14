if instance_exists(oClient) {
	if myroom == room 
	{instance_create_depth(x-8,y-8,depth,oBlow);
	instance_create_depth(x+8,y-8,depth,oBlow);}
	var bbox_buff = buffer_create(4, buffer_grow, 1);
	buffer_seek(bbox_buff, buffer_seek_start, 0);
	buffer_write(bbox_buff, buffer_u8, network.boomboxd);
	
	network_send_packet(oClient.client, bbox_buff, buffer_tell(bbox_buff));
	buffer_delete(bbox_buff);
	
	oClient.fidd = my_id;
} else {instance_create_depth(x-8,y-8,depth,oBlow);
	instance_create_depth(x+8,y-8,depth,oBlow);}

audio_stop_sound(sndBreakdancemusic);