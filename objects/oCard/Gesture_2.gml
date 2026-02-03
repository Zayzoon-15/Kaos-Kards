///@desc Grab Card Mobile
if canGrab and !global.holdingCard and canMove and gameState == GAMESTATES.PREPARE and global.mobile
{
    //Set Right Position
    x = cardX;
    y = cardY;
    
    //Offset
    offsetX = mouse_x - x;
    offsetY = mouse_y - y;
    
    //Remove Card
    hover = false;
    removeCardFromHand();
    
    //Set Grab
    canGrab = false;
    global.holdingCard = true;
    
    //Set State
    state = CARDSTATE.GRABBED;
    
}