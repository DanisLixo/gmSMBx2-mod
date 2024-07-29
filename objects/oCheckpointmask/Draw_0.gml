if instance_exists(oMario) && (oMario.x >= x+40) {oGame.spawnx = x; oGame.spawny = y;}

var eny = collision_rectangle(x-32,0,x+32,room_height,oParenemy,true,false);

if killenys and oGame.spawnx >= x and eny {instance_destroy(eny)}