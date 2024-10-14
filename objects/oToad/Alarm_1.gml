if moving = false {if modernmode = false	{var t = instance_create_depth(bopiix,bopiiy,depth,oText); t.center = false;}
else	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,bopiiy,depth,oText);}
t.text = "BUT OUR PRINCESS IS IN"}
if global.player = "Dawn" {t.text = "BUT AKI MAYBE IS IN";}
if global.world = 1 and global.player = "Max Verstappen" 
{t.text = "VAS CHAMPIONSHIP – MINI JUNIOR 1ST/n DUTCH N.A.B. CHAMPIONSHIP – MINI JUNIOR 16TH/nLIMBURGS KART CHAMPIONSHIP – MINI JUNIOR 2ND/n2006 	VAS CHAMPIONSHIP – MINI JUNIOR 1ST/n2007 	CHRONO DUTCH ROTAX MAX CHALLENGE – MINI MAX 35TH/nDUTCH CHAMPIONSHIP – ROTAX MINI MAX 1ST/nROTAX MAX CHALLENGE BELGIUM – MINI MAX 	JOS VERSTAPPEN 1ST/n2008 	VAS CHAMPIONSHIP – MINI NC/nBELGIAN CHAMPIONSHIP – CADET 	JOS VERSTAPPEN 1ST/nROTAX MAX CHALLENGE BELGIUM – MINI MAX 	1ST/nBNL KARTING SERIES – MINI MAX 	VERSTAPPEN RACING 	1ST/n2009 	ROTAX MAX CHALLENGE BELGIUM – MINI MAX 		1ST/nBELGIAN CHAMPIONSHIP – KF5 	PEX RACING TEAM 	1ST/nBNL KARTING SERIES – MINI MAX 	1ST";}
else {
	if moving = false {if modernmode = false	{var t = instance_create_depth(acx,acy,depth,oText); t.center = false;}
	else	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,acy,depth,oText);}
	t.text = "ANOTHER CASTLE!"}
}


alarm[2] = interval*4

