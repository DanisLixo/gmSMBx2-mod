if !onview()
{exit;}

if global.player = "Dawn" 
{
	draw_sprite(sprite_index,0,x,y);
	if nah {sprite_index = sTHannah_eh;}
	else {sprite_index = sTHannah;}
}
else {draw_self()}