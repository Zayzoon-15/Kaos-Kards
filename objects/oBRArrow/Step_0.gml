//Stick To Screen
x = global.stickItemsToScreen ? getPosToWindow(false) : xstart;

//Touching
if (touchingMouse() and !global.menuOpen and !global.midTrans) or image_speed == 1
{
    ////Hover
    //if !hover
    //{
        ////Set Hover
        //hover = true;
    //}
    
    //Start Press
    if mouse_check_button_pressed(mb_left) {
        
        //Scale
        scale -= .2;
        
        pressed = true;
    } 
    
    //Pressed
    if mouse_check_button_released(mb_left) and pressed and !global.menuOpen
    {
        //Animate
        image_index = 0;
        image_speed = 1;
        
        //Stop Other Events
        global.menuOpen = true;
        
        //Action
        timeSourceCreate(10,action,[],time_source_units_frames);
    }
    
    //Scale
    scale = lerp(scale,1.08,.2);
    shadowScale = lerp(shadowScale,.94,.2);
    
    //Shadow
    shadowY = lerp(shadowY,7,.2);
    shadowX = lerp(shadowX,0,.2);
    
    //Outline
    outlineAlpha = lerp(outlineAlpha,1.0,.2);
    
    //Angle
    angle = lerp(angle,2,.2);
    
} else {
    
    //Press
    pressed = false;
    hover = false;
    
    //Scale
    scale = lerp(scale,1,.2);
    shadowScale = lerp(shadowScale,1,.2);
    
    //Shadow
    shadowY = lerp(shadowY,7,.2);
    shadowX = lerp(shadowX,0,.2);
    
    //Outline
    outlineAlpha = lerp(outlineAlpha,0.0,.2);
    
    //Angle
    angle = lerp(angle,0,.2);
}
