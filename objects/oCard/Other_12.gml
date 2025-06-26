///@desc Placed State

//Text
showWarnText = false;

#region Card Juice

//Angle Cards
var _angle = (xstart - x)*.02;

image_angle = lerp(image_angle,0,.2);

#endregion

//Hovered
if touchingMouse() and !global.holdingCard and canGrab
{
    targetY = slot.y - 10;
    shadowY = lerp(shadowY,14,.2);
    if !instance_exists(oInfoBox) and canGrab and !place_meeting(x,y,oDeck)
    {
        var _inst = showInfoBox(cardInfo);
        _inst.parent = self;
    }
} else {
	targetY = slot.y;
    shadowY = lerp(shadowY,6,.2);
}

targetX = slot.x;

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = lerp(shadowX,_shadowX,.2);
shadowX = clamp(shadowX,-7,7);
shadowSize = lerp(shadowSize,0.05,.2);

//Ease
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);

//Depth
depth = lerp(depth,startDepth,.1);

//Placed
wasPlaced = true;
slot.filled = true;

//Can Grab
if depth >= startDepth - 1
{
    canGrab = true;
} else canGrab = false;