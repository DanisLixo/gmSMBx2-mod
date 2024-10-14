if (teleported == true) && oGame.spawnx != -2
{
	if (instance_place(x,y,oSecreteyeenter)) {instance_destroy(instance_place(x,y,oSecreteyeenter))}
	image_alpha = 1;
	sprite_index = sSecreteye_openb;
	oCamera.x = x
	oMario.state = -1;
}