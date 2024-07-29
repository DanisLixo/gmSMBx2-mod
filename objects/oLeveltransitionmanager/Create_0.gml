alarm[0] = room_speed*3.3;

function pals() {
	var spritestring = "sPalette_mario"
	spritestring = string_replace(spritestring,"mario",string_lower(global.playertwo))
	
	if sprite_exists(asset_get_index(spritestring))
	{return asset_get_index(spritestring);}
	else {return sPalette_mario}
}

palp2 = pals()

