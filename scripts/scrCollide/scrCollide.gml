/// @function collide
/// @description Obligatory for the object to recieve its physics.
function collide()
{
	if object_get_parent(object_index) = oMario
	{
		//ground
		collidecode = true;
		grounded = false;
	
		// Down slope
		if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope)
			&& vspd >= 0
		{
			while !place_meeting(x,y+1,oSlope)
			{y += 1; grounded = true}
		}
		if (place_meeting(x,y+1,oSlope) && char = "Sonic") {hspd += 0.025}
		
	
		if !instance_place(x-5,y-4,oCol) && vspd <= 0
		{while instance_place(x,y-4,oCol) && !place_meeting(x-1,y,oCol) && !place_meeting(x,y,oCol) {x --;}}
		else if !instance_place(x+5,y-4,oCol) && vspd <= 0
		{while instance_place(x,y-4,oCol) && !place_meeting(x+1,y,oCol) && !place_meeting(x,y,oCol) {x ++;}}
	
		if !instance_place(x-5,y-4,oElevator) && vspd <= 0
		{while instance_place(x,y-4,oElevator) && !place_meeting(x-1,y,oElevator) && !place_meeting(x,y,oElevator) {x --;}}
		else if !instance_place(x+5,y-4,oElevator) && vspd <= 0
		{while instance_place(x,y-4,oElevator) && !place_meeting(x+1,y,oElevator) && !place_meeting(x,y,oElevator) {x ++;}}

		if place_meeting(x,y-4,oCol) && vspd < 0
		{
			if instance_exists(oParblock)
			{
				var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
			
				if block && block.blockstate = 0
				{block.blockstate = 1; 
				if powerup != "s" || char = "Toad" and global.abilities {block.triggerbreak = true;}}
				if block && !place_meeting(x,y,block)
				{sfx(sndBump,1);}
			}
			
			if !place_meeting(x,bbox_bottom+1,oCol)
			{vspd = 1; swimmin = 0}
		}
		else if instance_place(x,bbox_bottom+vspd,oCol) && vspd >=0
		{
			while !instance_place(x,bbox_bottom+1,oCol)
			{y ++;}
			vspd = 0;
			grounded = true
		}
		
		if place_meeting(x,y-4,oElevator) && vspd < 0
		{
			if !place_meeting(x,bbox_bottom+1,oElevator)
			{vspd = 1;}
		}
		else if instance_place(x,bbox_bottom+vspd,oElevator) && vspd >=0
		{
			while !instance_place(x,bbox_bottom+1,oElevator)
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
		
		if instance_place(x,y+vspd,oElevator)
		{
			if !instance_place(x-5,y+vspd,oElevator) && vspd < 0
			{while instance_place(x,y+vspd,oElevator) && !place_meeting(x-1,y,oElevator) {x --;}}
			else if !instance_place(x+5,y+vspd,oElevator) && vspd < 0
			{while instance_place(x,y+vspd,oElevator) && !place_meeting(x+1,y,oElevator) {x ++;}}
			else
			{
				if (place_meeting(x,y,oElevator) && vspd >= 0) or !place_meeting(x,y,oElevator)
				{
					while !place_meeting(x,y+sign(vspd),oElevator)
					{y += sign(vspd);}
					vspd = 0;
				}
		
				if place_meeting(x,y+1,oElevator)
				{grounded = true;}
				if place_meeting(x,y-1,oElevator) && !grounded
				{vspd = 1;}
			}
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
		
		if place_meeting(x+hspd,y,oElevator)
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oElevator) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oElevator)
			{yincrease ++;}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oElevator)
			{
				while !place_meeting(x+sign(hspd),y,oElevator) && !place_meeting(x,y,oElevator)
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
	
		vspd = clamp(vspd,-99999,4);
		
		
		if object_get_parent(object_index) = oMario && vspd > 0 && !grounded
		{vspd -= 0.1;}
	
	
		if object_get_parent(object_index) = oMario && !instance_exists(oIsArena)
		{
			x = clamp(x,8,room_width-8);
			x = clamp(x,camera_get_view_x(view_camera[0])+8,room_width-8);
			y = clamp(y,-32,room_height+64);
		}
		
		if instance_place(x,y,oCol) //&& instance_place(x,y,oCol).object_index != oElevator
		{x += 1;}
		
		if instance_place(x,y,oElevator) //&& instance_place(x,y,oCol).object_index != oElevator
		{x += 1;}
		
		//elevator
	
		if vspd > 0 && !place_meeting(x+sign(hspd),y,oElevator) && place_meeting(x+hspd,y,oElevator)
		{grounded = true; vspd = 0;}
	
		/*if place_meeting(x+hspd,y,oElevator)
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oElevator) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oElevator)
			{yincrease ++;}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oElevator)
			{
				while !place_meeting(x+sign(hspd),y,oElevator) && !place_meeting(x,y,oElevator)
				{x += sign(hspd);}
				hspd = 0;
			}
			else  {y -= yincrease;}
		
			yincrease = 0;
		}*/
		
		exit;
	}
	grounded = false;
	
	//if place_meeting(x+hspd,y,oCol) && !place_meeting(x,y,oCol)
	//{
	//	while !place_meeting(x+sign(hspd),y,oCol)
	//	{x += sign(hspd);}
	//	hspd = 0;
	//}
	//x += hspd;
	
	
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
	y += vspd;

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
	if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope) && vspd > 0
	{
		while !place_meeting(x,y+1,oSlope)
		{y += 1;}
	}
	
	vspd += 0.4
	
	vspd = clamp(vspd,-6,4);
}