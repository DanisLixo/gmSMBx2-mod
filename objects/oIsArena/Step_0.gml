if start 
{
	if arenarespawn = 0
	{
		with(oParblock)
		{
			instance_create_depth(x,y,depth-10,object_index);
		
			var b = instance_create_depth(x,y,depth,oBLAST);
			b.image_xscale = 0.4;
			b.image_yscale = 0.4;
		
			instance_destroy();
		}
	
		arenarespawn = room_speed*15;
	}
	if arenarespawn > 0
	{arenarespawn --;}

	with (oOtherplayer) {
		if mystars > other.star_record 
		{other.star_record = mystars;}
		if mystars >= global.goalofstars && other.win == -1 
		{other.winner = username; other.win = 0;}
	}
	if global.stars > star_record 
	{star_record = global.stars;}
	if global.stars >= global.goalofstars && win == -1
	{winner = global.username; if win == -1 {win = 0;}}

	if win == 0 
	{
		bgm("Castleend",true);
		
		instance_deactivate_object(oSuperstar);
		instance_deactivate_object(oSuperstarspawn);
	}
	if win >= 0
	{win++;}
	if win > 250 
	{
		global.arena++;
		if room_exists(asset_get_index("rmArena_"+string(global.arena)))
		{room_goto(asset_get_index("rmArena_"+string(global.arena)));}
		else 
		{global.arena = 1; room_goto(asset_get_index("rmArena_"+string(global.arena)));}
	}
}
