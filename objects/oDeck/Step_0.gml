//Set Position
x = getPosToWindow(true);

////Exit If In Enemy Room
//if room == rEnemy then exit;

//Player Only
if room == rPrepare
{
    //Draw Cards
    if cardsInPlay < global.maxHandSize and drawTime <= 0 and cardsLeft != 0
    {
        drawCard();
    } else drawTime --;
    
    //Tip Box
    var _text;
    if cardsLeft > 1
    {
        _text = $"Your deck of cards\nYou have {cardsLeft} cards left";
    } else _text = $"Your deck of cards\nYou have {cardsLeft} card left";
    drawTipBox(_text);
}

//Hide Deck
visible = cardsLeft != 0;

//Set Can Hover
canHover = visible and !global.holdingCard and !global.menuOpen;

//Hold Mouse
if !grabbed
{
    if touchingMouse() and canHover
    {
        if mouse_check_button_pressed(mb_left)
        {
            pressed = true;
        }
        
        if mouse_check_button(mb_left) and pressed
        {
            heldTime ++;
        }
        
        //Grab
        if heldTime > 20
        {
            grabbed = true;
            global.holdingCard = true;
            
            //Offset
            offsetX = mouse_x - targetX;
            offsetY = mouse_y - targetY;
        }
        
        
        if mouse_check_button_released(mb_left) and pressed
        {
            if heldTime <= 20 and room == rPrepare
            {
                instance_create_depth(0,0,-5,oDeckShowMenu);
            }
            
            heldTime = 0;
        }
        
    } else {
        pressed = false;
        heldTime = 0;
    }
    
    //Set Position
    targetX = lerp(targetX,x,.3);
    targetY = lerp(targetY,y - cardsLeft,.3);
    
    //Shadow
    shadowX = lerp(shadowX,0,.2);
    shadowY = lerp(shadowX,0,.2);
    shadowSize = lerp(shadowSize,.05,.2);
    
    //Depth
    depth = startDepth;
    
    //Set Scale
    xscale = lerp(xscale,1,.2);
    yscale = lerp(yscale,1,.2);
} else {
    
    //Reset
    pressed = false;
    heldTime = 0;
    
    //Follow Mouse
    targetX = mouse_x - offsetX;
    targetY = mouse_y - offsetY;
    
    //Shadow
    var _shadowX = (targetX - (room_width/2))*.05;
    _shadowX = clamp(_shadowX,-10,10);
    shadowX = lerp(shadowX,_shadowX,.3);
    shadowY = lerp(shadowY,15,.3);
    shadowSize = lerp(shadowSize,0.08,.3);
    
    //Set Scale
    xscale = lerp(xscale,1.1,.2);
    yscale = lerp(yscale,1.1,.2);
    
    //Depth
    depth = -2;
    
    //Let Go
    if !mouse_check_button(mb_left)
    {
        global.holdingCard = false;
        grabbed = false;
    }
}

//Angle
angle = lerp(angle,targetXLast - targetX,.2);

//Set Last Position
targetXLast = targetX;