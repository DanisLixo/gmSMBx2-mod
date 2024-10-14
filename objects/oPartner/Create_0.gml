crouching = false
char = "Aki"
powerup = "s"

sprite_index = ms("sMario_crouch", char);

starman = 0

turning = 120;
x_togo = 0

state = 0;
sprites = [
	ms("sMario_idle", char),
    ms("sMario_walk", char),
	ms("sMario_jump", char),
	ms("sMario_crouchstart", char),
	ms("sMario_climb", char),
	ms("sMario_yippe", char),
	ms("sMario_oof", char)
];
// this variable is to be set via instance_create_* parameters
// adding this here so that Feather recognises it as obj_follower variable
follow_delay = self[$ "follow_delay"];