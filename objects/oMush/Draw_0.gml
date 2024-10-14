if !onview()
{exit;}

switch(global.game) {
	case gm.SMB:
		sprite_index = sMushroom;
	break;
	case gm.LL:
		sprite_index = sMushroom_LL;
	break;
	case gm.ANN:
		sprite_index = sMushroom_LL;
	break;
}

if instance_nearest(x,y,oMario).char = "Max Verstappen" {sprite_index = sBadbull}
draw_self()