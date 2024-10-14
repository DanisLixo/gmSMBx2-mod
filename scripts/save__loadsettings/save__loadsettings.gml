function savesettings()
{
	var sav = "gmsmbsave.ini"
	
	ini_open(sav);
	
	var charid = global.player
	var charname = global.playerName
	var charpalette = global.palettesprite
	var charpaletteindex = global.paletteindex
	var gunskin = global.gunskin
	
	var charidp2 = global.playertwo
	var charnamep2 = global.playertwoName
	var charpalettep2 = global.p2_palettesprite
	var charpaletteindexp2 = global.p2_paletteindex
	
	var username = global.username
	var serverip = global.ip
	var serverport = global.port
	
	var sfxvolume = global.volsfx
	var bgmvolume = global.volbgm
	var classicaudio = global.musicchannels
	var tehStyle = global.opacandastar	
	
	var showfps = global.showfps
	var showdiscordpfp = global.showpfp
	var resolution = global.aspectratio
	var finisheddemo = global.demo
	var onlinealpha = global.onlinealpha
	var letterbox = global.letterboxSelected
	var letterboxdark = global.letterboxDark
	var hardmode = global.hardmode
	var warpzone = global.warpzone
	var titlescreen = global.titleroom_selected

	var ku = global.keyu;
	var kd = global.keyd;
	var kl = global.keyl;
	var kr = global.keyr;
	var ka = global.keya;
	var kj = global.keyj;
	var kh = global.keyh;
	
	var ku2 = global.p2_keyu;
	var kd2 = global.p2_keyd;
	var kl2 = global.p2_keyl;
	var kr2 = global.p2_keyr;
	var ka2 = global.p2_keya;
	var kj2 = global.p2_keyj;
	var kh2 = global.p2_keyh;
	
	var enys = global.moveenys
	var moveobjs = global.moveobjs
	var statis = global.movestatics
	
	var ch0 = global.ch_allowed[0]
	var ch1 = global.ch_allowed[1]
	var ch2 = global.ch_allowed[2]
	var ch3 = global.ch_allowed[3]
	
	var abilities = global.abilities
	
	var secCHAR = "character/costume"
	ini_write_string(secCHAR,"charid",charid);
	ini_write_string(secCHAR,"charname",charname);
	ini_write_real(secCHAR,"charpalette",charpalette);
	ini_write_real(secCHAR,"charpaletteindex",charpaletteindex);
	ini_write_string(secCHAR,"gunskin",gunskin);
	
	ini_write_string(secCHAR,"p2charid",charidp2);
	ini_write_string(secCHAR,"p2charname",charnamep2);
	ini_write_real(secCHAR,"p2charpalette",charpalettep2);
	ini_write_real(secCHAR,"p2charpaletteindex",charpaletteindexp2);
	
	var secONLINE = "online"
	ini_write_string(secONLINE,"username",username);
	ini_write_string(secONLINE,"serverip",serverip);
	ini_write_real(secONLINE,"serverport",serverport);
	ini_write_real(secONLINE,"online players alpha",onlinealpha);
	
	var secAUDIO = "audio"
	ini_write_real(secAUDIO,"sfxvolume",sfxvolume);
	ini_write_real(secAUDIO,"bgmvolume",bgmvolume);
	ini_write_real(secAUDIO,"classicaudio",classicaudio);
	ini_write_real(secAUDIO,"opacandastar",tehStyle);
	
	var secETC = "etc"
	ini_write_real(secETC,"showdiscordpfp",showdiscordpfp);
	ini_write_real(secETC,"showfps",showfps);
	ini_write_string(secETC,"resolution",resolution);
	ini_write_real(secETC,"finished demo",finisheddemo);
	ini_write_real(secETC,"letterbox",letterbox);
	ini_write_real(secETC,"letterboxdark",letterboxdark);
	ini_write_real(secETC,"hardmode",hardmode);
	ini_write_real(secETC,"warpzone",warpzone);
	ini_write_real(secETC,"titlescreen",titlescreen);
	
	var secCTRL = "controls"
	ini_write_real(secCTRL,"ku",ku)
	ini_write_real(secCTRL,"kd",kd)
	ini_write_real(secCTRL,"kl",kl)
	ini_write_real(secCTRL,"kr",kr)
	ini_write_real(secCTRL,"ka",ka)
	ini_write_real(secCTRL,"kj",kj)
	ini_write_real(secCTRL,"kh",kh)
	
	ini_write_real(secCTRL,"ku2",ku2)
	ini_write_real(secCTRL,"kd2",kd2)
	ini_write_real(secCTRL,"kl2",kl2)
	ini_write_real(secCTRL,"kr2",kr2)
	ini_write_real(secCTRL,"ka2",ka2)
	ini_write_real(secCTRL,"kj2",kj2)
	ini_write_real(secCTRL,"kh2",kh2)
	
	var secMOD = "mod"
	ini_write_real(secMOD,"commandenemies",enys);
	ini_write_real(secMOD,"commandobjs",moveobjs);
	ini_write_real(secMOD,"commandstatics",statis);
	
	ini_write_real(secMOD,"playchannel0",ch0);
	ini_write_real(secMOD,"playchannel1",ch1);
	ini_write_real(secMOD,"playchannel2",ch2);
	ini_write_real(secMOD,"playchannel3",ch3);
	
	ini_write_real(secMOD,"abilities",abilities);
	
	ini_close();
}

function loadsettings()
{
	var sav = "gmsmbsave.ini"
	
	if file_exists(sav)
	{
		ini_open(sav);
	
		var secCHAR = "character/costume"
		var secONLINE = "online"
		var secAUDIO = "audio"
		var secETC = "etc"
		var secCTRL = "controls"
		var secMOD = "mod"
		
		var charid = ini_read_string(secCHAR,"charid","Mario");
		var charname = ini_read_string(secCHAR,"charname","Mario");
		var charpalette = ini_read_real(secCHAR,"charpalette",sPalette_mario);
		var charpaletteindex = ini_read_real(secCHAR,"charpaletteindex",1);
		var gunskin = ini_read_string(secCHAR,"gunskin","Default");
		
		var charidp2 = ini_read_string(secCHAR,"p2charid","Luigi");
		var charnamep2 = ini_read_string(secCHAR,"p2charname","Luigi");
		var charpalettep2 = ini_read_real(secCHAR,"p2charpalette",sPalette_luigi);
		var charpaletteindexp2 = ini_read_real(secCHAR,"p2charpaletteindex",1);
	
		var username = ini_read_string(secONLINE,"username",string(random_range(0,10000)));
		var serverip = ini_read_string(secONLINE,"serverip","123.456.89-0");
		var serverport = ini_read_real(secONLINE,"serverport",7676);
		var onlinealpha = ini_read_real(secONLINE,"online players alpha",0.8);
		
		var sfxvolume = ini_read_real(secAUDIO,"sfxvolume",1);
		var bgmvolume = ini_read_real(secAUDIO,"bgmvolume",1);
		var classicaudio = ini_read_real(secAUDIO,"classicaudio",1);
		var tehStyle = ini_read_real(secAUDIO,"opacandastar",1);
		
		var showdiscordpfp = ini_read_real(secETC,"showdiscordpfp",0);
		var showfps = ini_read_real(secETC,"showfps",1);
		var resolution = ini_read_string(secETC,"resolution","WIDESCREEN");
		var finisheddemo = ini_read_real(secETC,"finished demo",0);
		var letterbox = ini_read_real(secETC,"letterbox",0);
		var letterboxdark = ini_read_real(secETC,"letterboxdark",0);
		var hardmode = ini_read_real(secETC,"hardmode",0);
		var warpzone = ini_read_real(secETC,"warpzone",0);
		var titlescreen = ini_read_real(secETC,"titlescreen",0);
		
		var ku = ini_read_real(secCTRL,"ku",global.keyu)
		var kd = ini_read_real(secCTRL,"kd",global.keyd)
		var kl = ini_read_real(secCTRL,"kl",global.keyl)
		var kr = ini_read_real(secCTRL,"kr",global.keyr)
		var ka = ini_read_real(secCTRL,"ka",global.keya)
		var kj = ini_read_real(secCTRL,"kj",global.keyj)
		var kh = ini_read_real(secCTRL,"kh",global.keyh)
		
		var ku2 = ini_read_real(secCTRL,"ku2",global.p2_keyu)
		var kd2 = ini_read_real(secCTRL,"kd2",global.p2_keyd)
		var kl2 = ini_read_real(secCTRL,"kl2",global.p2_keyl)
		var kr2 = ini_read_real(secCTRL,"kr2",global.p2_keyr)
		var ka2 = ini_read_real(secCTRL,"ka2",global.p2_keya)
		var kj2 = ini_read_real(secCTRL,"kj2",global.p2_keyj)
		var kh2 = ini_read_real(secCTRL,"kh2",global.p2_keyh)
		
		var enys = ini_read_real(secMOD,"commandenemies",1);
		var moveobjs = ini_read_real(secMOD,"commandobjs",1);
		var statis = ini_read_real(secMOD,"commandstatics",0);
		
		var ch0 = ini_read_real(secMOD,"playchannel0",1);
		var ch1 = ini_read_real(secMOD,"playchannel1",1);
		var ch2 = ini_read_real(secMOD,"playchannel2",1);
		var ch3 = ini_read_real(secMOD,"playchannel3",1);
		
		var abilities = ini_read_real(secMOD,"abilities",1);
		
		global.player = charid;
		global.playerName = charname;
		global.palettesprite = charpalette
		global.paletteindex = charpaletteindex
		global.gunskin = gunskin
		
		global.playertwo = charidp2;
		global.playertwoName = charnamep2;
		global.p2_palettesprite = charpalettep2;
		global.p2_paletteindex = charpaletteindexp2;
		
		global.username = username;
		global.ip = serverip;
		global.port = serverport;
		global.onlinealpha = onlinealpha;
		
		global.volsfx = sfxvolume
		global.volbgm = bgmvolume
		global.musicchannels = classicaudio
		global.opacandastar = tehStyle
		
		global.showpfp = showdiscordpfp
		global.showfps = showfps
		global.aspectratio = resolution
		global.demo = finisheddemo
		global.letterboxSelected = letterbox
		global.letterboxDark = letterboxdark
		global.hardmode = hardmode
		global.warpzone = warpzone
		global.titleroom_selected = titlescreen
		
		global.keyu = ku
		global.keyd = kd
		global.keyl = kl
		global.keyr = kr
		global.keya = ka
		global.keyj = kj
		global.keyh = kh
		
		global.p2_keyu = ku2
		global.p2_keyd = kd2
		global.p2_keyl = kl2
		global.p2_keyr = kr2
		global.p2_keya = ka2
		global.p2_keyj = kj2
		global.p2_keyh = kh2
		
		global.moveenys = enys
		global.moveobjs = moveobjs
		global.movestatics = statis
		
		global.ch_allowed[0] = ch0
		global.ch_allowed[1] = ch1
		global.ch_allowed[2] = ch2
		global.ch_allowed[3] = ch3
		
		global.abilities = abilities
	
		ini_close();
	}
}