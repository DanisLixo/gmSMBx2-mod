/// @function mario_freeze
/// @description Returns Mario's freeze type.
function mario_freeze()
{
	var freezing = 0;
	if instance_number(oMario) == 1 && !global.sync
	{
		with(oMario)
		{
			if state = ps.die or state = ps.grow or state = ps.firetransform or 
			state = ps.capetransform or state = ps.shrink {freezing = 1;}
			if state = ps.enterpipedown or state = ps.enterpiperight {freezing = 2;}
			if state = ps.flagpoledescend or state = ps.flagpolefinish {freezing = 3;}
			if state = ps.castleending {freezing = 4;}
		}
	}
	return freezing;
}