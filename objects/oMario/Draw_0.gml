if instance_exists(debugtext) {draw_self();}

if powerup = "f" && (char = "Pokey" || char = "Gemaplys") and !instance_exists(oHat)
{instance_create_depth(x,y,depth+1,oHat);}
else if powerup != "f" 
{instance_destroy(oHat);}

if powerup = "c" && mycapeative = false && state != ps.capetransform && state != ps.shrink {
	var csp = instance_create_depth(x,y,depth+1,oCape);
	csp.spr = cs("sCape_idle");
	csp.m = id
	mycapeative = true;
}
else if powerup != "c" {mycapeative = false;}


//👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍

if starman != 0 and char != "Max Verstappen"
{
	gpu_set_fog(true,make_color_hsv((starman) mod 255,255,255),1,1);
	if firedraw {
		var fs = ms("sMario_{}_fire")
		var fsw = sprite_get_width(fs); var fsh = sprite_get_height(fs);
		draw_sprite_part_ext(fs,ind,0,0,fsw,fsh-8,x-(image_xscale*fsw/2),y-fsh+yoff,
		(image_xscale*scale),(image_yscale*scale),image_blend,0.5);
		
		var ccs = spr
		if spr = ms("sMario_{}_idle")
		{ccs = ms("sMario_{}_fire");}
		var csw = sprite_get_width(ccs); var csh = sprite_get_height(ccs); var cswsub = (csw/16)+(1*-image_xscale);
		draw_sprite_part_ext(ccs,ind,0,csh-9,csw,9,x-(image_xscale*csw/2)-cswsub,y-8+yoff,
		(image_xscale*scale),(image_yscale*scale),image_blend,0.5);
	}
	else {draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,0.5)}
	gpu_set_fog(false,-1,1,1);
	
	if starman mod 3 = 0 && starman > 120
	{var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); smsfx.image_xscale = image_xscale; smsfx.col = make_color_hsv((starman) mod 255,255,255); smsfx.image_index = ind; smsfx.sprite_index = spr;}
}

if taunttimer == -1 
{
	gpu_set_fog(true,c_white,1,1);	
		draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,1);
	gpu_set_fog(false,-1,1,1);
}

if shoulderbash > 0 && (current_time/1000) mod 5 = 0 || pepdancin > 10
{
	var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); 
	smsfx.image_xscale = image_xscale; 
	smsfx.col = choose(c_red,c_purple);
	smsfx.image_index = ind; 
	smsfx.sprite_index = spr;
}

//nes_flicker()
 


if powerup != "s" && crouch = false and !(char = "Sonic" && state = ps.jump) &&
(char != "1pixelmario" && global.abilities) and char != "Pokey"
{sprite_index = sMariomask1;}
else
{sprite_index = sMariomask0;}

if char == "1pixelmario" && global.abilities
{
	if powerup = "s" sprite_index = s1pixelmario_s_idle;
	else sprite_index = s1pixelmario_b_idle;
}

if string_pos("Title",room_get_name(room)) != 0 && playDemo < room_speed*8
{
	if instance_place(x+15, y, oParenemy) {state = ps.nah}  
	else {state = ps.title; ind = 0;}  
	invincible = 1;
}