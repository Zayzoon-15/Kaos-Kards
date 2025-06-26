///@desc Grabbed State

//Follow Mouse
x = mouse_x - offsetX;
y = mouse_y - offsetY;

//Rotate
var _angle = (xprevious - x);
image_angle = lerp(image_angle,_angle,.2);

//Shadow
var _shadowX = (x - (room_width/2))*.05;
shadowX = clamp(shadowX,-10,10);
shadowX = lerp(shadowX,_shadowX,.2);
shadowY = lerp(shadowY,15,.2);
shadowSize = lerp(shadowSize,0.08,.2);

//Ease
image_xscale = lerp(image_xscale,1.1,.4);
image_yscale = lerp(image_yscale,1.1,.4);

//Shake
if place_meeting(x,y,oDiscard)
{
    shake = 2;
}

//Slot Filled
var _actionSlot = instance_place(x,y,oPlayerCardSlot);
if _actionSlot and cardInfo.type == "Action"
{
    if _actionSlot.filled
    {
        shake = 1;
    }
}

var _specialSlot = instance_place(x,y,oPlayerSpecialSlot);
if _specialSlot and cardInfo.type != "Action"
{
    if _specialSlot.filled or _specialSlot.used
    {
        shake = 1;
    }
}

//Warn
if place_meeting(x,y,oPlayerCardSlot) and cardInfo.type == "Action"
{
    if !canBePlaced
    {
        shake = 1;
        showWarnText = true;
    } else showWarnText = false;
} else showWarnText = false;
    
if place_meeting(x,y,oPlayerSpecialSlot) and cardInfo.type != "Action"
{
    if !canBePlaced
    {
        shake = 1;
        showWarnText = true;
    } else showWarnText = false;
} else showWarnText = false;

//Depth
depth = startDepth-10;