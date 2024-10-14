if room = rmServer
{;}

/// handle gui
draw_set_font(global.fnt)

#region DEBUG gui

var cx = 0; cy = 0;//camera_get_view_x(view_camera[0]); var cy = camera_get_view_y(view_camera[0]);
var tile = 8

draw_set_font(global.fnt);

if string_pos("Title",room_get_name(room)) == 0 and room != rmServer and room != rmLeveltransition && global.debug = true
{
	
	if !instance_exists(oClient)
	{
		if keyboard_check_pressed(vk_tab) and !instance_exists(oPaused)
		{debug = !debug;}
		
		
		if debug
		{
			var boolbox = function(b,to)
			{
				if b = -1
				{exit;}
				draw_sprite(sCheckbox,b,(SCREENW-(256/2))+6+0,(8*3)+(8*to)+8+0)
			}
			
			draw_rectangle_color((SCREENW-(256/2))+(tile*-1)+cx,(tile*3)+cy,(SCREENW-(256/2))+(tile*1)+cx+64,(tile*3)+cy+112,c_black,c_black,c_black,c_black,false);
			draw_sprite(sMushsel,image_index,(SCREENW-(256/2))+4+(tile*-1)+cx,(tile*3)+(tile*debugsel)+tile+cy)
			
			
			debugsel += keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu)
			debugsel = clamp(debugsel,0,8);
			
			
			
			draw_set_font(fntComicsmall)
			
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*1+cy,"LANTERNRTX"); boolbox(global.rtxmode,0);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*2+cy,"GUN"); boolbox(global.schutmode,1);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*3+cy,"FREECAM"); boolbox(global.freecam,2);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*4+cy,"TRIPPY"); boolbox(global.trippymode,3);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*5+cy,"COMMANDER"); boolbox(global.commandenys,4);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*6+cy,"ENVIRONMENT"); boolbox(-1,5);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*7+cy,"EXPLODE"); boolbox(-1,6);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*8+cy,"TILESET"); boolbox(-1,7);
			if instance_exists(oMario) {
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*9+cy,"SCALE "+ string(oMario.scale)); boolbox(-1,8);}
			
			draw_set_font(global.fnt);
			
			if keyboard_check_pressed(vk_enter)
			{
				switch(debugsel)
				{
					case 0: global.rtxmode = !global.rtxmode; break;
					case 1: global.schutmode = !global.schutmode; break;
					case 2: global.freecam = !global.freecam; break;
					case 3: global.trippymode = !global.trippymode; break;
					case 4: global.commandenys = !global.commandenys; break;
					case 5: if global.environment != e.night {global.environment++} else {global.environment = -1;} break;
					case 6: explode(); break;
					case 7: if global.game != gm.LL {global.game++} else {global.game = 0;} break;
				}
			}
			
			var p = keyboard_check_pressed(global.keyr)-keyboard_check_pressed(global.keyl);
			if p != 0 and debugsel = 8 {
				oMario.scale += 0.1*p; global.scaled = true
			}
		}
	}
	else
	{global.freecam = true; debug = false;}


	if global.schutmode = true && !instance_exists(oGun) && instance_exists(oMario) 
	{instance_create_depth(oMario.x,oMario.y,depth,oGun);}
	//if global.schutmode = true && instance_exists(oLuigi) && instance_number(oGun) < 2 {instance_create_depth(oLuigi.x,oLuigi.y,depth,oGun);}

	/*
	if global.rtxmode = true	{draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*1+cy,"RTXMODE");}
	if global.schutmode = true	{draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*2+cy,"SCHUTMODE");}
	*/
	
	//draw_text_color(cx+(tile*3),cy+tile*4+tile,"HOLD ESC RETURN TO TITLE",c_red,c_red,c_red,c_red,(resetcheck/100)+(0.5*sign(resetcheck)));
	
	/*
	draw_text(cx+(tile*2),cy+tile*3+tile*2,"SQ1 - "+string(audio_sound_get_gain(global.ch[0])));
	draw_text(cx+(tile*2),cy+tile*3+tile*3,"SQ2 - "+string(audio_sound_get_gain(global.ch[1])));
	draw_text(cx+(tile*2),cy+tile*3+tile*4,"TRI - "+string(audio_sound_get_gain(global.ch[2])));
	draw_text(cx+(tile*2),cy+tile*3+tile*5,"NOI - "+string(audio_sound_get_gain(global.ch[3])));
	
	draw_text(cx+(tile*2),cy+tile*3+tile*6,"MOD - "+string(audio_sound_get_gain(global.ch[4])));
	*/

}

#endregion


#region fake load screen

if loadscreen > -1
{
	loadscreen --;
	
	var pal = lastenv
	if loadscreen < 10
	{pal = global.environment;}
	
	shader_set(shdColorswap);
	apply_palette(sPalette_background,pal,image_alpha);
		draw_sprite_stretched(sBG_0,0,0,0,SCREENW+1,SCREENH+1);
	shader_reset();
	
	instance_deactivate_all(true)
	instance_activate_object(oClient)
	instance_activate_object(oRacemanager)
	instance_activate_object(oIsArena)
	instance_activate_object(oPaused)
	
	if loadscreen = -1 && !instance_exists(oPaused)
	{instance_activate_all();}
}

#endregion


#region respawn

if instance_exists(oMario) && oMario.state = ps.die and instance_number(oMario) < 2
{
	diec ++;
	
	draw_set_alpha(0.4);
	draw_set_color(c_black)
	draw_rectangle(0,0,SCREENW,SCREENH,false)
	draw_set_color(-1);
	draw_set_alpha(1)
	
	draw_set_halign(fa_center)
	if global.player == "Gemaplys" 
	|| !instance_exists(oPlayer) && instance_exists(oLuigi) && global.playertwo == "Gemaplys"
	{draw_text(SCREENW/2,SCREENH/2,"SE FODEU!")}
	else {draw_text(SCREENW/2,SCREENH/2,"YOU DIED!1!! RESPAWNING...")}
	draw_set_halign(fa_left)
	
	if diec > room_speed*4
	{
		diec = 0; 
		if global.sync {instance_create_layer(oMario.xstart,oMario.ystart,"Instances",oMario);}
		else {
			try {
				if !instance_exists(oCheckpointmask) && room_exists(asset_get_index("rm"+string(global.world)+"_"+string(global.level))) && room != rmExtra_under
				{room_goto(asset_get_index("rm"+string(global.world)+"_"+string(global.level)));} 
				else 
				{room_restart()}
			} catch (bruh) {show_message("I guess the level just doesn't exist? IDK either way, back to the title screen..."); room_goto(rmTitle); if instance_exists(oClient) {disconnecttt(); oClient.alarm[3] = 20;}}
			if global.time != -1 
			{setTimer();}
		}
	}
	oMario.powerup = "s";
	if instance_exists(oLuigi) {oLuigi.powerup = oMario.powerup}
}


#endregion

draw_set_font(-1);