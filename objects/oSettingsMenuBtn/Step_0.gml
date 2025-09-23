//Hover
if touchingMouse()
{
    targetX = x + 5;
} else {
    targetX = x;
}

//Ease
boxX = lerp(boxX,targetX,.2);
boxY = lerp(boxY,targetY,.2);
xscale = lerp(xscale,image_xscale,scaleTime);
yscale = lerp(yscale,image_yscale,scaleTime);
textSize = lerp(textSize,textTargetSize,.3);

//Set Position
x = getPosToWindow(false);