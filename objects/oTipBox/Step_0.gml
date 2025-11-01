
//Get Text Size
height = string_height_ext(text,-1,maxWidth)*size;
width = string_width_ext(text,-1,maxWidth)*size;

//Fade Text
textAlpha = lerp(textAlpha,1,.2);

//Go To Parent
if instance_exists(parent)
{
    var _y;

    if top 
    {
        _y = parent.bbox_top-distance;
    } else _y = parent.bbox_bottom+distance;
    
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