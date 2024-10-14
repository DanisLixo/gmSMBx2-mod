var wr = global.world; var lv = global.level;

if room_exists(asset_get_index("rm"+string(wr)+"_"+string(lv)))
{room_goto(asset_get_index("rm"+string(wr)+"_"+string(lv)))}
else {room_goto(rmSecret+string(wr))}
if global.extra {room_goto(rmExtra)} 

setTimer();