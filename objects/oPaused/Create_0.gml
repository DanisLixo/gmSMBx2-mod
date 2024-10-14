options = [
	"RESUME",
	"OPTIONS",
	"RESTART",
	"QUIT"
]
psel = 0;
pitch = 1;

pitched = false;
settingsmenu = false;

image_yscale = 1;

buttonsappear = 0;

menu_create();

groundX = 0
smallMarioWalkDex = 0
bigMarioWalkDex = 0
marioX = 32
marioY = 206
marioYAdd = 0
marSpr = sMario_s_walk
marSpr2 = sMario_b_walk
marioSpawnTimer = 60

marioxs = 0;
marioys = 0;
gunxs = 0;
gunys = 0;

section = 2;

audio_stop_sound(global.sfx[0]);