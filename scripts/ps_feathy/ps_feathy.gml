function do_spincarp()
{
	if kap && powerup = "c" and spintimer <= 0 {
		spintimer = 30;
	}
	
	if spintimer > 0 {
		spr = ms("sMario_{}_spin"); ind += 0.4;
		if spintimer = 1 and !grounded {
			spr = ms("sMario_{}_jump"); ind = 0
		}
	}
}

function ps_fly()
{
	var moveh = (image_xscale)? kr-kl : kl-kr
	
	if instance_place(x,bbox_bottom+vspd*2,oCol) || instance_place(x,bbox_bottom+vspd*2,oParblock)
	{
		if instance_place(x,y,oCol) || instance_place(x,y,oParblock)
		{x -= hspd*4;}
		
		state = ps.normal;
		pmach = 0;
	}
	if instance_place(x,bbox_top+vspd*2,oCol) || instance_place(x,bbox_top+vspd*2,oParblock)
	{
		vspd += 1.5;
		
		var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
				
		if block && block.blockstate = 0
			{block.blockstate = 1; block.triggerbreak = true;}
		if block && !place_meeting(x,y,block)
			{sfx(sndBump,1);}
	}
	
	if ka and pmach >= 6 {
		if holdjump >= 0
		{
			holdjump--
		
			vspd = -4
			if !kj
			{holdjump = -1;}
			if holdjump = 0
			{holdjump = -1;}
		}
		else if holdjump < 0 {
			spr = ms("sMario_{}_cape");
			if vspd <= 0 {ind = 2}
			if vspd >= 0.4 {ind = 1; sound = false;}
			if vspd >= 0.8 {ind = 0; sound = false;}
			
			if moveh = 0 || fly = false {vspd += 0.1 if vspd >= 0.8 {vspd -= 0.1}}
			if moveh = 1 {vspd += 0.1}
			if moveh = -1 //and flytimer >= 0 
			{
				if fly {vspd -= 0.15; if sound = false {sfx(sndAltitude,0); sound = true;}} 
				else {moveh = 0} 
			}
			if vspd >= 1.25 {fly = true;}
			else if vspd <= -2.5 {fly = false;}
		}
	}
	else if !instance_place(x,y,oCol) {state = ps.jump; holdjump = -1; pmach = 0; spr = ms("sMario_{}_jump")}
	
	y += vspd
	x += hspd
	
	if !instance_exists(oIsArena)
	{
		x = clamp(x,8,room_width-8);
		x = clamp(x,camera_get_view_x(view_camera[0])+8,room_width-8);
		y = clamp(y,-8,room_height+64);
	}
}

function ps_sneeze()
{
	hspd -= 0.1;
	
	if hspd > 0 {ind = 0; spr = ms("sMario_{}_allerg"); x += hspd*-image_xscale}
	else if hspd <= -3 {
		spr = ms("sMario_{}_sneeze"); 
		ind += 0.1;
		if ind >= 16 and not sound {sfx(sndAtchim,0); sound = true;}
		if ind >= 17 and instance_exists(oFireflower) {instance_nearest(x,y,oFireflower).float = true;}
		if ind >= 41 {state = ps.normal; hspd = 0 ind = 0}
	}
}