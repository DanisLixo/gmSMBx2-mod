if instance_exists(oClient) && instance_exists(oClient.Player) 
{
	var bullet_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(bullet_buff, buffer_seek_start, 0);
	buffer_write(bullet_buff, buffer_u8, network.shoot);
	buffer_write(bullet_buff, buffer_u16, my_id);
	buffer_write(bullet_buff, buffer_u16, oClient.Player.my_id);
	buffer_write(bullet_buff, buffer_s8, room);
	buffer_write(bullet_buff, buffer_s16, round(x));
	buffer_write(bullet_buff, buffer_s16, round(y));
	buffer_write(bullet_buff, buffer_s16, round(xstart));
	buffer_write(bullet_buff, buffer_s16, round(ystart));
	buffer_write(bullet_buff, buffer_u16, direction);
	buffer_write(bullet_buff, buffer_u16, spr);
	
	network_send_packet(oClient.client, bullet_buff, buffer_tell(bullet_buff));
	buffer_delete(bullet_buff);
	
	oClient.bidd = my_id;
}

image_angle = direction

if !onview()
{instance_destroy();}

if place_meeting(bbox_left,y,oCol) && place_meeting(bbox_right,y,oCol)
{
	instance_destroy()
}

if instance_place(floor(x),floor(y),oOtherplayer) {if global.pvp {instance_destroy()}}