var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])

var xx = cx+SCREENW/2 //88-cx;
var yy = 160-cy;
var tsep = 16;

buttonsappear++

global.time = -1;
x = SCREENW/2

draw_sprite(sTitledx,image_index,x-cx,y-cy+8);
draw_sprite_ext(sTTGMI_blank, 0, SCREENW/2, yy-16, blockx, 4, 0, c_white, 1)

draw_set_halign(fa_right)
draw_set_font(global.fnt)
draw_text(SCREENW,SCREENH-8,"GMSMBx2 Ver. "+ VERSION)
draw_set_halign(-1)
draw_set_font(-1)

switch(state) {
	case 1:
		if y < ystart {vspd += 0.3;}
		else if y >= ystart {vspd = -vspd/2; if vspd = 0 state = 2;}
		y += vspd;
	break;
	case 2:
		if blockx < 8 {blockx += 0.2;}
		else {state = 3;}

		if global.player = "Max_Verstappen" {draw_sprite_ext(sOmaga,0,x-88,y-cy+68,0.8,1.8,0,c_white,1);}
	break;
	case 3:
		sel += keyboard_check_pressed(global.keyd)-keyboard_check_pressed(global.keyu)
		if sel < 0 {sel = 2; sfx(sndMenumove,0)}
		if sel > 2 {sel = 0; sfx(sndMenumove,0)}
		
		draw_set_font(global.fnt);
		draw_set_halign(fa_center)

		for (var i = 0; i < ds_list_size(menu); i ++;)
		{
			if i = sel	{
				var strl = string_width(menu[| i])/2
				shader_set(shdColorswap) 
					apply_palette(sPalette_gold,global.environment+1,1); 
					draw_sprite(sMushsel,oGame.image_index,xx-strl-tsep,yy+(i*tsep));
				shader_reset();
			}
			draw_text(xx,yy+(i*tsep),menu[| i]);
		}	
		draw_set_font(-1)
		draw_set_halign(-1)
	break;
}

if keyboard_check_pressed(global.keyj) or keyboard_check_pressed(vk_enter)	{ 
	if state = 3 {
		switch(menu[| sel])
		{
			case "START GAME":
				room_goto(rmGame_x2_Title);
			break;
			case "OPTIONS":
				room_goto(rmOpts_x2_Title);
			break;
			case "EXIT":
				alarm[0] = 2
				//draw_sprite(0,0,d)
				bgm("Levelend_Pokey",false)
			break;
		} sfx(sndMenuselect,0)	}
	else {state = 3; blockx = 8; y = ystart;}
}