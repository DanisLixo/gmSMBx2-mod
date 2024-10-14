function do_taunt()
{
	if kup && char == "Peppino" and taunttimer <= 0 {
		sfx(sndTaunt, 0);
		taunttimer = 25;
		
		spr = sPeppino_taunts; ind = irandom_range(0,12);
		if ind == 0 && image_xscale == -1 {spr = sPeppino_taunt0_flip;}
		
		var tauntfx = instance_create_depth(x,y,depth+1,oTauntfx);
		tauntfx.m = id;
		state = ps.taunt;
	}
}

function ps_taunt()
{
	if tauntstate == 0 
	{
		if taunttimer <= 0 
		{
			if ku {state = ps.dancepep;}
			else {state = ps.normal;}
		}
		
		var _parry = false;
		var _timer = 10
		
		var enemy = instance_place(x,y,oParenemy)
		if taunttimer >= _timer && enemy && enemy.state != ps.die
		{
			enemy.state = es.die;
			
			_parry = true; 
		}
		
		enemy = instance_place(x,y,oPiranha);
		if taunttimer >= _timer && enemy
		{
			instance_destroy(enemy);
			points(200,true);
			
			_parry = true;
		}
		
		enemy = instance_place(x,y,oPodoboo);
		if taunttimer >= _timer && enemy
		{
			enemy.st = -1;
			points(200,true);
			
			_parry = true;
		}
		
		enemy = instance_place(x,y,oBowser);
		if taunttimer >= _timer && enemy
		{
			enemy.life--;
			
			_parry = true;
		}
		
		if _parry
		{
			tauntstate = 1; 
			taunttimer = -1; 
			
			var duration = 65;
			var t = current_time + duration;

			while current_time < t { }; 
		}
	}
	else 
	{	
		collide();
		
		if taunttimer == -1 {
			var _parrysprite = asset_get_index( "sPeppino_Parry" + string( irandom_range(0,2) ) )
			
			hspd = 3*-image_xscale;
			vspd = -1;
			taunttimer = 1;
			ind = 0
			spr = _parrysprite
			
			sfx(sndParry, 3);
		}
		ind += 0.35;
		
		if hspd != 0 {hspd += 0.1*image_xscale;}
		
		if ind >= 14
		{state = ps.normal; hspd = 0; tauntstate = 0; ind = 0;}
	}
}

function ps_dancepep()
{
	if !grounded || !ku {state = ps.normal; pepdancin = -1;}
	
	spr = sPeppino_breakdance;
	
	if pepdancin < 50 {pepdancin++;}
	
	ind += pepdancin/75;
	
	if pepdancin == 30 
	{
		var bbox = instance_create_depth(x,y,depth+1,oBoombox)
		bbox.m = id;
	}
	
	var moveh = kr-kl
	
	if moveh != 0
	{
		var accel = 0.08
		var maxhspd = 1.5
		
		if ka
		{maxhspd = 2.5;}
		
		if global.environment = e.underwater
		{maxhspd = 0.8;}
	
	
		if abs(hspd) < maxhspd && moveh = 1
		{hspd += accel;}
		
		else if abs(hspd) < maxhspd && moveh = -1
		{hspd -= accel;}
		
		if !ka && abs(hspd) > maxhspd
		{hspd -= accel*moveh;}
		
		if sign(hspd) != 0
		{image_xscale = sign(hspd);}
		
		if moveh != image_xscale && abs(hspd) > 0.6 && moveh != 0 && grounded
		{
			var deccel = 0.12
			if abs(hspd) > 0
			{
				var deccel = 0.15
				if abs(hspd) - deccel <= 0
				{hspd = 0;}
				if abs(hspd) > 0
				{hspd -= deccel*sign(hspd);}
			}
		}
		if moveh != sign(hspd) && abs(hspd) <= 0.6 && moveh != 0 && grounded
		{hspd-= accel*sign(hspd);}
	}
	else
	{
		var deccel = 0.2
		
		if abs(hspd) - deccel <= 0
		{hspd = 0;}
		
		if abs(hspd) > 0
		{hspd -= deccel*sign(hspd);}
	}
	
	collide();
	
	if kjp {pepdancin = -1;}
	do_jump();
}
