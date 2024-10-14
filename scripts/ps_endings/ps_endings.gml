function ps_flagpoledescend()
{
	instance_deactivate_object(oParenemy)
	instance_deactivate_object(oPodoboo)
	instance_deactivate_object(oFirebar)
	instance_deactivate_object(oFireball)
	
	flagpoletimer ++;
	hspd = 0;
	vspd = 0;
	
	if dancechance >= 95 && (powerup = "b" or powerup = "f") && (char = "Mario" or char = "Luigi")
	{spr = ms("sMario_{}_polydance");}
	else
	{spr = ms("sMario_{}_climb");}
	
	invincible = -2;
	
	if !place_meeting(x,y+2,oCol) && instance_nearest(x,y,oFlag).down
	{
		if spr = sMario_b_polydance or spr = sMartin_b_climb or spr = sLuigi_b_polydance
		{y -= 1.5; flagpoletimer -= 0.7}
		y += 2;
		ind += 0.25;
	}
	else
	{ind = 0;}

	if flagpoletimer > room_speed * 2 - 20 && flagpoletimer <= room_speed * 2
	{image_xscale = -abs(image_xscale);}
	else
	{image_xscale = abs(image_xscale);}
	
	if flagpoletimer > room_speed * 2
	{
		bgm("Levelend",false)
		
		if (global.race || global.waiting || global.sync) and instance_exists(oClient)
		{
			
			var finbuff = buffer_create(4, buffer_grow, 1);
			buffer_seek(finbuff, buffer_seek_start, 0);
			buffer_write(finbuff, buffer_u8, network.finished);		//Send the join ID
			
			network_send_packet(oClient.client, finbuff, buffer_tell(finbuff));
			buffer_delete(finbuff);
			
			state = ps.normal;
		}
		else
		{x += 8; state = ps.flagpolefinish;}
		flagpoletimer = 0;
	}
	
}

function ps_flagpolefinish()
{
	if instance_exists(oFlagpole)
	{
		if hspd < 1.5
		{hspd += 0.05;}
	}
	else
	{
		if hspd < 0.8
		{hspd += 0.05;}
	}
	
	spr = ms("sMario_{}_walk");
	if grounded {ind += 0.25;}
	
	invincible = -2;
	
	if instance_place(x+1,y,oCol) {
		depth = 399;
	}
	
	
	if instance_place(x,y,oPipeentranceright) && instance_place(x+1,y,oCol) && grounded
	{state = ps.enterpiperight; pipeinforoom = instance_place(x,y,oPipeentranceright).troom; instance_place(x,y,oPipeentranceright).activated = true; sfx(sndWarp,1);}
	
	collide();
}

function ps_castleending()
{
	instance_deactivate_object(oParenemy)
	instance_deactivate_object(oPodoboo)
	instance_deactivate_object(oFirebar)
	instance_deactivate_object(oFireball)
	instance_deactivate_object(oHammer)
	instance_deactivate_object(oBowserfire)
	invincible = -2; 
	
	if castleendingtrigger = true
	{
		image_xscale = abs(image_xscale);
		if hspd != 0 && grounded
		{spr = ms("sMario_{}_walk"); ind += abs(hspd)/7; if place_meeting(x+sign(hspd),y,oCol) {ind += 0.15;}}
		else if hspd = 0 && grounded
		{spr = ms("sMario_{}_idle"); ind = 0;}
		if !place_meeting(x,y,oToad)
		{hspd = 1.5;}
		else if abs(hspd) > 0
		{
			if hspd - 0.2 <= 0 {hspd = 0;} else {hspd -= 0.2;}
		}
		
		
		collide()
	}
	else
	{hspd = abs(hspd); vspd = 0;}
	if khp and hspd = 0 and global.commandenys = true 
	{state = ps.nah}
}
