var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);


draw_set_font(FNT)

var p = sMario_s_idle
if sprite_exists(ms("sMario_s_idle")) && oGame.savedpowerup = "s"
{p = ms("sMario_s_idle");}
else if sprite_exists(ms("sMario_b_idle")) && oGame.savedpowerup = "b" || oGame.savedpowerup = "f" || oGame.savedpowerup = "c"
{p = ms("sMario_b_idle");}

var scale = 1;
if p = sPeterGriffin {scale = 0.5;}
if p = sDuke {scale = 0.5;}
if p = sPokey {scale = 0.4;}
if p = sMax_Verstappen_s_idle {scale = 0.2;}
if p = sMax_Verstappen_b_idle {scale = 0.2;}
if p = sPokey && oGame.savedpowerup = "s" {scale = 0.2;}
if p = sAnton && oGame.savedpowerup = "s" {scale = 0.6;}

var fire = (oGame.savedpowerup = "f")? 2 : global.paletteindex

shader_set(shdColorswap)
	apply_palette(global.palettesprite,fire,image_alpha)
	draw_sprite_ext(p,0,(13*8)-cx,(15*8)-cy,scale,scale,0,-1,1)
shader_reset();

if global.multiplayer {
var p2 = sLuigi_s_idle
if sprite_exists(ls("sMario_s_idle")) && oGame.p2savedpowerup = "s"
{p2 = ls("sMario_s_idle");}
else if sprite_exists(ls("sMario_b_idle")) && oGame.p2savedpowerup = "b" || oGame.p2savedpowerup = "f" || oGame.p2savedpowerup = "c"
{p2 = ls("sMario_b_idle");}

var scalep2 = 1;
if p2 = sPeterGriffin {scalep2 = 0.5;}
if p2 = sDuke {scalep2 = 0.5;}
if p2 = sPokey {scalep2 = 0.4;}
if p2 = sMax_Verstappen_s_idle {scalep2 = 0.2;}
if p2 = sMax_Verstappen_b_idle {scalep2 = 0.2;}
if p2 = sPokey && oGame.savedpowerup = "s" {scalep2 = 0.2;}
if p2 = sAnton && oGame.savedpowerup = "s" {scalep2 = 0.6;}

var fire = (oGame.p2savedpowerup = "f")? 2 : global.paletteindex

shader_set(shdColorswap)
	apply_palette(palp2,fire,image_alpha)
	draw_sprite_ext(p2,0,(13*8)-cx,(19*8)-cy,scalep2,scalep2,0,-1,1)
shader_reset();

draw_text((15*8)-cx,(18*8)-cy,"* -1");
draw_set_font(FNT)
}


if global.extra {draw_text(11*8-cx,9*8-cy,"WORLD "+"EXTRA");}
else {draw_text(11*8-cx,9*8-cy,"WORLD "+string(global.world)+"-"+string(global.level));}
draw_text((15*8)-cx,(14*8)-cy,"* -1");
if oGame.savedpowerup = "f" && global.player != "Pokey" {draw_text((9.5*8)-cx,(10*8)-cy,"U FIRE YEAH!!!")}
else if oGame.savedpowerup = "f" && oGame.p2savedpowerup = "f" && global.player != "Pokey" {draw_text((9.5*8)-cx,(10*8)-cy,"U ALL FIRE YES!!!")}
if oGame.savedpowerup = "c" && global.player != "Pokey" {draw_text((9*8)-cx,(10*8)-cy,"U GOT DA CAPE!!!")}
else if oGame.savedpowerup = "c" && oGame.p2savedpowerup = "c" && global.player != "Pokey" {draw_text((9*8)-cx,(10*8)-cy,"U ALL GOT DA CAPE WHAT!!!")}
if global.player = "Pokey" {draw_text((4*8)-cx,(10*6)-cy,"O MAIOR COMEDOR DE CASADAS")}
draw_set_font(FNT)


