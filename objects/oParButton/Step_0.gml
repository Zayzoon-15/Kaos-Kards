//Set Ignore
if !isMenuButton and global.menuOpen {
    ignore = true;
} else ignore = false;

//Hover
if touchingMouse() and canHover and !ignore and !global.holdingCard
{
    boxY = easeBoxPos ? lerp(boxY,-3,boxEaseTime) : -3;
    shadowY = lerp(shadowY,8,.2);
} else {
    boxY = easeBoxPos ? lerp(boxY,0,boxEaseTime) : 0;
    shadowY = lerp(shadowY,5,.2);
    
    //Reset Pressed
    pressed = false;
    mobilePress = false;
}

//Set Image
if canHover then image_index = 0; else image_index = 1;

//Info
if drawInfo
{
    drawTipBox(infoText,showInfoTop,false,11,new Vector2(0),1,false,isMenuButton);
}

//Size To Text
if sizeToText
{
    image_xscale = ((string_width(text)/70) * textTargetSize)+.2;
}

//Stick To Screen
if stickToScreen
{
    var _stick = true;
    
    if isMenuButton and !global.stickUiToScreen then _stick = false;
    if !isMenuButton and !global.stickItemsToScreen then _stick = false;
    
    if _stick {
        x = getPosToWindow(stickToScreenRight,stickToScreenOffset); 
    } else x = xstart;
}

//Ease
targetX = easePos ? lerp(targetX,x,posEaseTime) : x;
targetY = easePos ? lerp(targetY,y,posEaseTime) : y;

xscale = lerp(xscale,image_xscale+boxXScaleOffset,scaleTime);
yscale = lerp(yscale,image_yscale+boxYScaleOffset,scaleTime);
textXScale = lerp(textXScale,textTargetSize,textScaleTime);
textYScale = lerp(textYScale,textTargetSize,textScaleTime);

image_alpha = lerp(image_alpha,alpha,alphaTime);