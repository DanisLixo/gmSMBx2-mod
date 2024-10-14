if !isspawn {
	switch(state)
	{
		case es.patrol:
			x += hspd*facingdir
			if x > SCREENW+32 || x < -32 {instance_destroy()}
			switch(enemy) {
				case z.cheep:
					y += vspd;
					if y < 80 {vspd += 0.15}
					
					if y > SCREENH+16 {instance_destroy()}
				break;
				case z.blooper:
					y += vspd;
					event_user(0); //too much for my brain
					
					if y < -16 {instance_destroy()}
				break;
				case z.green:
					y += vspd;
					vspd += 0.15
					sprite_index = sNokonoko_winged_green
				break;
				case z.red:
					sprite_index = sNokonoko_winged_red
				break;
			}
		break;

		case es.die:
			hspd = dieface*1.5;
			vspd += 0.15;
			image_yscale = -abs(image_yscale);

			y += vspd;
			
			if enemy = z.green || enemy = z.red || enemy = z.cheep {x += hspd;}
			if enemy = z.cheep || enemy = z.bill || enemy = z.blooper {image_index = 1;}
			if enemy = z.blooper {bstate = -1; anim = -1;}
			if enemy = z.red {sprite_index = sNokonoko_red_shell; image_index = 0;}
			if enemy = z.green {sprite_index = sNokonoko_shell; image_index = 0;}
			
			if y > SCREENW+32 {instance_destroy()}
		break;
	}
}
else 
{
	if timer > 0 {timer--}
	
	var cx = camera_get_view_x(view_camera[0])
	var below = round(random_range(cx,cx+SCREENW))
	
	if timer = 0 {
		enemy = irandom_range(0,5)
		var spawned = instance_create_depth(x,y,depth,oEnemysillyspawn)
		spawned.enemy = enemy
		switch(spawned.enemy) {
				case z.cheep:
					spawned.x = below;
					spawned.y = SCREENH;
					spawned.vspd = -4;
				break;
				case z.green:
					spawned.x = below;
					spawned.y = SCREENH;
					spawned.vspd = -4;
				break;
				case z.blooper:
					spawned.x = below;
					spawned.y = SCREENH;
				break;
				default:
					spawned.x = choose(-8, SCREENW+8)
					spawned.y = irandom_range(16,SCREENW-16)
				break;
			}
		
		timer = irandom_range(30,90)
	}
}