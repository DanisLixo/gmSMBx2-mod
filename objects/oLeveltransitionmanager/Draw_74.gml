

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);


draw_set_font(FNT)

var p = sMario_s_idle
if sprite_exists(ms("sMario_s_idle")) && oGame.savedpowerup = "s"
{p = ms("sMario_s_idle");}
else if sprite_exists(ms("sMario_b_idle")) && oGame.savedpowerup = "b"
{p = ms("sMario_b_idle");}
else if sprite_exists(ms("sMario_b_idle")) && oGame.savedpowerup = "f"
{p = ms("sMario_b_idle");}
	
var scale = 1;
if p = sPeterGriffin {scale = 0.5;}
if p = sDuke {scale = 0.5;}
if p = sPokey {scale = 0.4;}
if p = sMaxVerstappen {scale = 0.2;}
if p = sPokey && oGame.savedpowerup = "s" {scale = 0.2;}
if p = sAnton && oGame.savedpowerup = "s" {scale = 0.6;}

shader_set(shdColorswap)
	apply_palette(global.palettesprite,global.paletteindex,1)
	draw_sprite_ext(p,0,(13*8)-cx,(15*8)-cy,scale,scale,0,-1,1)
shader_reset();


if oGame.extra {draw_text(11*8-cx,9*8-cy,"WORLD "+"EXTRA");}
else {draw_text(11*8-cx,9*8-cy,"WORLD "+string(global.world)+"-"+string(global.level));}
draw_text((15*8)-cx,(14*8)-cy,"* -1");
if oGame.savedpowerup = "f" && global.player != "Pokey" {draw_text((10*8)-cx,(10*8)-cy,"U FIRE YEAH")}
if global.player = "Pokey" {draw_text((8*8)-cx,(10*8)-cy,"O MAIOR COMEDOR DE CASADAS")}
draw_set_font(FNT)



