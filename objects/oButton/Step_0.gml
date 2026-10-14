//Set Image
image_index = !canHover;

//Set Hover
if touchingMouse() and canHover and !ignore and !global.holdingCard {
    
    if !hover {
        onHover();
        audioPlaySfx(soundHover);
    }
    
    hover = true;
} else hover = false;

//Hover Effect
if hover {
    
    //Set Offsets
    boxOffsetY = easeBoxPos ? lerp_dt(boxOffsetY,-3,.3) : -3;
    shadowY = lerp_dt(shadowY,8,.2);
    
} else {
    
    //Set Offsets
    boxOffsetY = easeBoxPos ? lerp_dt(boxOffsetY,0,.3) : 0;
    shadowY = lerp_dt(shadowY,5,.2);
    
    //Reset Pressed
    pressed = false;
    mobilePress = false;
}

//Info
if drawInfo
{
    drawTipBox(infoText,showInfoOnTop,false,11,new Vector2(0),1,false,isMenu);
}

//Size To Text
if sizeToText
{
    image_xscale = ((string_width(text)/70) * textTargetScale)+.2;
}

//Go To Target Position
x = lerp_dt(x, stickToScreen and ((isUi and global.stickUiToScreen) or (global.stickItemsToScreen and !isUi)) ? getPosToWindow(stickToRight, targetX) : targetX, .3);
y = lerp_dt(y, targetY, .3);


//Ease Scale
xscale = lerp_dt(xscale,image_xscale+boxXScaleOffset,.3);
yscale = lerp_dt(yscale,image_yscale+boxYScaleOffset,.3);
textXScale = lerp_dt(textXScale,textTargetScale,.3);
textYScale = lerp_dt(textYScale,textTargetScale,.3);

//Ease Alpha
image_alpha = lerp_dt(image_alpha,alpha,.3);