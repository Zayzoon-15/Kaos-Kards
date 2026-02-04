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
	boxAlpha = lerp_dt(boxAlpha,0,.2);
} else boxAlpha = lerp_dt(boxAlpha,.5,.2);


//Ease
boxX = lerp_dt(boxX,targetX,.2);
boxY = lerp_dt(boxY,targetY,.2);
xscale = lerp_dt(xscale,image_xscale,scaleTime);
yscale = lerp_dt(yscale,image_yscale,scaleTime);
textSize = lerp_dt(textSize,textTargetSize,.3);