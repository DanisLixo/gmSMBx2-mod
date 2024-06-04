if instance_place(x+facingdir,y,oPiranha) && state = es.shellhit
{
	points(100,true);
	instance_destroy(instance_place(x+facingdir,y,oPiranha),false)
	sfx(sndKick,0); 
}


