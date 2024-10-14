if global.titleroom == rmTitle_MK {
	marioSpawnTimer--
	if marioSpawnTimer <= 0 {
		marioSpawnTimer = irandom_range(60, 180)
		instance_create_depth(-96, 208, depth + 1, oMarioRunner)
	}
}
if global.titleroom == rmTitle_new && (instance_exists(oMario) && oMario.playDemo > room_speed*6)  {
	marioSpawnTimer--
	if marioSpawnTimer <= 0 {
		marioSpawnTimer = irandom_range(60, 180)
		instance_create_depth(-96, 208, depth + 1, oMarioDemorunner)
	}
}