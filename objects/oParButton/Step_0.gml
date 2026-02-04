//Hover
if touchingMouse() and canHover
{
    targetY = y - 3;
    shadowY = lerp_dt(shadowY,8,.2);
} else {
    targetY = y;
    shadowY = lerp_dt(shadowY,5,.2);
}

//Set Image
if canHover then image_index = 0; else image_index = 1;

//Info
if drawInfo
{
    drawTipBox(infoText,showInfoTop,false,11);
}

//Size To Text
if sizeToText
{
    image_xscale = (string_width(text)/60) * textTargetSize;
}

//Stick To Screen
if stickToScreen
{
	x = getPosToWindow(stickToScreenRight,stickToScreenOffset);
	targetX = x;
}

//Ease
boxX = lerp_dt(boxX,targetX,.2);
boxY = lerp_dt(boxY,targetY,.2);
xscale = lerp_dt(xscale,image_xscale,scaleTime);
yscale = lerp_dt(yscale,image_yscale,scaleTime);
image_alpha = lerp_dt(image_alpha,alpha,alphaTime);
textSize = lerp_dt(textSize,textTargetSize,.3);