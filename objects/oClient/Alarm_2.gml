global.time = 0;
global.level += 1;

if instance_exists(oToad)
{global.level = 1; global.world += 1;}

room_goto(rmLeveltransition)