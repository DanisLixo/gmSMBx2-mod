vspd = -6

if instance_nearest(x,y+32,oMario).object_index = oLuigi {
	global.p2_coins += 1;
	global.p2_score += 200;
}
else {
	global.coins += 1;
	global.score += 200;
}

sfx(sndCoin,0)

alarm[0] = 27


