scale = 1;

if global.player = "Peter Griffin"	{scale = 0.1;}
if global.player = "Duke"	{scale = 0.1;}
if global.player = "Pokey" {scale = 0.1;}
if global.player = "Max_Verstappen" {scale = 0.1;}
if global.player = "Anton" {scale = 0.3}
if global.player = "1pixelmario" {scale = 0.1;}


shader_set(shdColorswap);
apply_palette(sPalette_tilebrown,global.environment,image_alpha)
draw_sprite_tiled_ext(global.letterboxSprite, 0, x, y, 1, 1, c_white, 1)
shader_reset();

shader_set(shdColorswap);
apply_palette(global.palettesprite,global.paletteindex,image_alpha)
for (var i = 0; i < 30; i++) 
{
	for (var j = 0; j < 30; j++) 
	{
		var k = i+j;
		var spr = 0
		if global.player = "1pixelmario" {spr = s1pixelmario_s_idle}
		else if k mod 4 = 0 {spr = ms("sMario_s_jump", global.player)}
		else if k mod 4 = 1 {spr = ms("sMario_s_die", global.player)}
		else if k mod 4 = 2 {spr = ms("sMario_s_pivot", global.player)}
		else if k mod 4 = 3 {spr = ms("sMario_s_walk", global.player)}
		else {spr = ms("sMario_s_idle", global.player)}
		draw_sprite_ext(spr,oGame.image_index,x+112*j,y+112*i,4*scale,4*scale,0,-1,1)
	}
}
shader_reset();
