//Hover Effect
if touchingMouse() and canHover and !global.midTrans
{
    //Set Angle Based On Mouse
    if mousePos == 0 then mousePos = sign(mouse_x - x);
    targetAngle = mousePos * 3;
    
    //Image
    scale = 1.05;
    image_speed = 1;
} else {
    //Reset Image
    image_speed = 0;
    targetAngle = 0;
    scale = 1;
    
    //Reset Mouse
    mousePos = 0;
    pressed = false;
}

//Stick To Screen
if stickToScreen
{
	x = getPosToWindow(stickToScreenRight,stickToScreenOffset);
}

//Ease
angle = lerp(angle,targetAngle,.2);
xscale = lerp(xscale,scale*imageDir,.2);
yscale = lerp(yscale,scale,.2);