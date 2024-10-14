/// @function player_collision

function player_collision()
{
	var obj = instance_place(x,y,oParenemy)

	if obj && (starman > 0 or spin = true or shoulderbash > 0 or spintimer > 0 || pepdancin > 0) && obj.state != es.die && obj.state != es.stomp
	{
		if spintimer > 0 
		{
			with(obj) 
			{
				if state != es.shell {vspd = -2;}
				if stomptype <= 0 or stomptype = 3 {
					if other.char != "1pixelmario" && global.abilities {state = es.die;}
				
					if object_index = oGoomba {points(100,true)}
					else if object_index = oHammerbro {points(1000,true)}
					else {points(200,true)}
				} else if stomptype = 1 {
					if state = es.shell {state = es.shellhit; points(400,false);} 
					else {state = es.shell}
				}
			
				dieface = (instance_place(x,y,oMario).x < x? 1 : -1); 
			}
		}
		else {
			with(obj) 
			{
				vspd = -2; 
				state = es.die; 
				dieface = (instance_place(x,y,oMario).x < x? 1 : -1); 
				if object_index = oGoomba {points(100,true)}
				else if object_index = oHammerbro {points(1000,true)}
				else {points(200,true)}
			}
		}
		sfx(sndKick,0);
		if shoulderbash > 0 {shoulderbash = room_speed*0.5}
	}

	if obj {
		if obj.state = es.patrol || obj.state = es.patrolwinged {
			if !grounded && (vspd >= 0 || holdjump > 28)
			|| char = "Sonic" and state == ps.jump
			{
				if obj.stomptype = -1
				{gethit = 1;}
				
				else {
					vspd = -3;
					holdjump = combo < 5? 20+combo*2.5 : 35;
					combo++
					with(obj) {BLAST()}
					
					if obj.object_index = oHammerbro {points(5+combo,true);}
					else if obj.object_index = oLakitu {points(4+combo,true);}
					else if obj.cheeptype != 2 {
						if obj.state != es.shell {points(combo,true);}
					}
					
					sfx(sndStomp,0)
					
					if !global.abilities || char != "1pixelmario" && global.abilities
					{
						if obj.stomptype = 0 {obj.state = es.stomp;}
						if obj.stomptype >= 3 {obj.state = es.die;}
						else if obj.stomptype >= 1 and obj.stomptype < 3
						{
							if obj.state = es.patrol {
								obj.state = es.shell;
								obj.vspd = 0; obj.hspd = 0;
							}
							else if obj.state = es.patrolwinged 
							{obj.state = es.patrol; obj.vspd = 2.5; obj.flyt_delay = 35;}
							obj.shellcooldown = 10
						}
					}
					if char = "Sonic" and global.abilities {obj.state = es.die;}
					if char = "1pixelmario" and global.abilities {obj.flyt_delay = 35;}
				}
			}
			else if (state != ps.sneeze || state != ps.jumpcut || tauntstate != 0) &&
			(grounded || obj.flyt_delay == 0)
			{gethit = 1;}
		}
	}

	obj = instance_place(x,y,oPiranha);

	if obj {
		if starman > 0 || shoulderbash > 0 || spintimer > 0 || pepdancin > 0 || spin
		{sfx(sndKick,0); points(200,true); instance_destroy(obj); if shoulderbash > 0 {shoulderbash = room_speed*0.5;}}
		if invincible = 0
		{gethit = 1;}
	}
	
	obj = instance_place(x,y,oPodoboo);

	if obj && obj.st != -1 {
		if starman > 0 || shoulderbash > 0 || spintimer > 0 || pepdancin > 0 || spin
		{sfx(sndKick,0); obj.st = -1 if shoulderbash > 0 {shoulderbash = room_speed*0.5;}}
	}
	
	obj = instance_place(x,y,oBowser);

	if obj && obj.state != -1 {
		if starman > 0 || shoulderbash > 0 || spintimer > 0 || pepdancin > 0 || spin
		{sfx(sndKick,0); points(200,true); obj.state = -1; if shoulderbash > 0 {shoulderbash = room_speed*0.5;}}
	}
	
	obj = instance_place(x,y,oBowserfire);

	if obj {
		if starman > 0 || shoulderbash > 0 || spintimer > 0 || pepdancin > 0 || spin
		{sfx(sndKick,0); points(200,true); instance_destroy(obj); if shoulderbash > 0 {shoulderbash = room_speed*0.5;}}
	}
 
	obj = instance_place(x,y,oCoin);

	if obj
	{
		if object_index != oLuigi
		{
			global.coins += 1;
			global.score += 200;
		}
		else
		{
			global.p2_coins += 1;
			global.p2_score += 200;
		}
		
		sfx(sndCoin,0)
	
		with(obj) {BLAST()}	
		instance_destroy(obj);
	}
	
	obj = instance_place(x,y,oBigcoin);

	if obj
	{
		if object_index != oLuigi
		{
			global.coins += 5;
		}
		else
		{
			global.p2_coins += 5;
		}
		
		sfx(sndBigcoin,0)
		points(2000,true)
	
		with(obj) {BLAST()}	
		instance_destroy(obj);
	}
	
	obj = instance_place(x,y,oParpowerup);
	
	if obj
	{
		with (obj) {
			if other.char = "Syobon" and global.abilities 
			{other.gethit = 1; instance_destroy()}
			else {pufunc();}
		}
	}
}