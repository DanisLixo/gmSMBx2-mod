if mario_freeze() != 0
{exit;}

var otherside = instance_nearest(x,y,oSeesaw)
	
gspd = lerp(gspd,g*1.3,.02);
	if side = 1 {
		if place_meeting(x,y-4,oMario)// && falling = false
		{y += gspd;
		otherside.y -= gspd;	
		}
		
		if place_meeting(x,y-4,oMario) && oMario.vspd >= 0// && falling = false
		{oMario.y += gspd;}
		
		if place_meeting(x,y,oPlatformtriggerrd)
		{
			y -= gspd;
			otherside.y -= gspd;
			falling = true;
		}
	}
	else if side = 0 {
		if place_meeting(x,y-1,oMario)// && falling = false
		{y += gspd;
		//otherside.y -= gspd;	
		}
		
		if place_meeting(x,y-1,oMario) && oMario.vspd >= 0// && falling = false
		{oMario.y += gspd;}
		
		if place_meeting(x,y,oPlatformtriggerrd)
		{
			y -= gspd;
			//otherside.y -= gspd;
			falling = true;
	}
}


if place_meeting(x, y-4,oMario) && global.moveobjs && oMario.state = ps.nah
{
	if oMario.khp {sfx(sndBump,0);}
	if oMario.image_xscale = 1
		{if g = -1 {g = 1}}
	if oMario.image_xscale = -1
		{if g = 1 {g = -1}}
}