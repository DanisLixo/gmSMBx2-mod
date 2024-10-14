if (state != ps.die) {player_collision();}

var cx = camera_get_view_x(view_camera[0])
if x < cx {x = cx+SCREENW}