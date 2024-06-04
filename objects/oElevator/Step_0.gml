if mario_freeze() != 0
{exit;}

if place_meeting(x,y-4,oMario) && oMario.vspd >= 0
	{if oMario.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += gspd;}}

if isskylift != false
{
	type = 4;
	sprite_index = sSkylift;
	if place_meeting(x,y-1,oMario) && isskylift = 1
	{gspd = 1; isskylift = 2;}
	
	if isskylift = 1
	{gspd = 0;}
	
	x += gspd
	if place_meeting(x,y-4,oMario) && oMario.vspd >= 0 //&& !oMario.place_meeting(x-1,y,oCol)
	{oMario.x += gspd; if oMario.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += gspd;}}
}

if type = 0
{
	y -= 1;
	
	
	if place_meeting(x,y-1,oMario) && y > 0
	{oMario.y = y-1; oMario.vspd = 0; oMario.grounded = true}
	
	if y < -32 && early = false {y = room_height + 32;}
	else if y < 28 && early = true {y = room_height;}
}
if type = 1
{
	y += 1;
	
	if place_meeting(x,y-4,oMario) && oMario.vspd >= 0 && y < room_height+16
	{oMario.y = y-1; oMario.vspd = 0; oMario.grounded = true}
	
	if y > room_height + 32 && early = true {y = 28;}
	else if y > room_height + 32 && early = false {y = -32;}
}

if type = 2
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	
	gspd = lerp(gspd,g*1.3,.02);
	y += gspd
	if place_meeting(x,y-4,oMario) && oMario.vspd >= 0 && g = 1
	{oMario.y = bbox_top-1; oMario.vspd = 0; oMario.grounded = true}
	if place_meeting(x,y-3,oMario) && g = -1
	{oMario.y = bbox_top-1; oMario.vspd = 0; oMario.grounded = true}
}


if type = 3
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	
	gspd = lerp(gspd,g*1.3,.02);
	x += gspd
	if place_meeting(x,y-4,oMario) && oMario.vspd >= 0
	{oMario.x += gspd;}
}

if type = 4 
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	
	gspd = lerp(gspd,g*1.3,.02);
	if place_meeting(x,y-4,oMario)
	{x += gspd}
	if place_meeting(x,y-4,oMario) && oMario.vspd >= 0
	{oMario.x += gspd;}
}

if type = 5 
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	
	gspd = lerp(gspd,g*1.3,.02);
	if place_meeting(x,y-4,oMario)
	{y += gspd}
	if place_meeting(x,y-4,oMario) && oMario.vspd >= 0
	{oMario.y += gspd;}
}

/* if type = 6 
{
	gspd = lerp(gspd,g*1.3,.02);
		if place_meeting(x,y-4,oMario)// && falling = false
		{y += gspd;
		instance_place(x, y, oElevator).y -= gspd;	
		}
		
		if place_meeting(x,y-4,oMario) && oMario.vspd >= 0// && falling = false
		{oMario.y += gspd;}
		
		if place_meeting(x,y,oPlatformtriggerrd)
		{
			y -= gspd;
			instance_place(x, y, oElevator).y -= gspd;
			falling = true;
		}
	/*if side = 1 {
		gspd = lerp(gspd,g*1.3,.02);
		if place_meeting(x,y-4,oMario)// && falling = false
		{y += gspd;
		instance_nearest(x-8, y, oElevator).y -= gspd;	
		}
		
		if place_meeting(x,y-4,oMario) && oMario.vspd >= 0// && falling = false
		{oMario.y += gspd;}
		
		if place_meeting(x,y,oPlatformtriggerrd)
		{
			y -= gspd;
			instance_nearest(x-8, y, oElevator).y -= gspd;
			falling = true;
		}
	}
	if side = 0 {
		gspd = lerp(gspd,g*1.3,.02);
		if place_meeting(x,y-4,oMario)// && falling = false
		{y += gspd;
		instance_nearest(x+8, y, oElevator).y -= gspd;	
		}
		
		if place_meeting(x,y-4,oMario) && oMario.vspd >= 0// && falling = false
		{oMario.y += gspd;}
		
		if place_meeting(x,y,oPlatformtriggerrd)
		{
			y -= gspd;
			instance_nearest(x+8, y, oElevator).y -= gspd;
			falling = true;
		}
	}
} */

if place_meeting(x, y-4,oMario) && global.moveobjs && oMario.state = ps.nah
{
	if oMario.khp {sfx(sndBump,0);}
	if oMario.image_xscale = 1
		{if g = -1 {g = 1}}
	if oMario.image_xscale = -1
		{if g = 1 {g = -1}}
}