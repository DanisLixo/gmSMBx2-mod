x += hspd
y += vspd
image_xscale = face

if mario_freeze() != 1
{
	if emerge = true
	{
		if row  = -1 {vspd = -2.5; row = 0}
		vspd += 0.05;
		if vspd = 0 {
			hspd = 1.5*face;
			vspd = 1;
			row = 50;
			emerge = false;
			}
		depth = 399;
	}
	else
	{
		if row = 0 {
			face = -face;
			hspd = 1.5*face;
			vspd = 1;
			row = 50;
		}
		row--
		if -hspd > 0 || hspd > 0 {hspd += 0.02*-face}
		if vspd > -0.1 {vspd -= 0.034}
		
		depth = 0;
	}
	if instance_place(x,y,oMario)
		{
			points(1000,true);
			pufunc();
		}
}
else if mario_freeze() {exit;}