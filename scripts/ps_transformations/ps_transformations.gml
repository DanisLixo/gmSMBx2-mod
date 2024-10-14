function ps_grow()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	invincible = -2;
	
	ind += 0.3;
	
	spr = ms("sMario_s_grow")
	if kjp {jumpbuffer++}
	if kj and jumpbuffer >= 1 {jumpbuffer++}
	
	if ind >= sprite_get_number(spr)-1
	{
		state = ps.normal; powerup = "b";
		if kj and jumpbuffer > 45 {
			jumpbuffer = 0;
		
			if powerup = "s"
			{sfx(sndJump,1);}
			else
			{sfx(sndJumpbig,1);}
		
			vspd = -3 -(abs(hspd)/6);
			state = ps.jump;
			spr = ms("sMario_{}_jump");
			
			ind = 0;
		
			holdjump = 30;
		}
		else {jumpbuffer = 0;}
	}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max_Verstappen"
	{sfx(sndPowerup,1); state = ps.normal; powerup = "b";}
}

function ps_firetransform()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	
	powerup = "f"
	
	ind += 0.3;
	
	if kjp {jumpbuffer++}
	if kj and jumpbuffer >= 1 {jumpbuffer++}
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{
		state = ps.normal;
		invincible = -4;
		
		if kj and jumpbuffer > 45 {
			jumpbuffer = 0;
		
			if powerup = "s"
			{sfx(sndJump,1);}
			else
			{sfx(sndJumpbig,1);}
		
			vspd = -3 -(abs(hspd)/6);
			state = ps.jump;
			spr = ms("sMario_{}_jump");
			
			ind = 0;
		
			holdjump = 30;
		}
		else {jumpbuffer = 0;}
	}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max_Verstappen"
	{sfx(sndPowerup,1); state = ps.normal;}
}

function ps_capetransform()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndFeather,1);
	}
	
	powerup = "c"
	instance_create_depth(x,y-12,depth-1000,oBlow)
	image_alpha = 0;
	
	ind += 0.3;
	
	if kjp {jumpbuffer++}
	if kj and jumpbuffer >= 1 {jumpbuffer++}
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{
		state = ps.normal;
		invincible = -4;

		if kj and jumpbuffer > 45 {
			jumpbuffer = 0;
		
			if powerup = "s"
			{sfx(sndJump,1);}
			else
			{sfx(sndJumpbig,1);}
		
			vspd = -3 -(abs(hspd)/6);
			state = ps.jump;
			spr = ms("sMario_{}_jump");
			
			ind = 0;
		
			holdjump = 30;
		}
		else {jumpbuffer = 0;}
	}
	
	if char = "Goldron" or char = "Anton" or char = "Peter Griffin" or char = "Duke" or char = "Pokey" or char = "Max_Verstappen"
	{sfx(sndPowerup,1); state = ps.normal;}
}

function ps_shrink()
{
	if spr != ms("sMario_b_shrink")
	{
		ind = 0;
		sfx(sndWarp,1);
	}
	
	ind += 0.3;
	
	spr = ms("sMario_b_shrink");
	
	if ind >= sprite_get_number(spr)-1
	{
		if powerup == "f" 
		{instance_create_depth(x,y,depth,oPudestroy).sprite_index = sFireflower_wooble;}
		if powerup == "b" 
		{instance_create_depth(x,y,depth,oPudestroy).sprite_index = sMushroom;}
		if powerup == "c" 
		{instance_create_depth(x,y,depth,oPudestroy).sprite_index = sFeather;}
		
		state = ps.normal; 
		powerup = "s";
	}
	
	if char = "Goldron" || char = "Anton" || char = "Peter Griffin" || char = "Duke" || char = "Pokey" || char = "Max Verstappen" || char = "Peppino"
	{sfx(sndWarp,1); state = ps.normal; powerup = "s";}
}