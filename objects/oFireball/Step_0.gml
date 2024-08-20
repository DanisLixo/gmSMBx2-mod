if instance_exists(oClient) {
	var fire_buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(fire_buff, buffer_seek_start, 0);
	buffer_write(fire_buff, buffer_u8, network.fire);
	buffer_write(fire_buff, buffer_u16, my_id);
	buffer_write(fire_buff, buffer_u16, oClient.Player.my_id);
	buffer_write(fire_buff, buffer_s16, round(x));
	buffer_write(fire_buff, buffer_s16, round(y));
	buffer_write(fire_buff, buffer_s16, round(xstart));
	buffer_write(fire_buff, buffer_s16, round(ystart));
	buffer_write(fire_buff, buffer_u16, sprite_index);
	buffer_write(fire_buff, buffer_u16, image_index);
	//buffer_write(fire_buff, buffer_s8, facing);
	
	network_send_packet(oClient.client, fire_buff, buffer_tell(fire_buff));
	buffer_delete(fire_buff);
	
	oClient.fidd = my_id;
}

if m.char = "Dawn"
{
	if place_meeting(x,y+1,oCol) {
		if global.abilities {
			boings += 1
			if boings >= 1 {
				vspd = vspd*-boings;
				if boings >= 3 {image_speed *= 2}
			}
		}
		else {vspd = -2.5;}
	}
}
if place_meeting(x,y+1,oCol) and (m.char != "Dawn" || global.abilities = false)
{vspd = -2.5;}

hspd = facing*4

collide();

if place_meeting(x+facing,y,oCol) && !collision_rectangle(bbox_left-16,bbox_top-16,bbox_right+16,bbox_bottom+16,oElevator,false,true)
{instance_destroy(); sfx(sndBump,1);}
if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).stomptype = 2
{instance_destroy(); sfx(sndBump,1);}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp and instance_place(x,y,oParenemy).stomptype != 2
{
	sfx(sndKick,1);
	if instance_place(x,y,oParenemy).object_index = oGoomba {points(100,true)}
	else if instance_place(x,y,oParenemy).object_index = oHammerbro {points(1000,true)}
	else {points(200,true)}
	instance_place(x,y,oParenemy).vspd = -2;
	instance_place(x,y,oParenemy).state = es.die;
	instance_place(x,y,oParenemy).dieface = facing
	instance_destroy();
}
if instance_place(x,y,oPiranha)
{
	sfx(sndKick,1);
	points(200,true)
	instance_destroy(instance_place(x,y,oPiranha));
	instance_destroy();
}

if instance_place(x,y,oBowser)
{
	instance_place(x,y,oBowser).life -= 1
	instance_destroy();
}

if !onview()
{instance_destroy(id,false);}