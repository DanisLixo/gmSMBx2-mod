hspd = random_range(0.5,2);
facingdir = choose(-1,1)
vspd = 0

isspawn = false
state = es.patrol

timer = 60;

enum z {
	cheep,
	bill, // uses default
	blooper,
	lakitu, // uses default
	green,
	red // uses default
}
enemy = noone

#region blooper

anim = 0;
animtrigger = random_range(6,18);

maxhspd = 1.7;
maxvspd = -2;
vlimit = 0;

stomptype = 3;
bstate = 0;
movement = 0;

allowchange = true;
turnchance = 0;
midturnchance = 0;

#endregion