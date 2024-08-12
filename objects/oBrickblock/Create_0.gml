event_inherited();

contents = conts.empty;

blocksprite = sprite_index
hitblockimage = 0;
emptyblockimage = 0;

vspd = 0
falling = false;

fallchance = irandom(100)

arenarespawn = 0;
if instance_exists(oIsArena)
{var starchance = irandom_range(0,16);
	if starchance = 0 {contents = conts.star;}
	else			  {contents = conts.multicoin;}
}
