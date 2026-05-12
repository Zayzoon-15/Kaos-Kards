//Get Text Size
draw_set_font(fnMain);
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
    
    x = parent.x + offset.x;
    y = lerp(y,_y + offset.y,.2);

    if variable_instance_exists(parent,"tipBoxTouching")
    {
        touching = parent.tipBoxTouching;
    }
}

//Keep In Room
x = clamp(x,CAMERA_POS.x+((width/2)+widthMargin),SCREEN_EDGE.right - ((width/2)+widthMargin));
y = clamp(y,CAMERA_POS.y+(top ? height + heightMargin*2 : 0),SCREEN_HEIGHT - (top ? 0 : height + heightMargin*2));

//Update String
if instance_exists(parent) and update
{
    text = parent.tipBoxString;
}

//Destory
if (!touchingMouse(parent) and !touching) or !parent.canHover or (!menuItem and global.menuOpen) or global.holdingCard
{
    instance_destroy();
}

//Depth
depth = -5;