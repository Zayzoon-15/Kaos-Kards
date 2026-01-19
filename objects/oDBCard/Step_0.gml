//Card Grabbed
if grabbed
{
    //Follow Mouse
    x = mouse_x - offsetX;
    y = mouse_y - offsetY;
    cardX = x;
    cardY = y;
    
    //Instert Hole
    if place_meeting(x,y,oDBInstertHole)
    {
        shake = 1;
    } else shake = 0;
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.05;
    shadowX = clamp(shadowX,-10,10);
    shadowX = lerp(shadowX,_shadowX,.2);
    shadowY = lerp(shadowY,15,.2);
    shadowSize = lerp(shadowSize,0.08,.2);
    
    //Ease
    image_xscale = lerp(image_xscale,1.1,.4);
    image_yscale = lerp(image_yscale,1.1,.4);
    
    //Depth
    depth = startDepth - 5;
} else { //Card Idle
	//Set Hover
    if touchingMouse() and !global.holdingCard
    {
        //Sound
        if !hover then audioPlaySfx(snCardHover);
        
        //Set Hover
        hover = true;
    } else hover = false;
    
    //Hovered
    if hover
    {
        cardTargetY = y - 10;
        shadowY = lerp(shadowY,16,.2);
        
        onMouse ++;
        
    } else {
        cardTargetY = y;
        shadowY = lerp(shadowY,8,.2);
        
        //Spin
        if onMouse <= 5 and onMouse > 0
        {
            var _dir = sign(mouse_x - x);
            var _start = _dir == 1 ? 0 : 360;
            var _end = _dir == 1 ? 360 : 0;
            TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,60,"cardAngle",_start,_end);
        }
        onMouse = 0;
        
    }
    
    //Position
    x = lerp(x,targetX,.2);
    y = lerp(y,targetY,.2);
    cardX = x;
    cardY = lerp(cardY,cardTargetY,.2);
    
    //Ease
    image_xscale = lerp(image_xscale,1,.2);
    image_yscale = lerp(image_yscale,1,.2);
    
    //Depth
    depth = startDepth;
}

//Rotate
var _angle = xprevious - x;
image_angle = lerp(image_angle,_angle,.2);