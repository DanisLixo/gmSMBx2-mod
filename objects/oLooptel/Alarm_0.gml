//oMario.image_alpha = 1;
warptrigger = false;

oMario.hspd = savedhspd;
oMario.vspd = savedvspd;
oMario.y = savedy;
oMario.depth = saveddepth;

i = 0
global.wwtrigger = false;

instance_create_depth(oMario.x,savedy-8,depth-1,oBlow);