if !instance_exists(m) {instance_destroy()}

if !onview()
{back = true;}

if instance_exists(oClient) && instance_exists(oClient.Player)
{
	var hat_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(hat_buff, buffer_seek_start, 0);
	buffer_write(hat_buff, buffer_u8, network.hat);
	buffer_write(hat_buff, buffer_u16, my_id);
	buffer_write(hat_buff, buffer_u16, oClient.Player.my_id);
	buffer_write(hat_buff, buffer_s8, room);
	buffer_write(hat_buff, buffer_s16, round(x));
	buffer_write(hat_buff, buffer_s16, round(y));
	buffer_write(hat_buff, buffer_s16, round(xstart));
	buffer_write(hat_buff, buffer_s16, round(ystart));
	buffer_write(hat_buff, buffer_s16, image_index);
	
	network_send_packet(oClient.client, hat_buff, buffer_tell(hat_buff));
	buffer_delete(hat_buff);
	
	oClient.hidd = my_id;
}

hspd = facing*4

if global.hatblockspambug {
	if instance_place(bbox_left-1,bbox_bottom+1,oParblock) || instance_place(bbox_right+1,bbox_top-1,oParblock)
	{
		sfx(sndKick,1);
		points(50,true,false)
		if instance_nearest(x,y,oParblock).blockstate != -1
		{instance_nearest(x,y,oParblock).blockstate = 1;}
		instance_nearest(x,y,oParblock).triggerbreak = true;
		if !back facing = -facing
		throwed = true
	}
} else {
	if instance_place(x+facing,y,oParblock)
	{
		sfx(sndKick,1);
		points(50,true,false)
		if instance_nearest(x,y,oParblock).blockstate != -1
		{instance_nearest(x,y,oParblock).blockstate = 1;}
		instance_nearest(x,y,oParblock).triggerbreak = true;
		if !back facing = -facing
		throwed = true
	}
}

if place_meeting(x+facing,y,oCol)
{facing = -facing; sfx(sndBump,1); throwed = true}

if place_meeting(x+facing,y,oMario) and throwed = true {
	if m.powerup != "f" {pufunc();}
	else {instance_destroy();}
}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp
{
	sfx(sndKick,1);
	points(200,true)
	instance_place(x,y,oParenemy).vspd = -2;
	instance_place(x,y,oParenemy).state = es.die;
	instance_place(x,y,oParenemy).dieface = facing
	if !back facing = -facing
	throwed = true
}
if instance_place(x,y,oPiranha)
	{
		sfx(sndKick,1);
		points(200,true)
		instance_destroy(instance_place(x,y,oPiranha));
		if !back facing = -facing
		throwed = true
}
if instance_place(x,y,oBowser)
	{
		sfx(sndKick,1);
		points(200,true)
		instance_place(x,y,oBowser).life--;
		if !back facing = -facing
		throwed = true
}
if instance_place(x,y,oFakeBowser)
	{
		sfx(sndKick,1);
		points(200,true)
		instance_place(x,y,oFakeBowser).life--;
		if !back facing = -facing
		throwed = true
}

if global.pvp and instance_place(floor(x),floor(y),oOtherplayer) 
{if !back facing = -facing; throwed = true;}

if back {
	if instance_place(bbox_left-1,bbox_bottom+1,oBrickblock) || instance_place(bbox_right+1,bbox_top-1,oBrickblock)
	{
		sfx(sndKick,1);
		points(50,true,false)
		instance_nearest(x,y,oParblock).triggerbreak = true;
	}
	
	facing = -sign(floor((m.x)-x));
	throwed = true;
	var distance_x = ((m.x)-x); hspd = (distance_x/50) + 2*sign(floor((m.x)-x));
	var distance_y = (m.bbox_top); vspd = (distance_y/50) + 2*sign(floor((m.y)-y));
	expire++
	if expire >= 180 {instance_destroy()}
}

collide();