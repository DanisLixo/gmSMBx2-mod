var m = instance_place(x,y,oMario);

if m && (m.state = ps.flagpolefinish or m.state = ps.castleending)
{
	if global.level = 4
	{
		if global.waiting 
		{
			if instance_exists(oClient) {
	
				var finbuff = buffer_create(4, buffer_grow, 1);
				buffer_seek(finbuff, buffer_seek_start, 0);
				buffer_write(finbuff, buffer_u8, network.finished);		//Send the join ID
			
				network_send_packet(oClient.client, finbuff, buffer_tell(finbuff));
				buffer_delete(finbuff);
				
				m.state = ps.normal;
			}
		} else {
			global.level = 1;
			global.world += 1;
			room_goto(rmLeveltransition)
		}
	 }
}
if place_meeting(x,y,oToad)
{
	oToad.image_alpha = 0; oToad.invincible = -2;
}
