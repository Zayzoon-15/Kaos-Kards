//Hover
if touchingMouse() and canHover
{
    targetY = y - 3;
    shadowY = lerp(shadowY,8,.2);
} else {
    targetY = y;
    shadowY = lerp(shadowY,5,.2);
}

//Set Image
if canHover then image_index = 0; else image_index = 1;

//Info
drawTipBox(infoText,showInfoTop,11);

//Ease
boxX = lerp(boxX,targetX,.2);
boxY = lerp(boxY,targetY,.2);
xscale = lerp(xscale,image_xscale,scaleTime);
yscale = lerp(yscale,image_yscale,scaleTime);
image_alpha = lerp(image_alpha,alpha,alphaTime);
textSize = lerp(textSize,textTargetSize,.3);