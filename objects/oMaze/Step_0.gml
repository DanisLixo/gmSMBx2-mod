var m = instance_place(x,y,oMario);

if m and wrongway = true {
	global.wwtrigger = true;
	oLooptel.fd = yfix
	if global.warpsound = false {sfx(sndBump,0); global.warpsound = true;}
}
if m and wrongway = false {
	if global.wwtrigger = true {global.warpsound = false;}
	global.wwtrigger = false;
	if global.warpsound = false {sfx(sndPause,0); global.warpsound = true;}
}