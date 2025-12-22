//Array
targetArray = undefined;

//Get Health Inst
healthInst = noone;
findHealthInst = function()
{
	//Set Target
	with oHealthBar
	{
	    if target == other.target then other.healthInst = self.id;
	}
	
	//Set Inst
	if healthInst != noone
	{
		x = healthInst.x;
		y = healthInst.y;
        
        //Set Position
    	targetX = healthInst.bbox_right + 10;
    	targetY = y;
	}
}

findHealthInst();