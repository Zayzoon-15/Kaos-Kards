///@desc Grab Card
if canGrab and !global.holdingCard
{
    //Set Right Position
    x = cardX;
    y = cardY;
    
    //Offset
    offsetX = mouse_x - x;
    offsetY = mouse_y - y;
    
    //Remove Card From Hand
    ds_list_delete(playerHand,cardId);
    
    with oCard
    {
        if cardId > other.cardId
        {
            cardId --;
        }
    }
    
    oDeck.currentCard --;
    
    //Set Grab
    canGrab = false;
    global.holdingCard = true;
    
    //Set State
    state = CARDSTATE.GRABBED;
    
}