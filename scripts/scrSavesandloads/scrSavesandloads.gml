function savesettings()
{
	var sav = "gmsmbsave.ini"
	
	if file_exists(sav) {file_delete(sav);}
	ini_open(sav);
	
	var charname = global.player
	var charpalette = global.palettesprite
	var charpaletteindex = global.paletteindex
	var gunskin = global.gunskin
	
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
	
	var ku = global.keyu;
	var kd = global.keyd;
	var kl = global.keyl;
	var kr = global.keyr;
	var ka = global.keya;
	var kj = global.keyj;
	var kh = global.keyh;
	
	var enys = global.moveenys
	var moveobjs = global.moveobjs
	var statis = global.movestatics
	
	var secCHAR = "character/costume"
	ini_write_string(secCHAR,"charname",charname);
	ini_write_real(secCHAR,"charpalette",charpalette);
	ini_write_real(secCHAR,"charpaletteindex",charpaletteindex);
	ini_write_string(secCHAR,"gunskin",gunskin);
	
	var secONLINE = "online"
	ini_write_string(secONLINE,"username",username);
	ini_write_string(secONLINE,"serverip",serverip);
	ini_write_real(secONLINE,"serverport",serverport);
	
	var secAUDIO = "audio"
	ini_write_real(secAUDIO,"sfxvolume",sfxvolume);
	ini_write_real(secAUDIO,"bgmvolume",bgmvolume);
	ini_write_real(secAUDIO,"classicaudio",classicaudio);
	ini_write_real(secAUDIO,"opacandastar",tehStyle);
	
	var secETC = "etc"
	ini_write_real(secETC,"showdiscordpfp",showdiscordpfp);
	ini_write_real(secETC,"showfps",showfps);
	ini_write_string(secETC,"resolution",resolution);
	
	var secCTRL = "controls"
	ini_write_real(secCTRL,"ku",ku)
	ini_write_real(secCTRL,"kd",kd)
	ini_write_real(secCTRL,"kl",kl)
	ini_write_real(secCTRL,"kr",kr)
	ini_write_real(secCTRL,"ka",ka)
	ini_write_real(secCTRL,"kj",kj)
	ini_write_real(secCTRL,"kh",kh)
	
	var secMOD = "mod"
	ini_write_real(secMOD,"commandenemies",enys);
	ini_write_real(secMOD,"commandobjs",moveobjs);
	ini_write_real(secMOD,"commandstatics",statis);
	
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
		
		var charname = ini_read_string(secCHAR,"charname","Mario");
		var charpalette = ini_read_real(secCHAR,"charpalette",0);
		var charpaletteindex = ini_read_real(secCHAR,"charpaletteindex",0);
		var gunskin = ini_read_string(secCHAR,"gunskin","Default");

		
		var username = ini_read_string(secONLINE,"username",string(random_range(0,10000)));
		var serverip = ini_read_string(secONLINE,"serverip","123.456.89-0");
		var serverport = ini_read_real(secONLINE,"serverport",7676);
		
		var sfxvolume = ini_read_real(secAUDIO,"sfxvolume",1);
		var bgmvolume = ini_read_real(secAUDIO,"bgmvolume",1);
		var classicaudio = ini_read_real(secAUDIO,"classicaudio",1);
		var tehStyle = ini_read_real(secAUDIO,"opacandastar",1);
		
		var showdiscordpfp = ini_read_real(secETC,"showdiscordpfp",0);
		var showfps = ini_read_real(secETC,"showfps",1);
		var resolution = ini_read_string(secETC,"resolution","WIDESCREEN");
		
		var ku = ini_read_real(secCTRL,"ku",global.keyu)
		var kd = ini_read_real(secCTRL,"kd",global.keyd)
		var kl = ini_read_real(secCTRL,"kl",global.keyl)
		var kr = ini_read_real(secCTRL,"kr",global.keyr)
		var ka = ini_read_real(secCTRL,"ka",global.keya)
		var kj = ini_read_real(secCTRL,"kj",global.keyj)
		var kh = ini_read_real(secCTRL,"kh",global.keyh)
		
		var enys = ini_read_real(secMOD,"commandenemies",1);
		var moveobjs = ini_read_real(secMOD,"commandobjs",1);
		var statis = ini_read_real(secMOD,"commandstatics",0);
		
		global.player = charname;
		global.palettesprite = charpalette
		global.paletteindex = charpaletteindex
		global.gunskin = gunskin
		
		global.username = username;
		global.ip = serverip;
		global.port = serverport;
		
		global.volsfx = sfxvolume
		global.volbgm = bgmvolume
		global.musicchannels = classicaudio
		global.opacandastar = tehStyle
		
		global.showpfp = showdiscordpfp
		global.showfps = showfps
		global.aspectratio = resolution
		
		global.keyu = ku
		global.keyd = kd
		global.keyl = kl
		global.keyr = kr
		global.keya = ka
		global.keyj = kj
		global.keyh = kh
		
		global.moveenys = enys
		global.moveobjs = moveobjs
		global.movestatics = statis

	
		ini_close();
	}
}