//Fade Text
textAlpha = lerp(textAlpha,1,.2);

//Go To Parent
if instance_exists(parent)
{
    //Set Flip Info
    flipInfo = parent.y < (room_height/2)-100;
    
    //Set Position    
    x = parent.x;
    var _targetY = flipInfo ? parent.bbox_bottom+20 : parent.bbox_top-20;
    y = lerp(y,_targetY,.2);
	
	//Destory
	if !parent.hover or !parent.canGrab or global.holdingCard
	{
	    instance_destroy();
	}
} else instance_destroy();

//Depth
depth = -5;