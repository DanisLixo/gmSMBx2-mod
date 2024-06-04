if global.player = "Dawn" 
{
	draw_sprite(sTHannah,0,x,y);
	if oMario.state = ps.nah {image_index = sTHannaheh; sfx(sndBump,0);}
}
else {draw_self()}