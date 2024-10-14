/// @description Draw Total Players

var all_players = ds_list_size(total_players);

event_user(0)

draw_set_font(global.fnt);

draw_text(16, 10, " - HOSTING!");
draw_text(32, 30, "WORLD: " +string(global.world) +"\nLEVEL: "+string(global.level));

draw_set_halign(fa_center);
	draw_text(SCREENW/2, SCREENH/2 - 16, "PLAYERS CONNECTED - " + string(all_players));


draw_set_font(fntComic)
	draw_text(SCREENW/2, SCREENH-48, "To join, open another client");
	draw_text(SCREENW/2, SCREENH-32, "Press ESCAPE to set gamemode or start game");

draw_set_halign(fa_left);


if choosingmode = true
{draw_set_color(c_black); draw_set_alpha(0.98); draw_rectangle(0,0,SCREENW+1,SCREENH+1,false); draw_set_color(-1); draw_set_alpha(1);}

if global.sync {global.waiting = true}

if keyboard_check_pressed(vk_escape)
{choosingmode = !choosingmode; cmsel = 0;}

if choosingmode = true
{
	for (var i = 0; i < ds_grid_width(cmoptions); i++;)
	{
		for (var j = 0; j < ds_grid_height(cmoptions); j++;) {
			var gv = variable_global_get(cmbool[# i,j])
		
			if is_string(cmbool[# i,j]) and cmoptions[# i,j] != "Arena NOT WORKING - " and cmoptions[# i,j] != "World - " and cmoptions[# i,j] != "Level - " and cmoptions[# i,j] != "Time to wait for others - " and cmoptions[# i,j] != ""
			{draw_sprite(sCheckbox,sign(gv),32+(i*SCREENH/1.25),64+(j*16));}
		
			if cmoptions[# i,j] = "Arena NOT WORKING - " 
			{if changemode and cmsec = i and cmsel = j {draw_set_color(c_red);} draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]+" "+string(ga)); draw_set_color(c_white);}
			else if cmoptions[# i,j] = "World - " 
			{if changemode and cmsec = i and cmsel = j {draw_set_color(c_red);} draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]+" "+string(gwor)); draw_set_color(c_white);}
			else if cmoptions[# i,j] = "Level - " 
			{if changemode and cmsec = i and cmsel = j {draw_set_color(c_red);} draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]+" "+string(glev)); draw_set_color(c_white);}
			else if cmoptions[# i,j] = "Time to wait for others - " 
			{if changemode and cmsec = i and cmsel = j {draw_set_color(c_red);} draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]+" "+string(secs)); draw_set_color(c_white);}
			else if cmoptions[# i,j] != "" {draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]);}
		}
	}
	
	draw_sprite(sMushsel,oGame.image_index,16+(cmsec*SCREENH/1.25),64+(cmsel*16))
	
	if changemode = -1 {
		if keyboard_check_pressed(global.keyd) && cmsel < ds_grid_height(cmoptions)-1
		{cmsel += 1;}
		if keyboard_check_pressed(global.keyu) && cmsel > 0
		{cmsel -= 1;}
	}
	
	var p = keyboard_check(global.keyr)-keyboard_check(global.keyl);
	
	if p = 0 {c = 0}
	else {c++}
		
	if changemode = -1 and (c = 1 || c >= 35) {cmsec += p;}
	if cmsec > 1
		{cmsec = 0;}
	if cmsec < 0
		{cmsec = 1;}
		
	if cmoptions[# cmsec,cmsel] = "Arena NOT WORKING - " and changemode = 1
		{
			if (c = 1 || c >= 35) ga += p;
			if ga > 2
			{ga = 0;}
			if ga < 0
			{ga = 2;}
			variable_global_set(cmbool[# cmsec,cmsel],ga)
		}
	if cmoptions[# cmsec,cmsel] = "Level - " and changemode = 1
		{
			if (c = 1 || c >= 35) glev += p
			if glev > 4
			{glev = 1;}
			if glev < 1
			{glev = 4;}
			variable_global_set(cmbool[# cmsec,cmsel],glev)
		}
	if cmoptions[# cmsec,cmsel] = "World - " and changemode = 1
		{
			if (c = 1 || c >= 35) gwor += p
			if gwor > 8
			{gwor = 1;}
			if gwor < 1
			{gwor = 8;}
		}
	if cmoptions[# cmsec,cmsel] = "Time to wait for others - " and changemode = 1
		{
			if (c = 1 || c >= 35) secs += p
			if secs > 30
			{secs = 0;}
			if secs < 0
			{secs = 30;}
		}

	if keyboard_check_pressed(global.keyj) || keyboard_check_pressed(vk_enter)
	{
		if cmoptions[# cmsec,cmsel] = "Arena NOT WORKING - "
		{
			changemode = -changemode;
			variable_global_set(cmbool[# cmsec,cmsel],ga)
		}
		if cmoptions[# cmsec,cmsel] = "Level - "
		{
			changemode = -changemode;
			variable_global_set(cmbool[# cmsec,cmsel],glev)
		}
		if cmoptions[# cmsec,cmsel] = "World - "
		{
			changemode = -changemode;			
			variable_global_set(cmbool[# cmsec,cmsel],gwor)
		}
		if cmoptions[# cmsec,cmsel] = "Time to wait for others - "
		{
			changemode = -changemode;		
			variable_global_set(cmbool[# cmsec,cmsel],secs)
		}
		if is_string(cmbool[# cmsec,cmsel])
		{
			var gv = variable_global_get(cmbool[# cmsec,cmsel])
			variable_global_set(cmbool[# cmsec,cmsel],!gv)
		}
		else
		{
			if cmoptions[# cmsec,cmsel] = "Begin game"
			{
				global.arena = ga;
				if global.challenge {
					global.world = 1; global.level = 1
				} else {
					global.world = gwor; global.level = glev;}
				global.nextlvltimer = secs;
				
				var jbuff = buffer_create(32, buffer_grow, 1);
				buffer_seek(jbuff, buffer_seek_start, 0);
				buffer_write(jbuff, buffer_u8, network.hostbegin);
				buffer_write(jbuff, buffer_bool, global.race);	
				buffer_write(jbuff, buffer_u8, global.nextlvltimer);	
				buffer_write(jbuff, buffer_bool, global.schutmode);	
				buffer_write(jbuff, buffer_bool, global.rtxmode);
				buffer_write(jbuff, buffer_bool, global.commandenys);
				buffer_write(jbuff, buffer_u8, global.arena);	
				buffer_write(jbuff, buffer_bool, global.challenge);
				buffer_write(jbuff, buffer_bool, global.pvp);
				buffer_write(jbuff, buffer_bool, global.waiting);
				buffer_write(jbuff, buffer_bool, global.extra);
				buffer_write(jbuff, buffer_bool, global.playercol);
				buffer_write(jbuff, buffer_bool, global.abilities);
				buffer_write(jbuff, buffer_u8, global.world);	
				buffer_write(jbuff, buffer_u8, global.level);	
				buffer_write(jbuff, buffer_bool, global.teleport_tolvl);

				//network_send_packet(client, jbuff, buffer_tell(jbuff));
				
				//Loop through the total player list (containing sockets) and send the packet to each one
				for (var i = 0; i < ds_list_size(total_players); i++) {
					network_send_packet(ds_list_find_value(total_players, i), jbuff, buffer_tell(jbuff));	
				}
				
				buffer_delete(jbuff);
			}
			choosingmode = false;
			if cmoptions[# cmsec,cmsel] = "Disconnect" {network_destroy(server); room_goto(rmTitle);}
		}
	}

	draw_set_halign(fa_center);
	draw_text(SCREENW/2, SCREENH-32, "Press ESCAPE to return");
	draw_set_halign(fa_left);
}


draw_set_font(-1);
