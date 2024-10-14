function cs(capestring = "") {
	var m = instance_nearest(x,y,oMario)
	if capestring == "" {
		capestring = sprite_get_name(m.spr)
		capestring = string_replace(capestring, m.char + "_b", "Cape")
	}
	capestring = string_replace(capestring, "run", "walk")

	
	if sprite_exists(asset_get_index(capestring))
		{return asset_get_index(capestring);}
	else
		{return sCape_idle;}
}