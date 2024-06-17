if room = rmServer
{;}

#region //hats hud

if room != rmTitle and room != rmServer {
	if global.player = "Pokey" or global.player = "Gemaplys" {
		if !global.showfps {
		draw_set_font(FNT);
		draw_text(24,8*3,"HATS - " + string(hats-instance_number(oHatThrow)));
		}
		else if !instance_exists(oClient) {
		draw_set_font(FNT);
		draw_text(24,8*4,"HATS - " + string(hats-instance_number(oHatThrow)));
		}
		else {
		draw_set_font(FNT);
		draw_text(24,8*5,"HATS - " + string(hats));
		}
	}
}
#endregion

#region //Pause gui

var cx = 0; cy = 0;
var tile = 8

/*Cant keep the scary cuz bad game design
if debug && pause {destroy ++; 
	if destroy%12 = 0 && global.environment != e.snow {global.environment++;} else if destroy%12 = 0 && global.environment = e.snow {global.environment = -1;} 
	if destroy = 100 {game_end()}}
	
if destroy > 0 {debug = true; pause = true; 
	audio_stop_all();
	global.time = random(10000); 
	global.score = random(10000);
	global.player = "Oh no...";
	global.world = random(8);
	global.level = random(8);
	global.coins = random(99);
	global.showfps = false;
	global.showpfp = false;} */
	
if room != rmTitle and room != rmServer and room != rmLeveltransition and triggercastleflag = false
{
	if (keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter)) && global.chatfocus = false and !debug and !pause
	{pause = !pause; pausesel = 0; sfx(sndPause,0); delay = 0;}
}
		
if pause
	{
		delay++
		
		if !instance_exists(oClient) 
		{
			instance_deactivate_all(true);
			global.time++;
			audio_pause_sound(global.ch[0]);
			audio_pause_sound(global.ch[1]);
			audio_pause_sound(global.ch[2]);
			audio_pause_sound(global.ch[3]);
			audio_pause_sound(global.ch[4]);
		}
		draw_sprite_ext(sThefucktextgavemeideas, 0, SCREENW/2, SCREENH/2, SCREENW/20, SCREENH/40,0, c_white, 1)
		draw_sprite(sMushsel,image_index,(SCREENW/3)+4+(tile*-2)+cx,(tile*11)+((tile*2)*pausesel)+tile+cy)
			
		pausesel += keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu)
		pausesel = clamp(pausesel,0,2);
			
			
			
		draw_set_font(FNT)
		draw_text((SCREENW/3),(tile*10)+tile*2,"RESUME");
		draw_text((SCREENW/3),(tile*10)+tile*4,"RESTART");
		draw_text((SCREENW/3),(tile*10)+tile*6,"EXIT TO MENU");
			
		if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.keyj)) && destroy = 0 && delay >= 10
		{
			switch(pausesel)
			{
				case 0: pause = !pause; break;
				case 1: room_restart(); pause = !pause; break;
				case 2: room_goto(rmTitle); pause = !pause; break;
			}
			delay = 0;
			spawnx = -1;
			spawny = -1;
			instance_activate_object(oNekoPresence);
		}
	}
	else {
		instance_activate_all();
		audio_resume_sound(global.ch[0]);
		audio_resume_sound(global.ch[1]);
		audio_resume_sound(global.ch[2]);
		audio_resume_sound(global.ch[3]);
		audio_resume_sound(global.ch[4]);
		}
	
#endregion

/// handle gui
draw_set_font(FNT)


#region DEBUG gui

var cx = 0; cy = 0;//camera_get_view_x(view_camera[0]); var cy = camera_get_view_y(view_camera[0]);
var tile = 8

draw_set_font(FNT);

if room != rmTitle and room != rmServer and room != rmLeveltransition && global.debug = true
{
	
	if !instance_exists(oClient)
	{
		if keyboard_check_pressed(vk_tab) and !pause 
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
			debugsel = clamp(debugsel,0,7);
			
			
			
			draw_set_font(fntComicsmall)
			
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*1+cy,"RTXMODE"); boolbox(global.rtxmode,0);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*2+cy,"SCHUTMODE"); boolbox(global.schutmode,1);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*3+cy,"FREECAM"); boolbox(global.freecam,2);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*4+cy,"TRIPPYMODE"); boolbox(global.trippymode,3);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*5+cy,"COMMANDER"); boolbox(global.commandenys,4);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*6+cy,"ENVIRONMENT"); boolbox(-1,5);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*7+cy,"WARP"); boolbox(-1,6);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*8+cy,"PLAYER"); boolbox(-1,7);
			
			draw_set_font(FNT);
			
			if keyboard_check_pressed(vk_enter)
			{
				switch(debugsel)
				{
					case 0: global.rtxmode = !global.rtxmode; break;
					case 1: global.schutmode = !global.schutmode; break;
					case 2: global.freecam = !global.freecam; break;
					case 3: global.trippymode = !global.trippymode; break;
					case 4: global.commandenys = !global.commandenys; break;
					case 5: if global.environment != e.snow {global.environment += 1;} else {global.environment = -1;} break;
					case 6: 
						var _gr = get_string("ROOM NAME","rm1_1");
						if room_exists(asset_get_index(_gr))	{room_goto(asset_get_index(_gr));}
					break;
					case 7: global.player = get_string("PLAYER NAME (IN-GAME CHARACTERS ONLY)","Mario") break;
				}
			}
		}
	}
	else
	{global.freecam = true; debug = false;}


	if global.schutmode = true && !instance_exists(oGun) && instance_exists(oMario) {instance_create_depth(0,0,depth,oGun);}

	/*
	if global.rtxmode = true	{draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*1+cy,"RTXMODE");}
	if global.schutmode = true	{draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*2+cy,"SCHUTMODE");}
	*/
	
	if global.showfps = true {
		if !instance_exists(oClient) {draw_text(cx+(tile*3),cy+tile*2+tile,"FPS - "+string(fps));}
		else {draw_text(cx+(tile*3),cy+tile*3+tile,"FPS - "+string(fps));}
		}
	
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
	
	if loadscreen = -1
	{instance_activate_all();}
}

#endregion


#region respawn

if instance_exists(oMario) && oMario.state = ps.die
{
	diec ++;
	
	draw_set_alpha(0.4);
	draw_set_color(c_black)
	draw_rectangle(0,0,SCREENW,SCREENH,false)
	draw_set_color(-1);
	draw_set_alpha(1)
	
	draw_set_halign(fa_center)
	draw_text(SCREENW/2,SCREENH/2,"YOU DIED!1!! RESPAWNING...")
	draw_set_halign(fa_left)
	
	if diec > room_speed*4
	{diec = 0; room_restart(); if global.time != -1 {global.time = timeunits(400)}}
	oMario.powerup = "s"
}


#endregion

draw_set_font(-1);