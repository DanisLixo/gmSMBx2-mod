if other.vspd < 0
{
	vspd = -2; 
	if state != es.shell {state = es.shell; points(200,true);}
	var shellface = (other.bbox_right-8 < x? 1 : -1); 
	if moveshelled {hspd = 0.5*shellface;}
	shellcooldown = 10
}