///@desc Let Go
if state == CARDSTATE.GRABBED
{
    
    //Discards
    if place_meeting(x,y,oDiscard) and !oDiscard.isFull
    {
        deleteCard();
    } else {
        //Slots
        var _actionSlot = instance_place(x,y,oActionSlot);
        
        if _actionSlot and info.type == CARDTYPES.ACTION
        {
            //Swap Places
            if _actionSlot.filled
            {
                with oCard
                {
                    if state == CARDSTATE.PLACED and slot == _actionSlot.id
                    {
                        //Swith With Other Slot
                        if other.slot != noone
                        {
                            var _targetSlot = other.slot;
                            other.slot = slot;
                            slot = _targetSlot;
                        } else {
                        	other.slot = slot;
                            putCardInHand();
                        }
                    }
                }
            } else {
                resetSlot();
                slot = _actionSlot.id;
            } 
            
            state = CARDSTATE.PLACED;
            
        } else putCardInHand();
    } 
    
    //Set Grab
    global.holdingCard = false;
}