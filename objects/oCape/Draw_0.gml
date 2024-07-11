var yoff = (oMario.state = ps.crouch)? 0 : 8;
x = (oMario.image_xscale)? oMario.bbox_left+2 : oMario.bbox_right-2;
y = oMario.bbox_top
depth = oMario.depth
image_alpha = oMario.image_alpha

shader_set(shdColorswap);
	apply_palette(global.palettesprite,oMario.palindex,image_alpha)
	if !oMario.spinnin {draw_sprite_ext(spr,ind,x,y+yoff,oMario.image_xscale,1,0,c_white,1)}
shader_reset()

if oMario.vspd <= -0.5 and !oMario.grounded {spr = cs("sCape_idle") ind = 0}
else if oMario.vspd >= -0.5 and !oMario.grounded and oMario.state != ps.flagpoledescend {
	spr = cs("sCape_fallstart"); 
	if ind > 2.6 {spr = cs("sCape_fall");}
	ind += 0.2;
	}
else if oMario.state = ps.crouch {
	spr = cs("sCape_crouchstart");
	if ind > 2.6 {spr = cs("sCape_idle");}
	ind += 0.2}
else if oMario.state = ps.normal and (oMario.hspd >= 2.4 || oMario.hspd <= -2.4) {spr = cs("sCape_walk"); ind = oMario.ind}
 else {spr = cs(); ind = oMario.ind}