if other.vspd < 0
{vspd = -2; if state != es.die {state = es.die; points(100,true);} dieface = (other.bbox_right-8 < x? 1 : -1); sfx(sndKick,0);}