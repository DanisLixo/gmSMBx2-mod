// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ms(spritestring, indexused = global.player)
{
	var pu = oGame.savedpowerup;
	if object_index == oLuigi {pu = oGame.p2savedpowerup; indexused = global.playertwo}
	
	if indexused == "Max Verstappen" {spritestring = "sMax_Verstappen_{}_idle"}
	
	if object_get_parent(object_index) == oMario
	{
		indexused = char;
		
		var pu = powerup;
		if (pu = "f" || pu = "c") and indexused != "1pixelmario" and indexused != "Max Verstappen"
		{pu = "b";}
		
		if indexused == "Max Verstappen" && state == ps.pivot && powerup == "f" {spritestring = "sMax_verstappen_{}_pivot"}
		else if indexused == "Max Verstappen" {spritestring = "sMax_Verstappen_{}_idle"}
		
		if indexused = "Goldron"
		{return sGoldron;}
	}
	if indexused == "1pixelmario" {spritestring = "s1pixelmario_{}_idle"}
	if indexused == "Peppino" {spritestring = "sPeppino"}
	
	spritestring = string_replace(spritestring,"Mario",indexused);
	spritestring = string_replace(spritestring,"{}",pu)
		
	if indexused = "Anton"
	{return sAnton;}
	if indexused = "Goldron"
	{return sGoldron_s;}
	if indexused = "Peter Griffin"
	{return sPeterGriffin;}
	if indexused = "Duke"
	{return sDuke;}
	if indexused = "Pokey"
	{return sPokey;}
	
	if sprite_exists(asset_get_index(spritestring))
	{return asset_get_index(spritestring);}
	
	else if ds_map_find_value(global.moddedSprites, spritestring) != undefined
	{
		if ds_map_find_value(global.moddedSprites, "s" + indexused) 
		{return ds_map_find_value(global.moddedSprites, "s" + indexused)}
		else 
		{return ds_map_find_value(global.moddedSprites, spritestring)}
	}
	
	else
	{
		if object_get_parent(object_index) = oMario and sprite_exists(spr) {return spr;}
		else {return superFUCKINGmario}
	}
}