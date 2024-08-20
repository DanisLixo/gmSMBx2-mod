if mario_freeze()	{exit;}

event_inherited();


switch(state)
{
	case es.patrol:
	
	if place_meeting(x+facingdir,y,oCol) && !collision_rectangle(bbox_left-16,bbox_top-16,bbox_right+16,bbox_bottom+16,oElevator,false,true)
	{facingdir = -facingdir}
	
	var longfunction = instance_place(x+facingdir,y,oParenemy);
	
	if longfunction and (longfunction.state != es.die and longfunction.state != es.shellhit)
	{longfunction.facingdir = -longfunction.facingdir; facingdir = -facingdir;}
	
	hspd = maxhspd*facingdir
	
	if sign(sin(current_time/100)) != 0
	{xs = round(sign(sin(current_time/100)));}

	collide();
	
	break;
	case es.stomp:
	
		ind = 1
	
	break;
}