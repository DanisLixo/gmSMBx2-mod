if instance_exists(oRacemanager) && !(oRacemanager.start = 0)
{exit;}

if global.spectate && instance_exists(oOtherplayer) 
{collidecode = false; image_alpha = 0; x = oOtherplayer.x; y = -32; exit;}

if playDemo < room_speed*8 {
	kr = keyboard_check(global.keyr)
	kl = keyboard_check(global.keyl)
	kd = keyboard_check(global.keyd)
	ku = keyboard_check(global.keyu)

	kj = keyboard_check(global.keyj)
	ka = keyboard_check(global.keya)
	kh = keyboard_check(global.keyh)

	kjp = keyboard_check_pressed(global.keyj)
	kap = keyboard_check_pressed(global.keya)
	khp = keyboard_check_pressed(global.keyh)

	kar = keyboard_check_released(global.keya)
	khr = keyboard_check_released(global.keyh)

	krp = keyboard_check_pressed(global.keyr)
	klp = keyboard_check_pressed(global.keyl)
	kup = keyboard_check_pressed(global.keyu)
	kdp = keyboard_check_pressed(global.keyd)
}

if global.chatfocus = true || instance_exists(oPaused) || in_cutscene
{kr=0;kl=0;krp=0;klp=0;kd=0;kj=0;ka=0;kjp=0;kar=0;kdp=0;kh=0;khp=0;khr=0;}
if instance_exists(oPaused) {ku=0;kup=0}

char = global.player;

if char != "Dawn" && global.partner_active {global.partner_active = false;}

if state == ps.title && frame != -1 {
	if instance_exists(oMenu) && oMenu.section == 0 {playDemo++;}
}

if playDemo > room_speed*8 && frame != -1
{
	if state == ps.title 
	{state = ps.normal;}
	
	kr = 0
	kl = 0
	kd = 0
	ku = 0
	
	krp = 0
	klp = 0
	kdp = 0
	kup = 0

	kj = 0
	ka = 0
	kh = 0

	kjp = 0
	kap = 0
	khp = 0

	kar = 0
	khr = 0
	
	if (frame < demoFrames)
	{
		frameData = demoData[| frame];
		kr = frameData[? "kr"];
		kl = frameData[? "kl"];
		kd = frameData[? "kd"];
		ku = frameData[? "ku"];
		
		krp = frameData[? "krp"];
		klp = frameData[? "klp"];
		kdp = frameData[? "kdp"];
		kup = frameData[? "kup"];
		
		kj = frameData[? "kj"];
		ka = frameData[? "ka"];
		
		kjp = frameData[? "kjp"];
		kap = frameData[? "kap"];
		
		kar = frameData[? "kar"];
		
		frame++;
	}
	else
	{
		room_goto(rmTitle);
	}
	
	if keyboard_check_pressed(vk_enter) || state == ps.die || state == ps.flagpolefinish
	{room_goto(rmTitle);}
}

event_inherited();

if instance_exists(oClient)
{
	
	if global.username = ""
	{
		global.username = (random_range(0, 100) >= 60)? choose(
		"All-Games Tupra",
		"Jalin Rabbei",
		"Ulma Maria",
		"Banana", 
		"Goku",
		"Mario", 
		"Luigi", 
		"YourAverageSMBFan", 
		"SampleText", 
		"Unnamed 0") : global.clientid;}
	
	var user = string(global.username)
	
	//Send Our Data
	var buff = buffer_create(64, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);	
	buffer_write(buff, buffer_u16, my_id);
	buffer_write(buff, buffer_s16, round(x));
	buffer_write(buff, buffer_s16, round(y));
	buffer_write(buff, buffer_f16, image_xscale*scale);
	buffer_write(buff, buffer_f16, image_alpha);					
	buffer_write(buff, buffer_u16, spr);
	buffer_write(buff, buffer_u16, depth);
	buffer_write(buff, buffer_u16, ind);					
	buffer_write(buff, buffer_s16, starman);					
	buffer_write(buff, buffer_string, user);	
	buffer_write(buff, buffer_u8, palindex);	
	buffer_write(buff, buffer_u16, global.palettesprite);		
	buffer_write(buff, buffer_s8, room);
	
	buffer_write(buff, buffer_s8, global.stars);
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
	
	if invincible = 0 and global.playercol = true {
		if place_meeting(x,y-4,oOtherplayer) && vspd < 0
		{
			if !place_meeting(x,bbox_bottom+1,oCol)
			{vspd = 1;}
		}
		if instance_place(x,bbox_bottom+vspd,oOtherplayer) && vspd >=0
		{
			while !instance_place(x,bbox_bottom+1,oOtherplayer)
			{y ++;}
			vspd = 0;
			grounded = true
		}
	
		if vspd > 0 && !place_meeting(x+sign(hspd),y,oOtherplayer) && place_meeting(x+hspd,y,oOtherplayer)
		{grounded = true; vspd = 0;}
		
		if place_meeting(x+hspd,y,oOtherplayer)
		{
			x -= hspd;
		}
	}
}

if instance_exists(oLuigi) {
	if powerup = "s" and oLuigi.powerup = "s" {global.hats = 0}
}
else {if powerup = "s" {global.hats = 0}}

if insidecar {
	x = oLuigi.x
	y = oLuigi.y
	image_alpha = 0;
	invincible = 10
}

partner_track();