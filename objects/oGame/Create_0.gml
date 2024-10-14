init()
loadsettings()
if os_type == os_windows {instance_create_depth(x,y,depth,oNekoPresence);}

global.titleroom = global.titlerooms[global.titleroom_selected];
global.letterboxSprite = global.letterboxes[global.letterboxSelected];

dep = depth;

if os_type == os_android {texturegroup_load("phonecontroller");}

savedpowerup = "s";
p2savedpowerup = "s";

global.pind = 0
global.p2_pind = 0

global.hats = 0;

lastenv = e.underground
loadscreen = 20;
warned = false;

diec = 0;

fireworks = 0;
triggercastleflag = false;

global.curbgm = "Title"

global.retros = 0

global.prevroom = -1;

//alarm[0] = 3

timeup = 0;

paused = 0

debugsel = 0;
debug = false;

destroy = 0
delay = 0

spawnx = -1;
spawny = -1;
pitch = 1

found_secret[1] = false;
found_secret[2] = false;
found_secret[3] = false;
found_secret[4] = false;
found_secret[5] = false;
found_secret[6] = false;
found_secret[7] = false;
found_secret[8] = false;