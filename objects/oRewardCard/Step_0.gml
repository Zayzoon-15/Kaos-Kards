
#region Card Juice

//Angle Cards
var _angle = (xstart - x)*.02;

image_angle = lerp(image_angle,_angle,.2);

#endregion

//Hovered
if touchingMouse() and canPress
{
    targetY = ystart - 10;
    shadowY = lerp(shadowY,14,.2); 
} else {
	targetY = ystart;
    shadowY = lerp(shadowY,6,.2);
}

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = lerp(shadowX,_shadowX,.2);
shadowX = clamp(shadowX,-7,7);
shadowSize = lerp(shadowSize,0.05,.2);

//Ease
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);


//Position
var _distance = 100;

switch (placement) {
	case 0:
        targetX = xstart - _distance;
    break;
    
	case 1:
        targetX = xstart;
    break;
    
	case 2:
        targetX = xstart + _distance;
    break;
}