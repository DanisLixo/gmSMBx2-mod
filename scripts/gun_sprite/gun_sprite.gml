function gs(gunspritestr) {
	var oops = sprite_get_name(sprite_index);
	oops = string_replace(gunspritestr,global.gunskin,"Default");
	gunspritestr = string_replace(gunspritestr,"Default",global.gunskin);
	
	if sprite_exists(asset_get_index(gunspritestr))
	{return asset_get_index(gunspritestr);}
	else if ds_map_find_value(global.moddedSprites, gunspritestr) != undefined
	{
		return ds_map_find_value(global.moddedSprites, gunspritestr)
	}
	else
	{return asset_get_index(oops);}
}
