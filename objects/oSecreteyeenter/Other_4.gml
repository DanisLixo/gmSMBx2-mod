if room = troom and !instance_exists(oPaused) and oGame.spawnx != -2 
{
	if instance_exists(oMario) && instance_exists(oSecreteyeexit)
	{
		with(oSecreteyeexit)
		{
			teleported = true
		}
		instance_destroy();
	}
}

if (room != bornroom) {instance_destroy()}

image_index = 0