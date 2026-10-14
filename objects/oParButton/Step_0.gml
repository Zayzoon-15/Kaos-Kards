//Set Ignore
if !isMenuButton and global.menuOpen {
    ignore = true;
} else ignore = false;

//Hover
if touchingMouse() and canHover and !ignore and !global.holdingCard
{
    boxY = easeBoxPos ? lerp_dt(boxY,-3,boxEaseTime) : -3;
    shadowY = lerp_dt(shadowY,8,.2);
} else {
    boxY = easeBoxPos ? lerp_dt(boxY,0,boxEaseTime) : 0;
    shadowY = lerp_dt(shadowY,5,.2);
    
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
targetX = easePos ? lerp_dt(targetX,x,posEaseTime) : x;
targetY = easePos ? lerp_dt(targetY,y,posEaseTime) : y;

xscale = lerp_dt(xscale,image_xscale+boxXScaleOffset,scaleTime);
yscale = lerp_dt(yscale,image_yscale+boxYScaleOffset,scaleTime);
textXScale = lerp_dt(textXScale,textTargetSize,textScaleTime);
textYScale = lerp_dt(textYScale,textTargetSize,textScaleTime);

image_alpha = lerp_dt(image_alpha,alpha,alphaTime);