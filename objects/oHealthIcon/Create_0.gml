//Get Health Inst
healthInst = noone;
findHealthInst = function()
{
	with oHealthBar
	{
	    if target == other.target then other.healthInst = self.id;
	}
}

findHealthInst();


//Set Position
x = healthInst.x;
y = healthInst.y;
targetX = healthInst.bbox_right + 10;
targetY = y;