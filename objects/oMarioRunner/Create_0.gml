hspd = irandom_range(1, 4)
vspd = 0

grounded = true
jumpTimer = irandom_range(40, 350)

dead = false
dietimer = 0

char = global.idlist[| irandom_range(0,ds_list_size(global.idlist)-1)]
if char == "Max Verstappen" {hspd = 6;}

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