if char = "Goldron"
{
	if hspd != 0 && grounded
	{yoff = -abs(sin(x/10))*5}
	else
	{yoff = 0;}
	if powerup = "s"	{ind = 0;}
	if powerup = "b"	{ind = 1;}
	if powerup = "f" || powerup = "c"	{ind = 2;}
}

if global.scaled = false {
	scale = 1;

	if char = "Peter Griffin"	{scale = 0.2;}
	if char = "Duke"	{scale = 0.2;}
	if char = "Pokey" {scale = 0.2;}
	if char = "Max Verstappen" {scale = 0.2;}
	if char = "Anton" && powerup = "s"	{scale = 0.6}
	if char = "Peppino"	{scale = 0.6}
	if char = "1pixelMario" && powerup = "s"	{scale = 0.5}
}
