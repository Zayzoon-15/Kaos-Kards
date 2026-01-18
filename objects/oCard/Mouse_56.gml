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
        var _specialSlot = instance_place(x,y,oSpecialSlot);
        
        if _actionSlot and !_actionSlot.used and info.type == CARDTYPES.ACTION and canPlace and canUse
        {
            //Swap Places
            if _actionSlot.filled
            {
                with oCard
                {
                    if state == CARDSTATE.PLACED and slot == _actionSlot.id
                    {
                        //Switch With Other Slot
                        if other.slot != noone
                        {
                            hover = true;
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
            
        } else if _specialSlot and !_specialSlot.used and info.type != CARDTYPES.ACTION and canPlace and canUse
        {
        	
            
            var _stopSwap = false;
            
            with oCard
            {
                if state == CARDSTATE.PLACED and slot == _specialSlot.id
                {
                    if canMove
                    {
                        _stopSwap = false;
                    } else _stopSwap = true;
                }
            }
            
            //Swap Places
            if !_stopSwap
            {
                if _specialSlot.filled
                {
                    with oCard
                    {
                        if state == CARDSTATE.PLACED and slot == _specialSlot.id
                        {
                            //Switch With Other Slot
                            if other.slot != noone
                            {
                                hover = true;
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
                    slot = _specialSlot.id;
                }
                
                state = CARDSTATE.PLACED;
            } else putCardInHand();
        } else putCardInHand(); //Not Touching Any Slots
    } 
    
    //Set Grab
    global.holdingCard = false;
}