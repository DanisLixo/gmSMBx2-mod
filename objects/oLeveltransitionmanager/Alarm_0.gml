global.time = timeunits(400)

/*if global.world >= 6 and global.level >= 1 /*and not instance_exists(oClient) {
	room_goto(rmDemoend)
}
else {*/
	if room_exists(asset_get_index("rm"+string(global.world)+"_"+string(global.level)))
	{room_goto(asset_get_index("rm"+string(global.world)+"_"+string(global.level)))}
	else {room_goto(rmSecret)}
//}
if global.extra {room_goto(rmExtra)} 
