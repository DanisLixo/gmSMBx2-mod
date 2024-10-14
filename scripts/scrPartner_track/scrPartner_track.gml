/// @function partner_track
/// @description Updates movement array for the partner to follow Mario.
function partner_track() 
{
	// Updating the direction accordingly.
	// Your partner will copy your movement until they finally reach your back.
	// They only grab some player's variables so they can know what is going on.
	if instance_exists(oPartner) {
		array_push(follow_coords, {x: x, x_togo: x+16*-image_xscale, y: y, depth: depth, state: state, hspd: hspd, vspd: vspd, image_xscale: sign(image_xscale)});
		if (array_length(follow_coords) > follow_max + 1)
		{array_delete(follow_coords, 0, 1);}
	}
}