if !isspawn {
	switch(enemy) {
		case z.cheep:
			sprite_index = s2Cheep
		break;
		case z.bill:
			sprite_index = sBill
		break;
		case z.blooper:
			sprite_index = sBlooper
		break;
		case z.lakitu:
			sprite_index = sLakitu
			image_index = 0;
		break;
	}
	draw_sprite_ext(sprite_index,image_index,x,y,facingdir,image_yscale,0,-1,1)
}