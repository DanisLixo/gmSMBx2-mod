if instance_exists(oMario) && instance_exists(oSkyexit) && room != bornroom and oGame.spawnx != -2 
{
	oMario.x = oSkyexit.x;
	oMario.y = oSkyexit.y;
	oMario.image_xscale = 1;
	oMario.vspd = -0.5
}


if room != bornroom
{
	global.freecam = change_camera? true : false
	instance_destroy();
}