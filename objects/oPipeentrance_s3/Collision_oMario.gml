if other.kd 
{
	other.state = ps.enterpipedown;
	other.pipeinforoom = troom; 
	sfx(sndWarp,1);
		
	if other.powerup != "s" && other.char != "Dawn"
	{other.spr = ms("sMario_{}_crouch");}
	else if other.char = "Dawn"
	{other.spr = ms("sMario_{}_downpipe");}
}