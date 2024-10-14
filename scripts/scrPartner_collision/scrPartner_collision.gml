/// @function partner_collision

function partner_collision()
{
	var obj = instance_place(x,y,oParenemy)

	if obj {
		if obj.state != es.die && obj.state != es.stomp && starman > 0
		{
			with(obj) 
			{
				vspd = -2; 
				state = es.die; 
				dieface = (other.x < x? 1 : -1); 
				if object_index = oGoomba {points(100,true)}
				else if object_index = oHammerbro {points(1000,true)}
				else {points(200,true)}
			}
			sfx(sndKick,0);
		}
	}
	
	obj = instance_place(x,y,oPiranha);

	if obj {
		if starman > 0 
		{sfx(sndKick,0); points(200,true); instance_destroy(obj);}
	}
	
	obj = instance_place(x,y,oPodoboo);

	if obj && obj.st != -1 {
		if starman > 0 
		{sfx(sndKick,0); obj.st = -1}
	}
	
	obj = instance_place(x,y,oBowser);

	if obj && obj.state != -1 {
		if starman > 0
		{sfx(sndKick,0); points(200,true); obj.state = -1;}
	}
	
	obj = instance_place(x,y,oBowserfire);

	if obj {
		if starman > 0
		{sfx(sndKick,0); points(200,true); instance_destroy(obj);}
	}
 
	obj = instance_place(x,y,oCoin);

	if obj
	{
		global.coins += 1;
		global.score += 200;
		
		sfx(sndCoin,0)
	
		with(obj) {BLAST()}	
		instance_destroy(obj);
	}
	
	obj = instance_place(x,y,oBigcoin);

	if obj
	{
		global.p2_coins += 5;
		
		sfx(sndBigcoin,0)
		points(2000,true)
	
		with(obj) {BLAST()}	
		instance_destroy(obj);
	}
	
	obj = instance_place(x,y,oParpowerup);
	
	if obj
	{
		with (obj) {
			pufunc();
		}
	}
		
	if place_meeting(x,y-4,oCol)
	{
		// Block hitting
		if instance_exists(oParblock)
		{
			var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
			
			if block && block.blockstate = 0
			{block.blockstate = 1; 
			if powerup != "s" || char = "Toad" and global.abilities {block.triggerbreak = true;}}
			if block && !place_meeting(x,y,block)
			{sfx(sndBump,1);}
		}
	}
}