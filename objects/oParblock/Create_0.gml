blockstate = 0;

enum conts
{
	empty,
	coin,
	multicoin,
	powerup,
	star,
	life,
	beanstalk
}
contents = conts.empty;
savedcont = conts.empty;

willbe1up = irandom_range(0,100)

blocksprite = sprite_index
hitblockimage = 0
emptyblockimage = 0;

depth = 99

multicointimer = room_speed*4
multicoinstart = false;

triggerbreak = false;

g = 1;
gspd = 1;
moving = false