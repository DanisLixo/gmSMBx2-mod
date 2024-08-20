if mario_freeze() != 0
{exit;}

var m = instance_place(x,y-4,oMario)

if m {if m.vspd >= 0 
	{if m.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += gspd;}}}

if isskylift != false
{
	type = -1;
	sprite_index = sSkylift;
	m = instance_place(x,y-1,oMario)
	if m {if isskylift = 1
	{gspd = 1; isskylift = 2;}}
	
	x += gspd
	
	if isskylift = 1
	{gspd = 0;}
	
	m = instance_place(x,y-1,oMario)
	if m {if m.vspd >= 0
	{oMario.x += gspd; if oMario.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += gspd;}}}
}

if type = 0
{
	y -= 1;
	
	
	if m && y > 0
	{m.y = y-1; m.vspd = 0; m.grounded = true}
	
	if y < -32 && early = false {y = room_height + 32;}
	else if y < 28 && early = true {y = room_height;}
}
if type = 1
{
	y += 1;
	
	if m {
		if m.vspd >= 0 && y < room_height+16
		{m.y = y-1; m.vspd = 0; m.grounded = true}
	}
	
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
	if m {
		if m.vspd >= 0 && g = 1
		{m.y = bbox_top-1; m.vspd = 0; m.grounded = true}
		if g = -1
		{m.y = bbox_top-1; m.vspd = 0; m.grounded = true}
	}
}


if type = 3
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	
	gspd = lerp(gspd,g*1.3,.02);
	x += gspd
	if m {
		if m.vspd >= 0
		{	if !instance_place(x,y,oCol) {m.x += gspd;}
			m.y = bbox_top-1; m.vspd = 0; m.grounded = true}
	}
}

if type = 4 
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	
	gspd = lerp(gspd,g*1.3,.02);
	if m {
		x += gspd;
		
		if m.vspd >= 0
		{	if !instance_place(x,y,oCol) {m.x += gspd;}
			m.x += gspd; m.y = bbox_top-1; m.vspd = 0; m.grounded = true}
	}
}

if type = 5 
{
	if place_meeting(x,y,oPlatformtriggerlu)
	{g = 1}
	if place_meeting(x,y,oPlatformtriggerrd)
	{g = -1}
	
	gspd = lerp(gspd,g*1.3,.02);
	if m {
		y += gspd
		if m.vspd >= 0 {m.y += gspd; m.vspd = 0; m.grounded = true}
	}
}

if m && global.moveobjs && m.state = ps.nah
{
	if m.khp {sfx(sndBump,0);}
	if m.image_xscale = 1
		{if g = -1 {g = 1}}
	if m.image_xscale = -1
		{if g = 1 {g = -1}}
}