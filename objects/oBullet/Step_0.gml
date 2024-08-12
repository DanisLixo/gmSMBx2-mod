image_angle = direction

if instance_exists(oClient) {
	var bullet_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(bullet_buff, buffer_seek_start, 0);
	buffer_write(bullet_buff, buffer_u8, network.shoot);
	buffer_write(bullet_buff, buffer_u16, my_id);
	buffer_write(bullet_buff, buffer_s16, round(x));
	buffer_write(bullet_buff, buffer_s16, round(y));
	buffer_write(bullet_buff, buffer_s16, direction);
	
	network_send_packet(oClient.client, bullet_buff, buffer_tell(bullet_buff));
	buffer_delete(bullet_buff);
}

if !onview()
{instance_destroy();}

if place_meeting(bbox_left,y,oCol) && place_meeting(bbox_right,y,oCol) or instance_place(x,y,oBowser)
{
	instance_destroy()
}
