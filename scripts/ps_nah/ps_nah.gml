function ps_nah()
{
	spr = ms("sMario_{}_nah");
	ind += 0.15
	if char = "Goober" and ind >= 3.5 {ind = 3.5;}
	else if char = "Iris" and ind >= 5.5 {ind = 5.5;}
	else if char = "Martin" and ind >= 4 {ind = 4;}
	else if char = "Seven" and ind >= 2 {ind = 2;}
	else if char = "SucculentKicker" and ind >= 5 {ind = 5;}
	else if char != "Wario" and char != "Goomba" and ind >= 1 {ind = 1;}
	if khr && castleendingtrigger = true {state = ps.castleending}
	if khr {state = ps.normal}
	if kjp {state = ps.jump}
	if ku {state = ps.dance0}
	do_spincarp();
	do_fire();
}
