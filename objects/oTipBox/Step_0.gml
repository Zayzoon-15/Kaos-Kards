
//Get Text Size
height = string_height_ext(text,-1,maxWidth);
width = string_width_ext(text,-1,maxWidth);

//Fade Text
textAlpha = lerp(textAlpha,1,.2);

//Go To Parent
if instance_exists(parent)
{
    var _y;
    var _distance = 10;
    
    if top 
    {
        _y = parent.bbox_top-_distance;
    } else _y = parent.bbox_bottom+(_distance*5);
    
    
    x = parent.x;
    y = lerp(y,_y,.2);
}

//Destory
if !touchingMouse(parent) or !parent.canHover
{
    instance_destroy();
}

//Depth
if instance_exists(parent) then depth = parent.depth - 5;