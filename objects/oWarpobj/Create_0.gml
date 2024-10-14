text = "WELCOME TO THE WARP ZONE!";

if !global.warpzone
{
	text = choose("NO", "NOPE LMAO", "NUH UH", "GET OUTTA HERE", "ROFL OUT", "LOL", "NAH", "I SEE...", "WHAT YOU DOIN HERE ERH?")
	font = global.fnt
	center = true
	
	instance_change(oText, false);
}

activated = false;