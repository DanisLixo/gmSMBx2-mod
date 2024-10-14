//👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍

if powerup = "f"
{
	if global.paletteindex = 2 {palindex = 1;}
	else {palindex = 2;}
}
else
{palindex = global.paletteindex;}

//if char = "1pixelmario" and powerup = "f" {spr = ms("sMario_{}_idle");}
//(image_xscale*csw/cswdiv)-(2*image_xscale)
shader_set(shdColorswap);
//apply_pattern(sprite_index, image_index, image_xscale, image_yscale,sTilepaltest)
apply_palette(global.palettesprite,palindex,image_alpha)

#region fire sprite check

var spritestring = "sMario_{}_fire";
var pu = powerup;
if (pu = "f" || pu = "c")
{pu = "b";}
spritestring = string_replace(spritestring,"Mario",char);
spritestring = string_replace(spritestring,"{}",pu)

#endregion

event_user(0);
		
if firetimer > 0 
//&& char != "Peter Griffin" && char != "Duke" && char != "Pokey" && char != "1pixelmario" && char != "Max Verstappen" 
&& (sprite_exists(asset_get_index(spritestring)) || ds_map_find_value(global.moddedSprites, spritestring) != undefined) && (char != "Sonic" or char = "Sonic" and state != ps.jump)
	{
		{
			firedraw = true;
			
			var fs = ms("sMario_{}_fire")
			var fsw = sprite_get_width(fs); var fsh = sprite_get_height(fs);
			draw_sprite_part_ext(fs,ind,0,0,fsw,fsh-8,x-(image_xscale*fsw/2),y-fsh+yoff,
			(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
		
			var ccs = spr
			if spr = ms("sMario_{}_idle")
			{ccs = ms("sMario_{}_fire");}
			var csw = sprite_get_width(ccs); var csh = sprite_get_height(ccs); var cswsub = csw > 16? csw/16 : 0;
			draw_sprite_part_ext(ccs,ind,0,csh-9,csw,9,x-(image_xscale*csw/2)+cswsub,y-8+yoff,
			(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
		}
	}
else /*if char != "Sonic" or (char = "Sonic")*/ {firedraw = false; draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,image_alpha);}
shader_reset()

event_inherited();

if pmach < 5 
{global.pind = pmach}
else 
{
	if pmet mod 10 < 5 {global.pind = 6}
	else {global.pind = 7}
}

if instance_exists(oClient)
{
	draw_set_alpha(0.6);
	draw_set_font(fntComic)
	draw_set_halign(fa_center);
	draw_text(x,bbox_top-16,global.username)
	draw_set_halign(fa_left);
	draw_set_font(-1);
	draw_set_alpha(1);
}

if instance_exists(oIsArena)
{
	draw_set_color(c_yellow);
	draw_set_font(global.fnt)
	draw_sprite_ext(sSuperstaricon,0,x-16,bbox_bottom,1,1,0,c_yellow,1);
	draw_text(x+8,bbox_bottom+6,global.stars);
	draw_set_font(-1);
	draw_set_color(-1);
	
	
	if instance_place(x,y,oSuperstar)
	{global.stars ++; instance_destroy(instance_place(x,y,oSuperstar))}
}