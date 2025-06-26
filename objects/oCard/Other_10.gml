///@desc Hand State

#region Card Juice

var _handSize = ds_list_size(playerHand);

//Center Cards
var _gap = sprite_width+5;
var _leftEdge = (_handSize-1)*(_gap/2); 
var _handX = room_width/2 - _leftEdge + (cardId * _gap);

targetX = _handX;


//Angle Cards
var _angle = (xstart - x)*.02;

image_angle = lerp(image_angle,_angle,.2);
image_angle = clamp(image_angle,-15,15);

//Warp Cards
var _rad = 30;
var _ang = 0;

if cardId != 0
{
    _ang = 360/((_handSize-1)*2);
}

var _handY = (ystart + lengthdir_y(_rad, cardId*_ang));

#endregion

wasPlaced = false;
showWarnText = false;

//Hovered
if touchingMouse() and !global.holdingCard and canGrab
{
    targetY = _handY - 10;
    shadowY = lerp(shadowY,14,.2);
    if !instance_exists(oInfoBox) and canGrab and !place_meeting(x,y,oDeck)
    {
        var _inst = showInfoBox(cardInfo);
        _inst.parent = self;
    }
} else {
	targetY = _handY;
    shadowY = lerp(shadowY,6,.2);
}

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-10,10);
shadowX = lerp(shadowX,_shadowX,.2);
shadowSize = lerp(shadowSize,0.05,.2);

//Ease
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);


//Depth
depth = lerp(depth,startDepth,.1);

if depth >= startDepth - 1
{
    canGrab = true;
} else canGrab = false;
