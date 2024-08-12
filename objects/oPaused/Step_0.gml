if !instance_exists(oButton) {instance_activate_object(oButton)}

if !settingsmenu {
	psel += (instance_exists(oMenu))? 0 : 
	keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu);
	if psel > 3 psel = 0
	if psel < 0 psel = 3

	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.keyj)) && oGame.destroy = 0 && oGame.delay >= 10 
		{
		switch psel {
			case 0: 
				instance_destroy(); 
			break;
			case 1: 
				settingsmenu = true; 
				oGame.delay = 0; 
			break;
			case 2:
				instance_activate_all(); 
				if !instance_exists(oCheckpointmask) and room_exists(asset_get_index("rm"+string(global.world)+"_"+string(global.level)))
				{room_goto(asset_get_index("rm"+string(global.world)+"_"+string(global.level)));} 
				else 
				{room_restart()} 
				global.time = timeunits(400) 
			break;
			case 3: 
				instance_activate_all(); 
				room_goto(rmTitle); 
				instance_destroy(oClient)  
			break;
		}
		oGame.spawnx = -1;
		oGame.spawny = -1;
		instance_activate_object(oNekoPresence);
	}
}
