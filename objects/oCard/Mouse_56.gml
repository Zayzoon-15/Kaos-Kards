///@desc Let Go of Card

if state == CARDSTATE.GRABBED
{
    
    var _putCardInHand = function()
    {
        ds_list_add(playerHand,self);
        
        if wasPlaced
        {
            oDeck.currentCards ++;
        }
        
        cardId = oDeck.currentCards-1;
        
        if instance_exists(slot)
        {
            slot.filled = false;
        }
        
        slot = noone;
        state = CARDSTATE.HAND;
    }
    
    if !place_meeting(x,y,[oDiscard,oPlayerCardSlot,oPlayerSpecialSlot])
    {
        _putCardInHand();
    }
    
    if place_meeting(x,y,oDiscard)
    {
        if oDiscard.discards < oDiscard.maxDiscrads
        {
            if !wasPlaced
            {
                oDeck.currentCards --;
            } else slot.filled = false;
            
            oDiscard.discards ++;
            
            oDeck.cardsInPlay --;
            
            var _sound = asset_get_index($"snDiscard{irandom_range(1,2)}");
            audio_play_sound(_sound,0,false);
            
            instance_destroy();
        } else{
            _putCardInHand();
            
            oDiscard.shake = 8;
            audio_play_sound(snDiscardFull,0,false);
        } 
    } 
    
    //Action Slot
    var _actionSlot = instance_place(x,y,oPlayerCardSlot);
    if instance_place(x,y,oPlayerCardSlot)
    {
        if !_actionSlot.filled and cardInfo.type == "Action" and canBePlaced
        {
            if !wasPlaced
            {
                oDeck.currentCards --;
            } else slot.filled = false;
            slot = _actionSlot;
            state = CARDSTATE.PLACED;
        } else {
        	_putCardInHand();
        }
    }
    
    //Special Slot
    var _specialSlot = instance_place(x,y,oPlayerSpecialSlot);
    if instance_place(x,y,oPlayerSpecialSlot)
    {
        if !_specialSlot.filled and cardInfo.type != "Action" and canBePlaced
        {
            if !wasPlaced
            {
                oDeck.currentCards --;
            } else slot.filled = false;
            slot = _specialSlot;
            state = CARDSTATE.PLACED;
        } else {
        	_putCardInHand();
        }
    }
    
    
    global.holdingCard = false;
    
}
