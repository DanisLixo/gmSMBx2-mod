if mario_freeze()	{image_speed = 0; exit;}

image_speed = 1;

event_inherited();

switch(state)
{
	case es.patrol:
	
	if eggd = -1 
	{if vspd > 4 {vspd = 4;} sprite_index = sSpinyegg; hspd = 0; if place_meeting(x,y+3,oCol) {eggd++}}
	
	if place_meeting(x+facingdir,y,oCol) && !collision_rectangle(bbox_left-16,bbox_top-16,bbox_right+16,bbox_bottom+16,oElevator,false,true)
	{facingdir = -facingdir}
	
	var longfunction = instance_place(x+facingdir,y,oParenemy);
	
	if longfunction and (longfunction.state != es.die and longfunction.state != es.shellhit)
	{longfunction.facingdir = -longfunction.facingdir; facingdir = -facingdir;}
	
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

