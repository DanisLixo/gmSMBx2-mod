if m.char = "Dawn" 
{
	draw_sprite(sF_arrow,-1,x,y);
}
else if m.char = "1pixelmario" 
{
	draw_sprite(s1pxFb,-1,x,y);
	y = y-8
}
else {draw_self()}