if state != ps.die {
	if onview() {
		state = ps.die;
		sfx(sndDieShort, 0)
	}
}