function ps_enterpipedown()
{
	depth = 399;
	invincible = -2;
	
	if instance_place(x,y,oPipeentrance)
	{
		y += 1;
	}
	else
	{
		if room_exists(pipeinforoom) && !instance_nearest(x,y,oPipeentrance).special8_4 
		{room_goto(pipeinforoom);}
		if instance_nearest(x,y,oPipeentrance).warper 
		{
			global.world = instance_nearest(x,y,oPipeentrance).tworld; 
			global.level = 1; 
			global.hiddenoneup = true;
		}
		if instance_nearest(x,y,oPipeentrance).special8_4
		{
			oMario.x-=8; oCamera.x-=8; oMario.y = y; oMario.depth = 600;
			if instance_place(x,y,oPipeexit) {state = ps.exitpipeup;}
		}
	}
	
	if sprite_exists(ms("sMario_{}_downpipe")) {spr = ms("sMario_{}_downpipe");}
	else if powerup != "s" {spr = ms("sMario_{}_crouch");}
	
	ind = 0;
}

function ps_enterpiperight()
{
	depth = 399;
	x += 1;
	ind += 0.2;
	
	invincible = -2;
	
	if !place_meeting(x,y,oPipeentranceright)
	{room_goto(pipeinforoom);}
	
	if instance_place(bbox_left,y,oPipeentranceright) && bbox_left >= instance_place(bbox_left,y,oPipeentranceright).bbox_left+16
	{image_alpha = 0;}
}