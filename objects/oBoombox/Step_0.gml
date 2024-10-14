if mario_freeze() || !onview() || (notyours = true && myroom != room)	{exit;}
if !audio_is_playing(sndBreakdancemusic) 
{
	sfx(sndBreakdancemusic,4); vspd -= 2 
	image_xscale += 0.15; image_yscale += 0.15; 
}

collide();
if instance_exists(oMario) {
	if oMario.state != ps.dancepep && !notyours
	{instance_destroy();}
}

if hspd > 0 {hspd -= 0.1;}
if image_xscale > 0.45 {image_xscale -= 0.05}
if image_yscale > 0.45 {image_yscale -= 0.05}