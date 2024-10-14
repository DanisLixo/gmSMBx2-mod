shader_set(shdColorswap);
	var color = c_white;
	if global.letterboxSprite = sLetterbox_Character {apply_palette(sPalette_tilebrown,global.environment,image_alpha)}
	else if global.letterboxSprite = sLetterbox_Simple {apply_palette(sPalette_background,global.environment,image_alpha)}
	else if global.letterboxDark {color = c_gray}
	draw_sprite_tiled_ext(global.letterboxSprite, 0, 0, 0, 1, 1, color, 1)
shader_reset();

if global.letterboxSprite = sLetterbox_Character {
	var scale = 1;

	if global.player = "Peter Griffin"	{scale = 0.1;}
	if global.player = "Duke"	{scale = 0.1;}
	if global.player = "Pokey" {scale = 0.1;}
	if global.player = "Max Verstappen" {scale = 0.1;}
	if global.player = "Peppino" {scale = 0.3;}
	if global.player = "Anton" {scale = 0.3}
	if global.player = "1pixelmario" {scale = 2;}
	if global.multiplayer 
	{
		var scalep2 = 1;

		if global.playertwo = "Peter Griffin"	{scalep2 = 0.1;}
		if global.playertwo = "Duke"	{scalep2 = 0.1;}
		if global.playertwo = "Pokey" {scalep2 = 0.1;}
		if global.playertwo = "Max Verstappen" {scalep2 = 0.1;}
		if global.playertwo = "Peppino" {scalep2 = 0.1;}
		if global.playertwo = "Anton" {scalep2 = 0.3}
		if global.playertwo = "1pixelmario" {scalep2 = 2;}
	}

	shader_set(shdColorswap);
	apply_palette(global.palettesprite,global.paletteindex,image_alpha)
	for (var i = 0; i < 30; i++) 
	{
		for (var j = 0; j < 30; j++) 
		{
			var k = i+j;
			var spr = 0
			if global.multiplayer 
			{
				switch(k mod 10) {
				case 0: spr = ms("sMario_s_jump", global.player) break;
				case 1: spr = ms("sMario_s_jump", global.playertwo) break;
				case 2: spr = ms("sMario_s_die", global.player) break;
				case 3: spr = ms("sMario_s_die", global.playertwo) break;
				case 4: spr = ms("sMario_s_pivot", global.player) break;
				case 5: spr = ms("sMario_s_pivot", global.playertwo) break;
				case 6: spr = ms("sMario_s_walk", global.player) break;
				case 7: spr = ms("sMario_s_walk", global.playertwo) break;
				case 8: spr = ms("sMario_s_idle", global.player) break;
				case 9: spr = ms("sMario_s_idle", global.playertwo) break;
				}
				
				if k mod 2 == 0
				{draw_sprite_ext(spr,oGame.image_index,x+112*j,y+112*i,4*scale,4*scale,0,-1,1)}
				else
				{draw_sprite_ext(spr,oGame.image_index,x+112*j,y+112*i,4*scalep2,4*scalep2,0,-1,1)}
			}
			else {
				switch(k mod 5) {
				case 0: spr = ms("sMario_s_jump", global.player) break;
				case 1: spr = ms("sMario_s_die", global.player) break;
				case 2: spr = ms("sMario_s_pivot", global.player) break;
				case 3: spr = ms("sMario_s_walk", global.player) break;
				case 4: spr = ms("sMario_s_idle", global.player) break;
				}
				if global.player = "1pixelmario" {spr = s1pixelmario_s_idle}
				
				draw_sprite_ext(spr,oGame.image_index,x+112*j,y+112*i,4*scale,4*scale,0,-1,1)
			}
		}
	}
shader_reset();
}