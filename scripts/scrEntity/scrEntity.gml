function collide()
{
	if object_index = oMario || object_index = oLuigi
	{
		
		collidecode = true;
		grounded = false;
	
		// Down slope
		if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope)
			&& vspd >= 0
		{
			while !place_meeting(x,y+1,oSlope)
			{y += 1; grounded = true}
		}
		
	
		if !instance_place(x-5,y-4,oCol) && vspd <= 0
		{while instance_place(x,y-4,oCol) && !place_meeting(x-1,y,oCol) && !place_meeting(x,y,oCol) {x --;}}
		else if !instance_place(x+5,y-4,oCol) && vspd <= 0
		{while instance_place(x,y-4,oCol) && !place_meeting(x+1,y,oCol) && !place_meeting(x,y,oCol) {x ++;}}
	

		if place_meeting(x,y-4,oCol) && vspd < 0
		{
			// Block hitting
			if instance_exists(oParblock)
			{
				var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
				
				if block && block.blockstate = 0
				{block.blockstate = 1; if powerup != "s" || instance_nearest(x,y,oMario).char = "Toad" and global.abilities {block.triggerbreak = true;}}
				if block && !place_meeting(x,y,block)
				{sfx(sndBump,1);}
			}
			if !place_meeting(x,bbox_bottom+1,oCol)
			{vspd = 1;}
		}
		else if instance_place(x,bbox_bottom+vspd,oCol) && vspd >=0
		{
			while !instance_place(x,bbox_bottom+1,oCol)
			{y ++;}
			vspd = 0;
			grounded = true
		}
	
		if vspd > 0 && !place_meeting(x+sign(hspd),y,oCol) && place_meeting(x+hspd,y,oCol)
		{grounded = true; vspd = 0;}
	
		y += vspd
	
		if instance_place(x,y+1,oSlope) && !place_meeting(x,y,oCol) && instance_place(x+hspd,y,oCol) && instance_place(x+hspd,y,oCol).object_index = oCol
		{
			if sign(hspd) = 1 && instance_place(x,y+1,oSlope).image_xscale < 0
			{while bbox_right < instance_place(x,y+1,oSlope).bbox_right {x ++;}}
			if sign(hspd) = -1 && instance_place(x,y+1,oSlope).image_xscale > 0
			{while bbox_left > instance_place(x,y+1,oSlope).bbox_left {x --;}}
		
			if place_meeting(x,y,oSlope) && !place_meeting(x,y,oCol)
			{while !place_meeting(x,y,oSlope) {y --;}}
		}
	
		if place_meeting(x+hspd,y,oCol)
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oCol) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oCol)
			{yincrease ++;}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oCol)
			{
				while !place_meeting(x+sign(hspd),y,oCol) && !place_meeting(x,y,oCol)
				{x += sign(hspd);}
				hspd = 0;
			}
			else  {y -= yincrease;}
		
			yincrease = 0;
		}
		x += hspd;
	
	
		// Down slope
		if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope)
			&& vspd >= 0 && grounded = true
		{
			while !place_meeting(x,y+1,oSlope)
			{y += 1; grounded = true}
		}
		
		
		vspd += 0.4
	
		vspd = clamp(vspd,-99999,5);
		
		
		if (object_index = oMario || object_index = oLuigi) && vspd > 0 && !grounded
		{vspd -= 0.1;}
	
	
		if (object_index = oMario || object_index = oLuigi) && !instance_exists(oIsArena)
		{
			x = clamp(x,8,room_width-8);
			x = clamp(x,camera_get_view_x(view_camera[0])+8,room_width-8);
			y = clamp(y,-8,room_height+64);
		}
		
		if instance_place(x,y,oCol) //&& instance_place(x,y,oCol).object_index != oElevator
		{x += 1;}
		
		exit
	}
	grounded = false;
	
	//if place_meeting(x+hspd,y,oCol) && !place_meeting(x,y,oCol)
	//{
	//	while !place_meeting(x+sign(hspd),y,oCol)
	//	{x += sign(hspd);}
	//	hspd = 0;
	//}
	//x += hspd;
	
	if !collision_rectangle(bbox_left-16,bbox_top-16,bbox_right+16,bbox_bottom+16,oElevator,false,true) || (object_index = oMario || object_index = oLuigi) {
		if instance_place(x,y+vspd,oCol)
		{
			if !instance_place(x-5,y+vspd,oCol) && vspd < 0
			{while instance_place(x,y+vspd,oCol) && !place_meeting(x-1,y,oCol) {x --;}}
			else if !instance_place(x+5,y+vspd,oCol) && vspd < 0
			{while instance_place(x,y+vspd,oCol) && !place_meeting(x+1,y,oCol) {x ++;}}
			else
			{
				if (place_meeting(x,y,oCol) && vspd >= 0) or !place_meeting(x,y,oCol)
				{
					while !place_meeting(x,y+sign(vspd),oCol)
					{y += sign(vspd);}
					vspd = 0;
				}
		
				if place_meeting(x,y+1,oCol)
				{grounded = true;}
				if place_meeting(x,y-1,oCol) && !grounded
				{vspd = 1;}
			}
		}

		if instance_place(x,y+1,oSlope) && !place_meeting(x,y,oCol) && instance_place(x+hspd,y,oCol) && instance_place(x+hspd,y,oCol).object_index = oCol
		{
			if sign(hspd) = 1 && instance_place(x,y+1,oSlope).image_xscale < 0
			{while bbox_right < instance_place(x,y+1,oSlope).bbox_right {x ++;}}
			if sign(hspd) = -1 && instance_place(x,y+1,oSlope).image_xscale > 0
			{while bbox_left > instance_place(x,y+1,oSlope).bbox_left {x --;}}
		
			if place_meeting(x,y,oSlope) && !place_meeting(x,y,oCol)
			{while !place_meeting(x,y,oSlope) {y --;}}
		}
	
		if place_meeting(x+hspd,y,oCol) && object_index != oHammerbro
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oCol) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oCol)
			{yincrease ++;}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oCol)
			{
				while !place_meeting(x+sign(hspd),y,oCol) && !place_meeting(x,y,oCol)
				{x += sign(hspd);}
				hspd = 0;
			}
			else  {y -= yincrease;}
		
			yincrease = 0;
		}
	}
	x += hspd;
	y += vspd;
	
	
	// Down slope
	if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope) && vspd > 0
	{
		while !place_meeting(x,y+1,oSlope)
		{y += 1;}
	}
	
	vspd += 0.4
	
	vspd = clamp(vspd,-6,5);
}

function apply_palette(palspr,palind,alp)
{
	var ui; var uc;
	var ar0; var ar1;
	
	for (var i = 0; i <= 4; i ++;)
	{
		ui = shader_get_uniform(shdColorswap,"Index"+string(i));
		uc = shader_get_uniform(shdColorswap,"Color"+string(i));
		
		var ar0 = sprite_getpixel(palspr,0,i,0,true);
		var ar1 = sprite_getpixel(palspr,0,i,palind,true);
			
		ar0[3] = alp;
		ar1[3] = alp;
		
		shader_set_uniform_f_array(ui,ar0);
		shader_set_uniform_f_array(uc,ar1);
	}
}

function nes_flicker()
{
	var cx = camera_get_view_x(view_camera[0])
	
	var _list = ds_list_create();
	var _num = collision_line_list(cx,bbox_bottom-1,cx+SCREENW,bbox_bottom-1,oParenemy,true,true,_list,true)
	if _num >= 8
	{image_alpha = choose(0,1);}
	else
	{image_alpha = 1;}
	ds_list_destroy(_list);
	
}

function mario_freeze()
{
	var freezing = 0;
	if instance_exists(oMario) and instance_number(oMario) = 1
	{
		with(oMario)
		{if state = ps.die or state = ps.grow or state = ps.firetransform or state = ps.capetransform or state = ps.shrink {freezing = 1;}}
		with(oMario)
		{if state = ps.enterpipedown or state = ps.enterpiperight {freezing = 2;}}
		
		if !object_get_parent(oParenemy) {
		with(oMario)
		{if state = ps.flagpoledescend or state = ps.flagpolefinish {freezing = 3;}}
		}
		
		with(oMario)
		{if state = ps.castleending {freezing = 4;}}
	}
	return freezing;
}

function explode(switchchar = true)
{
	if instance_exists(oMario) {
		var curgp = global.player
		var bd = instance_create_depth(oMario.x,oMario.y,oMario.depth+1,oMariodead)
		bd.direction = irandom(360)
		bd.hspd = choose(1,-1)*irandom(5)
		bd.spr = ms("sMario_s_die", curgp)
		
		var ins = instance_create_depth(oMario.bbox_left+2,oMario.bbox_top,oMario.depth-99999,oBLAST)
		ins.image_xscale = 0.2
		ins.image_yscale = 0.2
		ins.x -= (sprite_width*0.2)/2
		ins.y -= (sprite_height*0.2)/2
						
		instance_destroy(oMario)
						
		var nm = instance_create_depth(bd.x,-300,bd.depth-1,oMario)
		nm.state = ps.exploded
	}
	if switchchar {
		global.player = oGame.chars[| irandom_range(0,ds_list_size(oGame.chars)-1)]
		if sprite_exists(asset_get_index("sPalette_"+string_lower(global.player)))
		{
			if global.player = "Goomba"	{global.palettesprite = asset_get_index("sPalette_goombaplayer");}
			else	{global.palettesprite = asset_get_index("sPalette_"+string_lower(global.player));}
		}
		else
		{global.palettesprite = sPalette_mario;}
		}
}