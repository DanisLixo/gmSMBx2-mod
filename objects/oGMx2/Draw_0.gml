if section == 0 {
	draw_sprite_ext(sUpsky,0,0,0,SCREENW,1,0,-1,1)

	bgx+=0.2
	draw_sprite_tiled(sClouds,0,bgx,0)

	mntsx+=0.075
	draw_sprite_tiled(sMountains,0,mntsx,0)
}

image_index = oGame.image_index
