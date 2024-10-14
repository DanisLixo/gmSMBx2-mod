function ps_dance0()
{
	//if char == "Peppino" {state = ps.dancepep}
	
	var deccel = 0.1
	if abs(hspd) - deccel <= 0
	{hspd = 0;}
	if abs(hspd) > 0
	{hspd -= deccel*sign(hspd);}
	
	
	if krp - klp != 0 or kjp
	{state = ps.normal;}
	if kdp && powerup != "s" && !(char = "Dawn" && char = "Sonic" and global.abilities)
	{state = ps.crouch;}
	else if kdp && (char = "Dawn" or char = "Sonic")
	{state = ps.crouch;}
	if khp and global.commandenys = true {state = ps.nah}
	spr = ms("sMario_{}_dance0");
	if global.opacandastar = true and !audio_is_playing(sndOpacandastar)
	{sfx(sndOpacandastar,1);}
	if sprite_get_number(spr) > 200
	{ind += 0.5;}
	ind += 0.5;
	collide();
}
