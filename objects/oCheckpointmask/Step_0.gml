if instance_exists(oMario) && (instance_place(x+40,y,oMario) || oMario.x >= x+40) {oGame.spawnx = x; oGame.spawny = y;}

var eny = collision_rectangle(x-SCREENW/2,0,x+SCREENW/2,room_height,oParenemy,true,false);

if global.killenys and eny {instance_destroy(eny)}