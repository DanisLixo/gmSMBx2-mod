if oGame.spawnx = x and oMario.state != ps.exitpipeup {global.killenys = true;}
if instance_exists(oLakitu) {var cx = camera_get_view_x(view_camera[0]); oLakitu.x = cx+SCREENW+16}