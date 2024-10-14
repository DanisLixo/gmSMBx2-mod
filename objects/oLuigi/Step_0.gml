kr = keyboard_check(global.p2_keyr)
kl = keyboard_check(global.p2_keyl)
kd = keyboard_check(global.p2_keyd)
ku = keyboard_check(global.p2_keyu)

kj = keyboard_check(global.p2_keyj)
ka = keyboard_check(global.p2_keya)
kh = keyboard_check(global.p2_keyh)

kjp = keyboard_check_pressed(global.p2_keyj)
kap = keyboard_check_pressed(global.p2_keya)
khp = keyboard_check_pressed(global.p2_keyh)

kar = keyboard_check_released(global.p2_keya)
khr = keyboard_check_released(global.p2_keyh)

krp = keyboard_check_pressed(global.p2_keyr)
klp = keyboard_check_pressed(global.p2_keyl)
kup = keyboard_check_pressed(global.p2_keyu)
kdp = keyboard_check_pressed(global.p2_keyd)

if instance_exists(oPaused) || in_cutscene
{kr=0;kl=0;krp=0;klp=0;kd=0;kj=0;ka=0;kjp=0;kar=0;kdp=0;kh=0;khp=0;khr=0;ku=0;kup=0}

if instance_exists(oClient) {instance_destroy(); global.multiplayer = false}

char = global.playertwo

if oMario.playDemo > room_speed*8
{
	instance_create_depth(oLuigi.x,oLuigi.bbox_top+6,oLuigi.depth-1,oBlow); instance_destroy();
}

event_inherited();

//if powerup = "c" {powerup = "f"}

if powerup = "s" {
	if instance_exists(oPlayer) {
		if oPlayer.powerup = "s" {global.hats = 0} 
		else {global.hats = 0}
	}
}

if insidecar {
	x = oPlayer.x
	y = oPlayer.y
	image_alpha = 0;
	invincible = 10
}