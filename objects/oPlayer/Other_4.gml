event_inherited();

if global.partner_active {
	x_togo = x+16*-image_xscale
	follow_max = 60;
	follow_coords = [];
	array_push(follow_coords, {x: x, x_togo : x+16*-image_xscale, y: y, depth: depth, state: state, hspd: hspd, vspd: vspd, image_xscale: sign(image_xscale)});

	instance_create_depth(x-16, y, depth + 2, oPartner, { follow_delay: 20 });
	instance_create_depth(x,y,depth+1,oBlow)
}