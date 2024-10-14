if instance_exists(oClient) && instance_exists(oClient.Player)
{
	//Send Our Data
	var buff = buffer_create(16, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.mcaped);	
	buffer_write(buff, buffer_u16, oClient.Player.my_id);
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
}