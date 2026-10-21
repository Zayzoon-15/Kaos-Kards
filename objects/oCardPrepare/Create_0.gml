//Inherit Parent Card
event_inherited();

//Set Info So We Can See It In Code
info ??= CardsAction.Bread;
showInfo = true;
canUse = true;

//Value
currentValue = undefined;
valueScale = 1;

//Shadow
baseMaxShadow = maxShadow;

//Set Slot
slot = noone;
justPlaced = false;
canPlace = true;

//Set Target Dice
targetDiceId = info.type == CARDTYPES.DICE ? irandom_range(1,3) : -1;

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

cardJuice = function() {
    
    //Scale
    setSize(1.5,1.5);
    valueScale += 1;
    
    //Angle
    image_angle += random_range(5,10)*choose(-1,1);
}

setDiceTargeted = function(_targeted = true) {
    if info.type == CARDTYPES.DICE and info.targetsDice {
        with oDice { //Find The Correct Dice
            if diceId == other.targetDiceId and isTargeted != _targeted {
                
                //Set Dice As Targeted
                setTargeted(_targeted);
                
                //Play Target Sound
                if _targeted {
                    audioPlaySfx(other.info.targetSoundOn);
                } else audioPlaySfx(other.info.targetSoundOff);
            }
        }
    }
}

#endregion

#region --- Built-In Functions ---

onGrab = function() {
    
	removeFromHand();
    if oDice.state == DICE_STATES.IDLE then setDiceTargeted(false);
    
}

onLetgo = function() {
	
	//Let Go On Correct Slot
	var _slot = instance_place(x, y, oSlot);
	if _slot and array_contains_value(_slot.types, info.type) and !_slot.disabled and !_slot.used and canPlace and canUse {
        
        //Swap Cards
		if _slot.filled {
			_slot.card.slot = slot;
            
            if _slot.card != noone then _slot.card.setDiceTargeted(false);
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
		
	} else if canPlace and canUse then slot = noone;
    
    //Can't Place
    if !canPlace and canUse and _slot and !_slot.used {
        createAlertMessage("Can't Place Card");
        shake += 5;
    }
    
    //Slot Used
    if _slot and !_slot.disabled and _slot.used and _slot.special {
        createAlertMessage("Special Slot has already been used");
        shake += 5;
    }
	
	//Let Go On Discard
	if place_meeting(x, y, oDiscard) and canMove and canUse {
		if !oDiscard.isFull {
			discardCard();
			exit;
		} else {
			createAlertMessage("Trash Is Full");
			shake += 5;
		}
	}
	
	//Go Back To Hand
    if slot == noone then putCardInHand();
	
}

destroy = function(_disableSlot = true) {
    
    //Disable Slot
    if slot != noone and _disableSlot {
        slot.used = true;
        slot.card = noone;
    }
    
    //Destroy
    effectStar(x,y);
    instance_destroy();
}

#endregion