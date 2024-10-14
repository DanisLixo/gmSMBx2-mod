// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_playerpalette(player2 = false)
{
	if !player2 {
		if sprite_exists(asset_get_index("sPalette_"+string_lower(global.player)))
		{
			if global.player = "Goomba"	{global.palettesprite = asset_get_index("sPalette_goombaplayer");}
			else	{global.palettesprite = asset_get_index("sPalette_"+string_lower(global.player));}
		}
		else
		{global.palettesprite = sPalette_mario;}
	} else {
		if sprite_exists(asset_get_index("sPalette_"+string_lower(global.playertwo)))
		{
			if global.playertwo = "Goomba"	{global.p2_palettesprite = asset_get_index("sPalette_goombaplayer");}
			else	{global.p2_palettesprite = asset_get_index("sPalette_"+string_lower(global.playertwo));}
		}
		else
		{global.p2_palettesprite = sPalette_luigi;}
	}
}