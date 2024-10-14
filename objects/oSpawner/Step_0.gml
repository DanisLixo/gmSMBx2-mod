spawnEny++
	
var cx1 = camera_get_view_x(view_camera[0]);
var cx2 = camera_get_view_x(view_camera[0]) + SCREENW + 128;
	
var x1 = 512; var x2 = instance_exists(oFlag)? oFlag.x-32 : room_height-64;
var y1 = 0; var y2 = 16; 
var enemy = choose(oBuzzy, oGoomba, oHammerbro, oLakitu, oNokonoko, oNokonoko_red, oSpiny, oFakeBowser, oMush, oFireflower, oStar);
//var enemy = oLakitu;
	
var xx = choose(irandom_range(cx1, cx2), irandom_range(x1, x2));
var yy = enemy == oLakitu? irandom_range(48,128) : irandom_range(y1, y2);
	
if spawnEny > 250
{
	instance_create_layer(xx,yy,"Instances",enemy)
	spawnEny = 0;
}