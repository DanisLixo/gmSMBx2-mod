if other.vspd < 0
{vspd = -2; if state != es.die {state = es.die; points(100,true); sfx(sndKick,0);} dieface = (other.bbox_right-8 < x? 1 : -1);}