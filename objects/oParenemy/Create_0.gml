hspd = 0;
vspd = 0;

maxhspd = 0.5;

grounded = false;
facingdir = -1

stomptype = 0; // -1 = damage // 0 = squish // 1 = shell // 2 = shell but no fire // 3 = stomp // 4 = stomp but no fire
stomptimer = 50;
cheeptype = -1

shellcooldown = 0;

dieface = 1;
flyt_delay = 0;

enum es
{
	patrol,
	stomp,
	shell,
	shellhit,
	die,
	patrolwinged,
	frozen,
	egg
}

state = es.patrol
if !instance_exists(oIsArena)
{state = es.frozen}

given8000 = false
shellcombo = 4
