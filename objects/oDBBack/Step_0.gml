//Can Press
if touchingMouse() and !instance_exists(oDBSort) and !global.midTrans
{
    if mousePos == 0
    {
        mousePos = sign(mouse_x - x);
    }
    
    targetAngle = mousePos * 3;
    scale = 1.05;
    
    
    canPress = true;
    image_speed = 1;
} else {
    
    targetAngle = 0;
    scale = 1;
    
    mousePos = 0;
    
    canPress = false;
    pressed = false;
    image_speed = 0;
}


angle = lerp(angle,targetAngle,.2);
xscale = lerp(xscale,scale,.2);
yscale = lerp(yscale,scale,.2);