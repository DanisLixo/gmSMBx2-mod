if !onview()
{exit;}

if global.player = "Dawn" 
{
	draw_sprite(sprite_index,0,x,y);
	sprite_index = sAki;
}
else {draw_self()}