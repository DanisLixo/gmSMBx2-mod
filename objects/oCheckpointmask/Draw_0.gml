if instance_exists(oMario) && (oMario.x >= x+40) {oGame.spawnx = x; oGame.spawny = y;}
if oGame.spawnx = x {}

var eny = collision_rectangle(x-32,0,x+32,room_height,oParenemy,true,false);

if instance_nearest(x,y,oParenemy) and oGame.spawnx >= x {instance_destroy(eny)}