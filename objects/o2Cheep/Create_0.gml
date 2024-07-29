event_inherited()

bar = choose(0,16,24,32)
vlimit = round(y+bar)

facingdir = (oMario.x < x)? -1 : 1;
facingdir = (oMario.hspd < 1)? facingdir : 1;
facingdir = global.environment = e.underwater? -1:facingdir
vspd = 0

cheeptype = choose(0,1)
stomptype = 3;
palspr = sPalette_nokonoko_red
if cheeptype = 1 {stomptype = -1; palspr = sPalette_nokonoko;}

dir = 1;

xs = 1

