if instance_exists(oClient)
{
	var dis_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(dis_buff, buffer_seek_start, 0);
	buffer_write(dis_buff, buffer_u8, network.hatd);
	buffer_write(dis_buff, buffer_u16, my_id);
	network_send_packet(oClient.client, dis_buff, buffer_tell(dis_buff));
	buffer_delete(dis_buff);
	
	oClient.hidd = 0;
}