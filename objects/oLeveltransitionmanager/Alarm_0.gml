
global.time = timeunits(400)

if oGame.extra {room_goto(rmExtra)} 
else {room_goto(asset_get_index("rm"+string(global.world)+"_"+string(global.level)))}


