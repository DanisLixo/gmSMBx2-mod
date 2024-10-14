function explode(switchchar = true)
{
	if instance_exists(oPlayer) {
		var curgp = global.player
		var bd = instance_create_depth(oPlayer.x,oPlayer.y,oPlayer.depth+1,oMariodead)
		bd.direction = irandom(360)
		bd.hspd = choose(1,-1)*irandom(5)
		bd.spr = ms("sMario_s_die", curgp)
		bd.m = oPlayer;
		bd.palind = bd.m.palindex
		
		var ins = instance_create_depth(oPlayer.bbox_left+2,oPlayer.bbox_top,oPlayer.depth-99999,oBLAST)
		ins.image_xscale = 0.2
		ins.image_yscale = 0.2
		ins.x -= (sprite_width*0.2)/2
		ins.y -= (sprite_height*0.2)/2
		
		if instance_exists(oClient) 
		{
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.explosion);
			buffer_write(buff, buffer_u16, global.clientid);
			buffer_write(buff, buffer_string, global.player);
			buffer_write(buff, buffer_s8, room);
			buffer_write(buff, buffer_s16, oPlayer.x);
			buffer_write(buff, buffer_s16, oPlayer.y);
			buffer_write(buff, buffer_s8, global.paletteindex);
			buffer_write(buff, buffer_s8, global.palettesprite);
			buffer_write(buff, buffer_s16, oPlayer.bbox_left+2);
			buffer_write(buff, buffer_s16, oPlayer.bbox_top);
			network_send_packet(oClient.client, buff, buffer_tell(buff));
			buffer_delete(buff);
		}
						
		oPlayer.y = -300
		oPlayer.state = ps.exploded
	}
	if instance_exists(oLuigi) {
		var curgp = global.playertwo
		var bd = instance_create_depth(oLuigi.x,oLuigi.y,oLuigi.depth+1,oMariodead)
		bd.direction = irandom(360)
		bd.hspd = choose(1,-1)*irandom(5)
		bd.spr = ms("sMario_s_die", curgp)
		bd.m = oLuigi;
		bd.mario_spr = curgp;
		
		var ins = instance_create_depth(oLuigi.bbox_left+2,oLuigi.bbox_top,oLuigi.depth-99999,oBLAST)
		ins.image_xscale = 0.2
		ins.image_yscale = 0.2
		ins.x -= (sprite_width*0.2)/2
		ins.y -= (sprite_height*0.2)/2
						
		oLuigi.y = -300
		oLuigi.state = ps.exploded
	}
	if switchchar {
		var randchar = irandom_range(0,ds_list_size(global.charlist)-1);
		global.player = global.idlist[| randchar]
		global.playerName = global.charlist[| randchar]
		
		update_playerpalette()
		update_playerpalette(true)
		
		if instance_exists(oLuigi) {
			randchar = irandom_range(0,ds_list_size(global.charlist)-1);
			global.playertwo = global.idlist[| randchar]
			global.playertwoName = global.charlist[| randchar]
		}
	}
}