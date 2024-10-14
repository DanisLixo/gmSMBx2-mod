//👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍
if powerup = "f"
{
	if global.p2_paletteindex = 2 {palindex = 1;}
	else {palindex = 2;}
}
else
{palindex = global.p2_paletteindex;}

shader_set(shdColorswap);
apply_palette(global.p2_palettesprite,palindex,image_alpha)

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
//&& char != "Peter Griffin" && char != "Duke" && char != "Pokey" && char != "1pixelmario" && char != "Max Verstappen" && 
&& sprite_exists(asset_get_index(spritestring)) && (char != "Sonic" || char == "Sonic" && state != ps.jump)
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
			var csw = sprite_get_width(ccs); var csh = sprite_get_height(ccs); var cswsub = csw/16;
			draw_sprite_part_ext(ccs,ind,0,csh-9,csw,9,x-(image_xscale*csw/2)+cswsub,y-8+yoff,
			(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
		}
	}
else {firedraw = false; draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,image_alpha);}
shader_reset()

event_inherited();

if pmach < 5 
{global.p2_pind = pmach}
else 
{
	if pmet mod 10 < 5 {global.p2_pind = 6}
	else {global.p2_pind = 7}
}