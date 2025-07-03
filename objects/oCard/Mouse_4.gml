///@desc Grab Card
if canGrab and !global.holdingCard and canMove
{
    //Set Right Position
    x = cardX;
    y = cardY;
    
    //Offset
    offsetX = mouse_x - x;
    offsetY = mouse_y - y;
    
    //Remove Card
    removeCardFromHand();
    
    //Set Grab
    canGrab = false;
    global.holdingCard = true;
    
    //Set State
    state = CARDSTATE.GRABBED;
    
}