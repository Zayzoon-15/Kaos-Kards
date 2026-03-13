//Correct Room Check
if room != rPrepare
{
    visible = false;
    exit;
} else visible = true;


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
    depth = -2;
    
    //Rotate
    var _angle = xprevious - x;
    image_angle = lerp(image_angle,_angle,.2);
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.05;
    shadowX = clamp(shadowX,-10,10);
    shadowX = lerp(shadowX,_shadowX,.2);
    shadowY = lerp(shadowY,15,.2);
    shadowSize = lerp(shadowSize,0.08,.2);
    
    //Ease
    image_xscale = lerp(image_xscale,1.1,.4);
    image_yscale = lerp(image_yscale,1.1,.4);
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
        targetY = ystart - 8;
        shadowY = lerp(shadowY,15,.2);
        shadowSize = lerp(shadowSize,0.08,.2);
    } else {
        targetY = ystart;
        shadowY = lerp(shadowY,8,.2);
        shadowSize = lerp(shadowSize,0.1,.2);
    }
    
    //Ease
    var _angle = xprevious - x;
    image_angle = lerp(image_angle,_angle+sineWave(current_time/1000,5,5,0),.2);
    x = lerp(x,targetX,.3);
    y = lerp(y,targetY,.3);
    
    //Depth
    depth = startDepth;
    
    //Info Box
    if canGrab then drawCardText(info);
}

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = clamp(shadowX,-6,6);
shadowX = lerp(shadowX,_shadowX,.2);