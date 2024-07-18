if mario_freeze()	{image_speed = 0; exit;}

event_inherited();

switch(state)
{
	case es.patrol:
	
	if eggd = -1 
	{sprite_index = sSpinyegg; hspd = 0; if place_meeting(x,y+3,oCol) {eggd++}}
	
	if place_meeting(x+facingdir,y,oCol)
	{facingdir = -facingdir}
	
	if instance_place(x+facingdir,y,oParenemy) && instance_place(x+facingdir,y,oParenemy).state = es.patrol && instance_place(x+facingdir,y,oParenemy).y = y
	{instance_place(x+facingdir,y,oParenemy).facingdir = -instance_place(x+facingdir,y,oParenemy).facingdir; facingdir = -1;}
	
	if eggd >= 0 and eggd < 5
	{hspd = maxhspd*facingdir; 	sprite_index = sSpiny}
	
	if sign(sin(current_time/100)) != 0
	{xs = round(sign(sin(current_time/100)));}
	

	collide();
	
	break;
	case es.stomp:
	
		ind = 1
	
	break;
}

