if onview()
{
	var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
	ins.image_xscale = 0.2
	ins.image_yscale = 0.2
	
	ins.x -= (sprite_width*0.2)/2
	ins.y -= (sprite_height*0.2)/2
}

if instance_exists(oClient) {
	var dis_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(dis_buff, buffer_seek_start, 0);
	buffer_write(dis_buff, buffer_u8, network.shootd);
	buffer_write(dis_buff, buffer_u16, my_id);
	network_send_packet(oClient.client, dis_buff, buffer_tell(dis_buff));
	buffer_delete(dis_buff);
	
	oClient.bidd = 0;
}

