//All the cards states


///@self oCard
function cardStateHand(){
    
    #region Card Juice
    
    var _handSize = ds_list_size(playerHand);
    var _maxSize = 10;
    
    //Center Cards
    var _handX = 0;
    
    if _handSize >= _maxSize
    {
        _handX = cardHandMush();
    } else _handX = cardHandSep();
    
    
    //Angle Cards
    var _angle = ((room_width/2) - x)*.02;
    
    image_angle = lerp(image_angle,_angle,.2);
    image_angle = clamp(image_angle,-15,15);
    
    //Warp Cards
    var _rad = 30;
    var _ang = 0;
    
    if cardId != 0  then _ang = 360/((_handSize-1)*2);
    
    var _handY = (ystart + lengthdir_y(_rad, cardId*_ang));
    
    #endregion
    
    
    #region Hover
    
    //Other Cards
	var _touchingOthers = false;
	with oCard
	{
		if hover and id != other.id
		{
            _touchingOthers = cardId < other.cardId;
		}
	}
	
    //Set Hover
	if touchingMouse() and !global.holdingCard and !_touchingOthers
    {
        //Sound
        if !hover then audioPlaySfx(snCardHover);
        
        //Set Hover
        hover = true;
    } else hover = false;
	
    //Hovered
    if hover
    {
        cardTargetY = _handY - 10;
        shadowY = lerp(shadowY,16,.2);
    } else {
    	cardTargetY = _handY;
        shadowY = lerp(shadowY,8,.2);
    }
    
    targetX = _handX;
    targetY = _handY;
    
    #endregion
    
    
    #region Ease
    
    //Position
    x = lerp(x,targetX,.2);
    y = lerp(y,targetY,.2);
    cardX = x;
    cardY = lerp(cardY,cardTargetY,.2);
    
    //Scale
    image_xscale = lerp(image_xscale,1,.2);
    image_yscale = lerp(image_yscale,1,.2);

    #endregion
    
    
    #region Drawing
    
    //Depth
    depth = startDepth + (cardId*.5);
    if depth > -1 then depth = -1;
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.03;
    shadowX = clamp(shadowX,-10,10);
    shadowX = lerp(shadowX,_shadowX,.2);
    shadowSize = lerp(shadowSize,0.05,.2);
    
    #endregion
    
    //Can Grab
    canGrab = !global.holdingCard;
    
    //Delete Key
    if hover and gameState == GAMESTATES.PREPARE
    {
        if keyCheckPressed(global.keyDiscard) and !oDiscard.isFull
        {
            removeCardFromHand();
            deleteCard();
        }
    }
    
    //Info Box
    if hover then drawCardText(info);
}



///@self oCard
function cardStateGrabbed()
{
    //Follow Mouse
    x = mouse_x - offsetX;
    y = mouse_y - offsetY;
    cardX = x;
    cardY = y;
    
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
    
    //Shake
    if place_meeting(x,y,oDiscard)
    {
        shake = 2;
    }
    
    //Can Place
    if place_meeting(x,y,oParSlots) and (!canPlace or !canUse)
    {
        shake = 2;
    }
    
    //Depth
    depth = -2;
}



///@self oCard
function cardStatePlaced()
{
    //Can Grab
    canGrab = !global.holdingCard;
    
    #region Hover
    
    var _cardX = slot.x;
    var _cardY = slot.y;
    
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
        cardTargetY = _cardY - 8;
        shadowY = lerp(shadowY,15,.2);
        shadowSize = lerp(shadowSize,0.08,.2);
    } else {
    	cardTargetY = _cardY;
        shadowY = lerp(shadowY,8,.2);
        shadowSize = lerp(shadowSize,0.1,.2);
    }
    
    targetX = _cardX;
    targetY = _cardY;
    
    #endregion
    
    
    #region Ease
    
    //Position
    x = lerp(x,targetX,.2);
    y = lerp(y,targetY,.2);
    image_angle = lerp(image_angle,0,.2);
    cardX = x;
    cardY = lerp(cardY,cardTargetY,.2);
    
    //Scale
    image_xscale = lerp(image_xscale,1,.2);
    image_yscale = lerp(image_yscale,1,.2);

    #endregion
    
    
    #region Drawing
    
    //Depth
    depth = startDepth;
    
    //Shadow
    var _shadowX = (x - (room_width/2))*.03;
    shadowX = clamp(shadowX,-6,6);
    shadowX = lerp(shadowX,_shadowX,.2);
    
    #endregion
    
    //Slot
    slot.filled = true;
    wasPlaced = true;
    wasOnSlot = true;
    
    //Info Box
    if canGrab then drawCardText(info);
}

