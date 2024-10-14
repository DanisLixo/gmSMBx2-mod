if instance_exists(oIsArena)
{
	if arenarespawn > 0
	{arenarespawn --;}
	if arenarespawn = 1
	{arenarespawn = 0; instance_create_depth(x,y,depth,object_index); instance_destroy();}
}

if (contents = conts.empty or (contents = conts.multicoin && multicointimer > 0)) && blocksprite = sBrickblock && hitblockimage <= 2
{hitblockimage = 2+image_index;}

if multicoinstart = true && multicointimer > 0
{multicointimer --;}

if contents != conts.life {savedcont = contents}
if willbe1up <= 10 and global.multiplayer and instance_number(oMario) < 2
{contents = conts.life;}
else if instance_number(oMario) >= 2 {contents = savedcont}

if triggerbreak = true && object_index = oBrickblock && contents = conts.empty
{
	if instance_nearest(x,bbox_bottom,oMario).object_index = oLuigi {global.p2_score += 50;}
	else {global.score += 50;}
	sfx(sndBreak,3);
	
	instance_create_depth(x,y,depth-1,oBlockhit).image_alpha = 0;
	
	var d = instance_create_depth(x+4,y+4,depth-2,oDebris)
	d.vspd = -6; d.hspd = -0.5;
	var d = instance_create_depth(x+12,y+4,depth-2,oDebris)
	d.vspd = -6; d.hspd = 0.5;
	var d = instance_create_depth(x+4,y+12,depth-2,oDebris)
	d.vspd = -4; d.hspd = -0.5;
	var d = instance_create_depth(x+12,y+12,depth-2,oDebris)
	d.vspd = -4; d.hspd = 0.5;
	
	
	instance_destroy();
	
	blockstate = -2
}

if blockstate = 0
{exit;}

if blockstate = 1
{	
	var p = irandom_range(0,1)
	switch(contents)
	{
		case conts.coin:
			instance_create_depth(x,y,depth,oCoinjump);
		break;
		
		case conts.powerup:
			sfx(sndItem,0);
			if instance_exists(oMario) && instance_nearest(x,y,oMario).powerup = "s"
			{instance_create_depth(x+8,y+16,depth,oMush);}
			else
			{
				if instance_nearest(x,y,oMario).char != "Feathy" || !global.abilities {p = 1}
				if p {instance_create_depth(x+8,y+16,depth,oFireflower);} 
				else {instance_create_depth(x+8,y+16,depth,oFeather);}
			}
		break;
		
		case conts.star:
			sfx(sndItem,0);
			instance_create_depth(x+8,y+16,depth,oStar);
		break;
		
		case conts.life:
			sfx(sndItem,0);
			instance_create_depth(x+8,y+16,depth,o1UPShroom);
		break;
		
		case conts.multicoin:
			if multicointimer >= 0
			{
				multicoinstart = true;
				instance_create_depth(x,y,depth,oCoinjump);
				blockstate = 0;
				if multicointimer = 0 {multicointimer = -1}
			}
			else if multicointimer = -1
			{hitblockimage = 2;}
		break;
	
		case conts.beanstalk:
		{
			instance_create_depth(x,y+16,depth+1,oBeanstalk).emerge = true;
		}
		break;
	}
	
	instance_create_depth(x,y,depth-1,oBlockhit).image_index = hitblockimage;
	image_alpha = 0;
	alarm[0] = 12;
	blockstate = 2;
	BLAST();
}

if contents = conts.multicoin && multicointimer <= 0
{contents = conts.coin;}


if blockstate = -1
{
	image_index = emptyblockimage
	
	sprite_index = sEmptyblock; 
	
	image_alpha = 1;
}

if blockstate = 2
{image_alpha = 0;}

var m = instance_place(x,y-4,oMario)

if moving = true 
{
	x += g*gspd
	if place_meeting(x+g,y,oParblock) {moving = false; sfx(sndBump,0);}
	if place_meeting(x+g,y,oCol) {moving = false; sfx(sndBump,0);}
	if m && m.vspd >= 0
	{m.x += g; if m.x > camera_get_view_x(view_camera[0])+SCREENW/2 {oCamera.x += g;}}
}

if m && global.movestatics && m.state = ps.nah
{
	if m.khp {sfx(sndBump,0);}
	moving = true
	if m.image_xscale = 1
		{if g = -1 {g = 1}}
	if m.image_xscale = -1
		{if g = 1 {g = -1}}
}
