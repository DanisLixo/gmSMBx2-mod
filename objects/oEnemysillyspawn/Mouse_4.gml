if state = es.patrol {
	dieface = choose(1,-1); 
	sfx(sndKick,0);
	state = es.die;
}