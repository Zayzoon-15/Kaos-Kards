if grabbed
{
    //Grab Double Check
    if !mouse_check_button(mb_left)
    {
        event_perform(ev_mouse,ev_global_left_release);
        exit;
    }
    
    //Follow Mouse
    x = mouse_x - offsetX;
    y = mouse_y - offsetY;
    
    //Depth
    depth = -10;
    
    //Rotate
    var _angle = xprevious - x;
    image_angle = lerp(image_angle,_angle,.2);
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.05;
    shadowX = clamp(shadowX,-10,10);
    shadowX = lerp(shadowX,_shadowX,.2);
    shadowY = lerp(shadowY,15,.2);
    shadowSize = lerp(shadowSize,0.05,.2);
    
    //Ease
    image_xscale = lerp(image_xscale,startScale + .1,.4);
    image_yscale = lerp(image_yscale,startScale + .1,.4);
} else {
    //Can Grab
    canGrab = !global.holdingCard;
    
    //Set Hover
    if touchingMouse() and canGrab
    {
        //Sound
        if !hover then audioPlaySfx(snCardHover);
        
        //Set Hover
        hover = true;
        
    } else hover = false;
    
    //Hovered
    if hover
    {
        cardY = lerp(cardY,-8,.3);
        shadowY = lerp(shadowY,12,.2);
        shadowSize = lerp(shadowSize,0.02,.2);
    } else {
        cardY = lerp(cardY,0,.3);
        shadowY = lerp(shadowY,5,.2);
        shadowSize = lerp(shadowSize,0.03,.2);
    }
    
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.03;
    shadowX = clamp(shadowX,-6,6);
    shadowX = lerp(shadowX,_shadowX,.2);
    
    //Increase Sine Times
    sineTimes.x += .01;
    sineTimes.y += .01;
    sineTimes.angle += .02;
    
    //Move Position
    sineX = sineBetween(sineTimes.x,5,-5,5);
    sineY = sineBetween(sineTimes.y,5,-5,5);
    
    //Ease
    x = lerp(x,targetX,.3);
    y = lerp(y,targetY,.3);
    image_xscale = lerp(image_xscale,startScale,.4);
    image_yscale = lerp(image_yscale,startScale,.4);
    
    //Rotate
    var _angle = xprevious - x;
    image_angle = lerp(image_angle,_angle+sineWave(sineTimes.angle,5,3,0),.2);
    
    //Depth
    depth = startDepth;
    
    //Info Box
    if canGrab and image_alpha >= 1 then drawCardText(info);
}