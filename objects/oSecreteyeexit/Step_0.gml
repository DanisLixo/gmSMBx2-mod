if (teleported == true) {
	global.scaled = true;
	oMario.x = x
	oMario.y = y+sprite_get_height(oMario.sprite_index)-12
	oMario.scale = 0
} else {
	if (oMario.scale < savedscale) {global.scaled = false;}
}

if (destroytimer > 0) {destroytimer--}

if (destroytimer = 0) {
	if (sprite_index != sSecreteye_oofb)
	{sprite_index = sSecreteye_oofb; image_index = 0;}
}

if (sprite_index = sSecreteye_openb && image_index >= 8)
{
	sfx(sndSecretexit,0);

	oMario.state = ps.normal;

	teleported = false;

	image_index = 0; sprite_index = sSecreteye_idleb; destroytimer = room_speed*3
}

if (sprite_index == sSecreteye_oofb && image_index > 4) {instance_destroy()}