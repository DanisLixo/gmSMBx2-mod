var yoff = (m.state = ps.crouch)? 0 : 8;
x = (m.image_xscale)? m.bbox_left+2 : m.bbox_right-2;
y = m.bbox_top
depth = m.depth
image_alpha = m.image_alpha

shader_set(shdColorswap);
	apply_palette(global.palettesprite,m.palindex,image_alpha)
	if !m.spintimer > 0 and m.state != ps.fly and m.state != ps.shrink {draw_sprite_ext(spr,ind,x,y+yoff,m.image_xscale,1,0,c_white,1)}
shader_reset()

if m.vspd <= -0.5 and !m.grounded {spr = cs("sCape_idle") ind = 0}
else if m.vspd >= -0.5 and !m.grounded and m.state != ps.flagpoledescend {
	spr = cs("sCape_fallstart"); 
	if ind > 2.6 {spr = cs("sCape_fall");}
	ind += 0.2;
	}
else if m.state = ps.crouch {
	spr = cs("sCape_crouchstart");
	if ind > 2.6 {spr = cs("sCape_idle");}
	ind += 0.2}
else if m.state = ps.normal and m.pmach > 6 {spr = cs("sCape_walk"); ind = m.ind}
 else {spr = cs(); ind = m.ind}