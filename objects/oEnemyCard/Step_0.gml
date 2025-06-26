#region Card Juice

//Angle Cards
var _angle = ((room_width/2) - x)*.02;

image_angle = lerp(image_angle,0,.2);

#endregion

//Hovered
if touchingMouse() and !global.holdingCard
{
    targetY = ystart - 10;
    shadowY = lerp(shadowY,14,.2);
    if !instance_exists(oInfoBox)
    {
        var _inst = showInfoBox(cardInfo);
        _inst.parent = self;
    }
} else {
	targetY = ystart;
    shadowY = lerp(shadowY,6,.2);
}

targetX = xstart;

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = lerp(shadowX,_shadowX,.2);
shadowX = clamp(shadowX,-7,7);
shadowSize = lerp(shadowSize,0.05,.2);

//Ease
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);
rangeAlpha = lerp(rangeAlpha,1,.2);
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);