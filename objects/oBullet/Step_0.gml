 image_angle = direction


if !onview()
{instance_destroy();}

if place_meeting(bbox_left,y,oCol) && place_meeting(bbox_right,y,oCol) or instance_place(x,y,oBowser)
{
	instance_destroy()
}
