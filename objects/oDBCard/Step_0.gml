//Visible
cardVisible = false;
if instance_exists(oDBContainer)
{
    cardVisible = collision_rectangle(oDBContainer.bbox_left,oDBContainer.bbox_top+100,oDBContainer.bbox_right,oDBContainer.bbox_bottom-60,self,false,false);
} else cardVisible = collision_rectangle(oDBDeck.bbox_left,oDBDeck.bbox_top+100,oDBDeck.bbox_right,oDBDeck.bbox_bottom-60,self,false,false);

//Scroll
targetY = ystart + scrollOffset;

//Set Holding Card
if global.midTrans then global.holdingCard = false;

//Card Grabbed
if grabbed
{
    //Follow Mouse
    x = mouse_x - offsetX;
    y = mouse_y - offsetY;
    cardX = x;
    cardY = y;
    
    //Insert Hole
    if place_meeting(x,y,oDBInsertHole)
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
    angle = 0;
    
    //Depth
    depth = startDepth - 5;
} else { //Card Idle
    
    //Can Grab
    canGrab = !instance_exists(oDBSort) and cardVisible and !oDeckBuilder.transition;

	//Set Hover
    if touchingMouse() and !global.holdingCard and canGrab
    {
        //Sound
        if !hover {
            audioPlaySfx(snCardHover);
            hoverDir = sign(mouse_x - x);
        }
        
        //Set Hover
        hover = true;
    } else hover = false;
    
    //Hovered
    if hover
    {
        cardTargetY = y - 10;
        shadowY = lerp(shadowY,16,.2);
        
        onMouse ++;
        angle = 3 * hoverDir;
        
    } else {
        cardTargetY = y;
        shadowY = lerp(shadowY,8,.2);
        angle = 0;
        
        //Spin
        if onMouse <= 4 and onMouse > 0
        {
            //Sound
            audio_stop_sound(snCardHover);
            audioPlaySfx(snCardFlip,.95,1.05);
            
            //Tween
            var _dir = sign(mouse_x - x);
            var _start = _dir == -1 ? 0 : 360;
            var _end = _dir == -1 ? 360 : 0;
            TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,60,"cardAngle",_start,_end);
        }
        onMouse = 0;
        
    }
    
    //Position
    x = lerp(x,targetX+cardXOffset,.3);
    y = lerp(y,targetY+cardYOffset,.3);
    cardX = x;
    cardY = lerp(cardY,cardTargetY,.2);
    
    //Ease
    image_xscale = lerp(image_xscale,1,.2);
    image_yscale = lerp(image_yscale,1,.2);
    shadowX = lerp(shadowX,0,.2);
    
    //Depth
    depth = startDepth;
    
    //Info Box
    if hover then drawCardText(info);
}

//Rotate
var _angle = angle+(xprevious - x);
image_angle = lerp(image_angle,_angle,.2);