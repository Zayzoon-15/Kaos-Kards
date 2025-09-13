//Get Health Inst
healthInst = noone;
findHealthInst = function()
{
	with oHealthBar
	{
	    if target == other.target then other.healthInst = self.id;
	}
	
	if healthInst != noone
	{
		x = healthInst.x;
		y = healthInst.y;
	}
}

findHealthInst();


//Set Position
targetX = healthInst.bbox_right + 10;
targetY = y;