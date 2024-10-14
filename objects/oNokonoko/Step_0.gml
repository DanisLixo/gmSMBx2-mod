
if mario_freeze()	{image_speed = 0; exit;}

event_inherited();


switch(state)
{
	case es.patrol:
	moveshelled = true;
	
	if place_meeting(x+facingdir,y,oCol) && !place_meeting(x+facingdir,y,oSlope) && !collision_rectangle(bbox_left-16,bbox_top-16,bbox_right+16,bbox_bottom+16,oElevator,false,true)
	{facingdir = -facingdir}
	
	var longfunction = instance_place(x+facingdir,y,oParenemy);
	
	if longfunction and (longfunction.state != es.die and longfunction.state != es.shellhit)
	{longfunction.facingdir = -longfunction.facingdir; facingdir = -facingdir;}
	
	hspd = maxhspd*facingdir
	
	image_speed = imgspd
	sprite_index = sNokonoko

	collide();
	
	break;
	case es.patrolwinged:
	
	if place_meeting(x+facingdir,y,oCol) && !place_meeting(x+facingdir,y,oSlope) && !collision_rectangle(bbox_left-16,bbox_top-16,bbox_right+16,bbox_bottom+16,oElevator,false,true)
	{facingdir = -facingdir}
	
	var longfunction = instance_place(x+facingdir,y,oParenemy);
	
	if longfunction and (longfunction.state != es.die and longfunction.state != es.shellhit)
	{longfunction.facingdir = -longfunction.facingdir; facingdir = -facingdir;}
	
	hspd = maxhspd*facingdir
	
	image_speed = imgspd
	sprite_index = sNokonoko_winged_green
	
	if grounded
	{vspd = -4;}

	if !grounded
	{vspd -= 0.2;}

	collide();
	
	
	break;
	case es.shell:
	
		if grounded
		{hspd = 0;}
		
		if shellcooldown <= 0
		{shellcooldown --; moveshelled = false;}
		
		if shellcooldown < -room_speed*5
		{image_index = sin(current_time/30);}
		else
		{image_index = 0;}
		
		if shellcooldown < -room_speed*6
		{state = es.patrol; shellcooldown = 0;}
		
		
		if instance_place(x,y,oMario) && shellcooldown < 0
		{
			if instance_place(x,y,oMario).x > x		{facingdir = -1;}
			else {facingdir = 1;}
			
			if instance_place(x,y,oMario).combo < 1 {points(400,true)}
			else {points(choose(500,800),true)}
			
			state = es.shellhit;
			sfx(sndKick,0)
			shellcooldown = 5;
			
			if !grounded and !given8000 {points(8000,true) given8000 = true}

		}
		
		sprite_index = sNokonoko_shell
		
		collide();
	
	break;
	case es.shellhit:
	moveshelled = false;
		
		if place_meeting(x+facingdir,y,oCol)  && !place_meeting(x+facingdir,y,oSlope)
		{facingdir = -facingdir;
			if onview() {sfx(sndBump,0)}
		}
		
		hspd = 3*facingdir
		
		image_index = 0;
		sprite_index = sNokonoko_shell
		
		var m = instance_place(x,y,oMario)
		if m && m.grounded = false && stomptype <= 2 && shellcooldown <= 0 //&& m.vspd >= 0
		{
			m.vspd = -3;
			points(100,true);
			state = es.shell;
			shellcooldown = 10
		}
		else if m && ((m.vspd <= 0 && m.y >= bbox_bottom-2) or m.grounded) && shellcooldown <= 0
		{
			if (hspd > 0 && m.x > x) or (hspd < 0 && m.x < x)
			{m.gethit = 1;}
		}
	
		collide();
		
	break;
}

if flyt_delay > 0 {flyt_delay--;}

if state = es.die
{sprite_index = sNokonoko_shell; image_index = 0;}
