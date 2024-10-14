if !instance_exists(m) {instance_destroy()}
else {
if m.powerup != "c" {instance_destroy()}

x = (m.image_xscale)? m.bbox_left+2 : m.bbox_right-2;
y = m.bbox_top
depth = m.depth+50
image_alpha = m.image_alpha
}

if instance_exists(oClient) && instance_exists(oClient.Player)
{
	//Send Our Data
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.mcape);	
	buffer_write(buff, buffer_u16, oClient.Player.my_id);
	buffer_write(buff, buffer_s8, room);
	buffer_write(buff, buffer_s16, round(x));
	buffer_write(buff, buffer_s16, round(y));
	buffer_write(buff, buffer_f16, image_xscale*scale);						
	buffer_write(buff, buffer_u16, spr);
	buffer_write(buff, buffer_u16, depth);
	buffer_write(buff, buffer_u16, ind);
	buffer_write(buff, buffer_u8, m.palindex);
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
}