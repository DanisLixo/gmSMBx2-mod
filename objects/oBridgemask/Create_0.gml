depth = 199



active = 0;

image_alpha = 0;

bridgecol = instance_place(x,y,oCol);
if instance_exists(oBowser) {
alarm[1] = 2;
}
else {bridgecol = instance_place(x,y,oCol);}