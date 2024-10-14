if instance_exists(oMario) {m = oMario;}
else 
{
	m = [];
	array_push(m, {powerup : "s", scale : 1});
}

vspd += 0.3;

if place_meeting(x+hspd,y,oCol) && round(hspd) > 0
{hspd = -(hspd/2);}
if place_meeting(x,y+vspd,oCol) && round(vspd) > 0
{vspd = -(vspd/2);}

if place_meeting(x,y,oCol)
{hspd = 0; vspd = 0;}

image_angle += hspd*2;

var scale = 1;

if global.scaled = false {
	if mario_spr = "Peter Griffin"	{scale = 0.2;}
	if mario_spr = "Duke"	{scale = 0.2;}
	if mario_spr = "Pokey" {scale = 0.2;}
	if mario_spr = "Max Verstappen" {scale = 0.2;}
	if mario_spr = "Anton" && m.powerup = "s"	{scale = 0.6}
	if mario_spr = "Peppino"	{scale = 0.6}
	if mario_spr = "1pixelMario" && m.powerup = "s"	{scale = 0.5}
} else {scale = m.scale}

image_xscale = scale;
image_yscale = scale;

x += hspd
y += vspd