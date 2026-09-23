//Inherit Parent Card
event_inherited();

//Set Info So We Can See It In Code
info ??= CardsAction.Bread;

//Shadow
baseMaxShadow = maxShadow;

//Set Slot
slot = noone;

//Flip Card
TweenFire(self, EaseOutBack, TWEEN_MODE_ONCE, true, 0, 1, "card3dRot", 180, 0);

#region --- Custom Functions ---

putCardInHand = function()
{
    //Hover
    hover = false;
    
    //Add To Hand
    ds_list_add(playerHand,self);
    cardId = oDeck.currentCard;
    oDeck.currentCard ++;
    
    //Change State
    state = CARD_STATES.HAND;
}

removeFromHand = function() {
    //Remove Card From Hand
    if state == CARD_STATES.HAND
    {
        ds_list_delete(playerHand,cardId);
        
        with oCardPrepare
        {
            if cardId > other.cardId
            {
                cardId --;
            }
        }
        
        //Set Deck
        oDeck.currentCard --;
    }
}

discardCard = function() {
	
    //Set Values
	array_push(oDeck.cardsDiscarded,info);
    oDeck.cardsInPlay --;
    global.discards ++;
    
    //Reset Slot
	if slot != noone {
		slot.card = noone;
		slot.filled = false;
	}
    
    //Sound
    audioPlaySfx([snDiscard1,snDiscard2,snDiscard3]);
    
    //Destroy
    instance_destroy();	
}

#endregion

#region --- Built-In Functions ---

onGrab = function() {
	removeFromHand();
}

onLetgo = function() {
	
	//Let Go On Correct Slot
	var _slot = instance_place(x, y, oSlot);
	if _slot and array_contains_value(_slot.types, info.type) and !_slot.disabled and !_slot.used {
		
		//Swap Cards
		if _slot.filled {
			_slot.card.slot = slot;
			if slot != noone then slot.card = _slot.card; else _slot.card.putCardInHand();
		}
		
		//Set Slot
		slot = _slot;
		placedX = _slot.x;
		placedY = _slot.y;
		
		//Set Card For Slot
		_slot.card = self;
		_slot.filled = true;
		
		//Exit Code
		exit;
		
	} else slot = noone;
	
	//Let Go On Discard
	if place_meeting(x, y, oDiscard) {
		if !oDiscard.isFull {
			discardCard();
			exit;
		} else {
			createAlertMessage("Trash Is Full");
			shake += 5;
		}

	}
	
	//Go Back To Hand
	putCardInHand();
	
}

#endregion