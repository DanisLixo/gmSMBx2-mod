function ps_climb()
{
	spr = ms("sMario_{}_climb");
	
	if kjp 
	{state = ps.normal; x -= image_xscale * 8; hspd = 0; vspd = 0;}
	
	if ku
	{y --;}
	if !place_meeting(x,y,oBeanstalk) {state = ps.normal; hspd = 0; vspd = -2;}
	if kd && !place_meeting(x,y+1,oCol)
	{y ++;}
	
	if place_meeting(x,y+1,oCol)
	{state = ps.normal; x -= image_xscale * 8; hspd = 0; vspd = 0;}
	
	if ku - kd != 0
	{ind += 0.2;}
	
	if kr
	{image_xscale = -1;}
	if kl
	{image_xscale = 1;}
}

function ps_emerge()
{
	spr = ms("sMario_{}_climb");
	
	if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true
	{exit;}
	
	if !place_meeting(x,y-1,oPlatformtriggerlu) && !place_meeting(x,y-1,oPlatformtriggerrd)
	{image_xscale = 1; y -= 0.8; ind += 0.14;}
	else
	{
		if hspd < 1
		{hspd += 0.05; ind = 0;}
		if hspd = 1
		{ind += 0.05; image_xscale = -1;}
		if ind >= 1 
		{state = ps.normal; x += 8; spr = ms("sMario_{}_walk"); hspd = 0; image_xscale = 1;}
		
	}
}
