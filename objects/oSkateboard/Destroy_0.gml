var d = instance_create_depth(x-8,y-4,depth-2,oSkateboard_pieces)
d.vspd = -6; d.hspd = -0.5;
var d = instance_create_depth(x+8,y-4,depth-2,oSkateboard_pieces)
d.vspd = -6; d.hspd = 0.5; d.image_xscale = -1

with (m) {
	state = other.counter == 2? ps.jump : ps.jumpcut
	hspd = other.counter == 2? other.hspd*-other.g : other.hspd/2*-other.g;
	vspd -= 4;
	spr = ms("sMario_{}_pivot");
}