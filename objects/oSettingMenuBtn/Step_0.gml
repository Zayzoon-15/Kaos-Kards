//Set Position
x = getPosToWindow(false);

//Offset
var _boxOffset = 0;
if selected then _boxOffset = 10;

//Hover
if touchingMouse()
{
    targetX = x + 5 + _boxOffset;
} else {
    targetX = x + _boxOffset;
}

//Selected
if selected or touchingMouse()
{
	boxAlpha = lerp(boxAlpha,0,.2);
} else boxAlpha = lerp(boxAlpha,.5,.2);


//Ease
boxX = lerp(boxX,targetX,.2);
boxY = lerp(boxY,targetY,.2);
xscale = lerp(xscale,image_xscale,scaleTime);
yscale = lerp(yscale,image_yscale,scaleTime);
textSize = lerp(textSize,textTargetSize,.3);