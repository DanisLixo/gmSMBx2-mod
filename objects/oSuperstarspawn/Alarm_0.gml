var alar = choose(room_speed*8,room_speed*12);

if instance_exists(oClient)
{
	//Send Our Data
	var buff = buffer_create(64, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.starspawn);
	buffer_write(buff, buffer_s8, facer);
	buffer_write(buff, buffer_s8, idd);
	buffer_write(buff, buffer_u16, alar);
	
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
}

facer = choose(-1,1);