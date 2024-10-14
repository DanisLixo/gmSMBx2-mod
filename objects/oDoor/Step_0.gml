var rm = asset_get_index("rm"+string(global.world)+"_"+string(global.level))
var arenarm = asset_get_index("rmArena_"+string(global.arena-1))

if instance_place(x,y,oMario) {
	if oMario.kup and oMario.grounded {
		if toLobby {room_goto(rmLobby);}
		else if global.extra {room_goto(rmExtra);}
		else if global.arena != 0 {room_goto(arenarm);}
		else if global.world != 0 || global.level != 0 {room_goto(rm);} 
	}	
}

while instance_place(x,y,oCol) {y -= 1;}
while !instance_place(x,y+1,oCol) {y += 1;}