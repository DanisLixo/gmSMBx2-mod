if Iended >= players && endcounter == 0
{Iended = 0; endcounter = -1; allfinished = false;}

if global.spectate {oGame.loadscreen = -1}

players = 1

if instance_exists(oOtherplayer) oOtherplayer.countme = false;