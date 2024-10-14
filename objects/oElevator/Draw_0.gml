if !onview()
{exit;}

if isskylift = false {
	switch(global.game) {
		case gm.SMB:
			sprite_index = sPlatform;
		break;
		case gm.LL:
			sprite_index = sPlatform_LL;
		break;
		case gm.ANN:
			sprite_index = sPlatform_LL;
		break;
	}
}
if layer_exists("Tiles_secret") {sprite_index = sPlatform_s3}

draw_self();