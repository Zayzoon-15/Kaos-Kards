//Set Hand Size
if instance_exists(oDeckShowMenu)
{
    switch (info.type) {
    	case CARDTYPES.ACTION: handSize = oDeckShowMenu.actionIds; break;
    	case CARDTYPES.DICE: handSize = oDeckShowMenu.diceIds; break;
    	case CARDTYPES.KAOS: handSize = oDeckShowMenu.kaosIds; break;
    }
    
    //Set Start Depth
    startDepth = -(array_length(playerDeck)+oDeckShowMenu.depth+1);
    
    //Set Show Placed
    showPlaced = oDeckShowMenu.showPlaced;
    
    //Reset Text
    textInfo = struct_copy(info);
    if showPlaced
    { 
        setText();
    }
}

//Set Position
if handSize >= 6
{
    targetX = cardHandMush(handSize,cardId,xstart,boxWidth-30);
} else targetX = cardHandSep(handSize,cardId,xstart);

//Card Grabbed
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
    cardX = x;
    cardY = y;
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.05;
    shadowX = clamp(shadowX,-10,10);
    shadowX = lerp(shadowX,_shadowX,.2);
    shadowY = lerp(shadowY,15,.2);
    shadowSize = lerp(shadowSize,0.08,.2);
    
    //Ease
    image_xscale = lerp(image_xscale,targetScale+.1,.4);
    image_yscale = lerp(image_yscale,targetScale+.1,.4);
    
    //Depth
    depth = startDepth - array_length(playerDeck);
} else { //Card Idle
    
    //Can Grab
    canGrab = !global.holdingCard;
    
    //Other Cards
	var _touchingOthers = false;
	with oDeckShowCards
	{
		if hover and id != other.id
		{
            _touchingOthers = cardId < other.cardId;
		}
	}

	//Set Hover
    if touchingMouse() and !global.holdingCard and canGrab and !_touchingOthers
    {
        //Sound
        if !hover {
            audioPlaySfx(snCardHover);
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
    
    //Reset Angle
    if cardAngle == 360
    {
        cardAngle = 0;
    }
    
    //Ease
    image_xscale = lerp(image_xscale,targetScale,.2);
    image_yscale = lerp(image_yscale,targetScale,.2);
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.03;
    shadowX = clamp(shadowX,-6,6);
    shadowX = lerp(shadowX,_shadowX,.2);
    
    //Depth
    depth = startDepth + (cardId-(handSize-1));
    if depth > startDepth then depth = startDepth;
    
    //Info Box
    if hover then drawCardText(textInfo,array_length(playerDeck));
}

//Rotate
var _angle = (xprevious - x);
image_angle = lerp(image_angle,_angle,.2);