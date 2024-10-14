hspd = random_range(1, 4)
savedhspd = hspd;
vspd = 0

grounded = true

state = ps.normal
dietimer = 0

starman = 0;
pepdancin = 0;
holdjump = 0;
shoulderbash = 0;
spintimer = 0;
spin = false;
combo = 0;

char = global.idlist[| irandom_range(0,ds_list_size(global.idlist)-1)]
if char == "Max Verstappen" 
{hspd = 10;}

index = 0

scale = 1;

if char = "Peter Griffin" {scale = 0.2;}
if char = "Duke" {scale = 0.2;}
if char = "Pokey" {scale = 0.2;}
if char = "Max Verstappen" {scale = 0.2;}
if char = "Peppino" {scale = 0.6;}
if char = "Anton" {scale = 0.6}
if char = "1pixelMario" {scale = 0.5}

big = choose(true, false)
if !big {
	mask_index = sMariomask0
	jump = ms("sMario_s_jump", char)
	walk = ms("sMario_s_walk", char)
} else {
	mask_index = sMariomask1
	jump = ms("sMario_b_jump", char)
	walk = ms("sMario_b_walk", char)
}