if room != troom {
	teleporting = true;
	if (sprite_index != sSecreteye_oofa) {
		image_index = 0;
		sprite_index = sSecreteye_oofa;
		image_alpha = 1;
		sfx(sndSecretenter,0);
	}
}