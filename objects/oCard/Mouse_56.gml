///@desc Let Go
if state == CARDSTATE.GRABBED
{
    
    var _putCardInHand = function(){
        //Add To Hand
        ds_list_add(playerHand,self);
        cardId = oDeck.currentCard;
        oDeck.currentCard ++;
        
        //Change State
        state = CARDSTATE.HAND;
    }
    
    //Discards
    if place_meeting(x,y,oDiscard) and !oDiscard.isFull
    {
        oDeck.cardsInPlay --;
        oDiscard.discards ++;
        instance_destroy();
    } else {
        //Slots
        var _actionSlot = instance_place(x,y,oActionSlot);
        
        if _actionSlot and info.type == CARDTYPES.ACTION
        {
            
        } else _putCardInHand();
    } 
    
    //Set Grab
    global.holdingCard = false;
}