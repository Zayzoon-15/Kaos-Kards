
//Get Text Size
height = string_height_ext(text,-1,maxWidth)*size;
width = string_width_ext(text,-1,maxWidth)*size;

//Fade Text
textAlpha = lerp(textAlpha,1,.2);

//Go To Parent
if instance_exists(parent)
{
    var _y;
	var _boxTop = parent.bbox_top;
	var _boxBottom = parent.bbox_bottom;
	
	//Check If Real
	if is_real(_boxTop) then boxTop = _boxTop;
	if is_real(_boxBottom) then boxBottom = _boxBottom;
	
    if top 
    {
        _y = boxTop-distance;
    } else _y = boxBottom+distance;
    
    x = parent.x;
    y = lerp(y,_y,.2);
}

//Update String
if instance_exists(parent) and update
{
    text = parent.tipBoxString;
}

//Destory
if !touchingMouse(parent) or !parent.canHover
{
    instance_destroy();
}

//Depth
depth = -5;