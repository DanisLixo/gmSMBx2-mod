if !instance_exists(oButton) {instance_activate_object(oButton)}
if !instance_exists(oNekoPresence) {instance_activate_object(oNekoPresence);}

if !settingsmenu {
	var click = (instance_exists(oMenu))? 0 : 
	keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu);
	psel += click
	if psel > 3 psel = 0
	if psel < 0 psel = 3
	if click != 0 {sfx(sndMenumove,0)}
	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.keyj)) && oGame.destroy = 0 && oGame.delay >= 10 
		{
		switch psel {
			case 0: 
				instance_destroy(); 
			break;
			case 1: 				
				oGame.delay = 0; 
				settingsmenu = true; 
			break;
			case 2:
				if instance_exists(oClient) && (global.waiting || global.race) && (instance_exists(oMario) && oMario.finishedrace)
				{sfx(sndBump, 4); break;}
				
				instance_activate_all(); 
				
				if !instance_exists(oCheckpointmask) and room_exists(asset_get_index("rm"+string(global.world)+"_"+string(global.level)))
				{room_goto(asset_get_index("rm"+string(global.world)+"_"+string(global.level)));} 
				else 
				{room_restart()} 
				
				global.time = timeunits(400);
				oGame.spawnx = -2;
				oGame.spawny = -2;
			break;
			case 3: 
				instance_activate_all(); 
				room_goto(rmTitle); 
				if instance_exists(oClient) {disconnecttt();}
			break;
		}
	}
}
