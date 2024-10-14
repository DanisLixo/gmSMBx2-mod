if room != bornroom
{
	global.freecam = (changeCamera)? false : true;
	instance_destroy();
}