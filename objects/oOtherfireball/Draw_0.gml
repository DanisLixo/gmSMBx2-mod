if !instance_exists(oClient)
{instance_destroy();}

if room != myroom || !onview()
{exit;}

draw_self();