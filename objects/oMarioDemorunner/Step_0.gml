if state != ps.die {
	var jumpSnd = big? sndJumpbig : sndJump;
	if hspd < savedhspd {hspd += 0.08}
	
	collide();
	
	if place_meeting(x,y-4,oCol) && vspd < 0
	{
		if instance_exists(oParblock)
		{
			var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
			
			if block && block.blockstate = 0
			{block.blockstate = 1;}
			if block && !place_meeting(x,y,block)
			{sfx(sndBump,1);}
		}
			
		if !place_meeting(x,bbox_bottom+1,oCol)
		{vspd = 1; swimmin = 0}
	}
	
	if !grounded
		sprite_index = jump
	else
		sprite_index = walk
	index += abs(hspd)/7
	
	if x >= room_width + 64
	instance_destroy()
	
	if (instance_place(x+hspd+16, y, oCol) 
	|| instance_place(x+hspd+16, y, oParenemy) 
	|| !instance_place(x+hspd+32, room_height-8, oCol))
	&& grounded 
	{if vspd >= 0 && onview() {sfx(jumpSnd,1);} vspd = -16 - (abs(hspd)/6);}
} else{
	x += hspd
	y += vspd
	dietimer++
	sprite_index = ms("sMario_s_die", char)
	if dietimer < 40
	{hspd = 0; vspd = 0;}
	if dietimer = 40
	{vspd = -4.5;}
	if dietimer > 40
	{vspd += 0.2;}
	if y >= room_height + 64
		instance_destroy()
}

if instance_exists(oMario) && oMario.x > 2480 && !onview()
{instance_destroy();}
image_index = index

image_xscale = scale
image_yscale = scale