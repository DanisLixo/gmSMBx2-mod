vspd = -4

hspd = 3

image_xscale = 0.45;
image_yscale = 0.45;

instance_create_depth(x-8,y-8,depth-1,oBlow);
instance_create_depth(x+8,y-8,depth-1,oBlow);

notyours = false;

myroom = room
my_id = global.clientid;

if instance_exists(oClient) && instance_exists(oClient.Player) {
	var bbox_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(bbox_buff, buffer_seek_start, 0);
	buffer_write(bbox_buff, buffer_u8, network.boombox);
	buffer_write(bbox_buff, buffer_u16, oClient.Player.my_id);
	buffer_write(bbox_buff, buffer_s16, xstart);
	buffer_write(bbox_buff, buffer_s16, ystart);
	buffer_write(bbox_buff, buffer_s8, myroom);
	
	network_send_packet(oClient.client, bbox_buff, buffer_tell(bbox_buff));
	buffer_delete(bbox_buff);
}