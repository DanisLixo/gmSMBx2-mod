if !onview()
{instance_destroy();}

draw_self()
draw_sprite_ext(sBowser_head,sign(firetimer),x,y-sprite_height,image_xscale,image_yscale,0,image_blend,image_alpha)


if !onview() or !(mario_freeze() = 0 or mario_freeze() = 4)
{exit;}

if die != false
{firetimer = 0;}


if firetimer > 0 
{firetimer --;}
if firetimer = 1
{instance_create_depth(bbox_left-8,bbox_top,depth,oBowserfire).readjust = true;}
