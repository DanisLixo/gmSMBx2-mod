if !onview()
{exit;}

if !play_animation 
{
	if delay != -1
	{image_index = 0;}
	else 
	{
		image_index = sprite_get_number(sprite_index)-1;
	}
}

if play_animation 
{
	if image_index >= sprite_get_number(sprite_index)-1 
	{
		image_index = sprite_get_number(sprite_index)-1; 
		if delay > -1 {delay++;}
	}
}
if bub_ind != 0 {draw_sprite(sRetrossona_bubble,bub_ind,x,bbox_top-4); bub_ind += 0.3;}
if delay >= 55 
{play_animation = false; moving = true; delay = -1}

draw_self();

draw_sprite_ext(sPlatform_LL,0,x-sprite_width/2,bbox_bottom-1,sprite_width/sprite_get_width(sPlatform_LL),1,0,-1,1);