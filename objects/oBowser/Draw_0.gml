if oMario.x < xstart-16*96
{exit;}

if die = 2 && !onview()
{instance_destroy();}

if state != -1 {
	if global.player = "Max Verstappen" {sprite_index = sHamilton_feet
		draw_sprite_ext(sHamilton_head,sign(firetimer),x-1,y-sprite_height+3,image_xscale,image_yscale,0,image_blend,image_alpha)
		} else {draw_sprite_ext(sBowser_head,sign(firetimer),x,y-sprite_height,image_xscale,image_yscale,0,image_blend,image_alpha)}
		draw_self(); 
} else {
	switch (global.world) {
	    case 1:
	        sprite_index = sGoomba;
	    break;
	    case 2:
	        sprite_index = sNokonoko_shell;
	    break;
	    case 3:
	        sprite_index = sBuzzy_shell;
	    break;
	    case 4:
	        sprite_index = sSpiny;
	    break;
	    case 5:
	        sprite_index = sLakitu;
	    break;
	    case 6:
	        sprite_index = sBlooper;
	    break;
	    case 7:
	        sprite_index = sHammerbro;
	    break;
	    case 8:
	        if global.player = "Max Verstappen" {sprite_index = sHamilton_feet
			draw_sprite_ext(sHamilton_head,sign(firetimer),x-1,y-sprite_height+3,image_xscale,image_yscale,0,image_blend,image_alpha)
			} else {draw_sprite_ext(sBowser_head,sign(firetimer),x,y-sprite_height,image_xscale,image_yscale,0,image_blend,image_alpha)}
	    break;
	}
	shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,image_alpha)
		if sprite_index = sBlooper {image_index = 1;}
		draw_self();
	shader_reset()
}

if !(mario_freeze() = 0 or mario_freeze() = 4)
{exit;}