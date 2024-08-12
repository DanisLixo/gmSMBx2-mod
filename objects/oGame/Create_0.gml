instance_create_depth(x,y,depth,oNekoPresence)
init()
loadsettings()

dep = depth;

savedpowerup = "s";
p2savedpowerup = "s";

global.hats = 0
global.p2_hats = 0

lastenv = e.underground
loadscreen = 20;
warned = false;

diec = 0;

fireworks = 0;
triggercastleflag = false;

global.curbgm = "OW"

global.retros = 0

global.prevroom = room;

//alarm[0] = 3

timeup = 0;

chars = ds_list_create();

//Characters
ds_list_add(chars,"Mario")
ds_list_add(chars,"Luigi")
ds_list_add(chars,"Toad")
ds_list_add(chars,"Wario")
ds_list_add(chars,"Goomba")
ds_list_add(chars,"Sonic")
ds_list_add(chars,"Syobon")
//OCs
ds_list_add(chars,"Bredi")
ds_list_add(chars,"Goober")
ds_list_add(chars,"Iris")
ds_list_add(chars,"Owen")
ds_list_add(chars,"Seven")
ds_list_add(chars,"SucculentKicker")
ds_list_add(chars,"Goldron")
ds_list_add(chars,"Dawn")
ds_list_add(chars,"Feathy")
//LQ jokes
ds_list_add(chars,"Anton")
ds_list_add(chars,"Peter Griffin")
ds_list_add(chars,"Duke")
ds_list_add(chars,"Pokey")
ds_list_add(chars,"1pixelmario")
ds_list_add(chars,"Max_Verstappen")
//HQ jokes
ds_list_add(chars,"Martin")
ds_list_add(chars,"Peter")
ds_list_add(chars,"Gemaplys")

paused = 0

debugsel = 0;
debug = false;

destroy = 0
delay = 0

spawnx = -1;
spawny = -1;
pitch = 1