//Change Placement
if !grabbed {
	if !instance_exists(slot) { //Hand Placement
	
		//Get Sizes
	    var _handSize = ds_list_size(playerHand);
	    var _maxSize = 10;
    
		//Warp Cards
		var _rad = 30;
		var _ang = cardId == 0 ? 0 : 360/((_handSize-1)*2);
		var _handY = (ystart + lengthdir_y(_rad, cardId*_ang));

		//Set Hand Placement
		placedX = _handSize >= _maxSize ? cardHandMush(_handSize) : cardHandSep(_handSize);
		placedY = _handY;
		
		//Shadow
		maxShadow = baseMaxShadow;
		
		//Key Place
		if hover and grabbable and !global.holdingCard and canMove and gameState == GAMESTATES.PREPARE {
			
			//Place Card
			if keyCheckPressed(global.keyPlace) {
				
				//Get Target Slot
				var _swap = true;
				var _filledSlot = true;
				for (var i = 0; i < 4; ++i) {
					with oSlot {
						if _swap and slotId == i and array_contains_value(types, other.info.type) and !used and !filled and !disabled {
							_swap = false;
							
							//Move Card Over
							var _oldPos = new Vector2(other.x,other.y);
							other.x = x;
							other.y = y;
							other.removeFromHand();
							other.onLetgo();
							other.x = _oldPos.x;
							other.y = _oldPos.y;
							
							_filledSlot = false;
							
							continue;
						}
					}
				}
				
				//Failed Swap
				if _swap and _filledSlot {
					createAlertMessage("No Slots Open");
					shake += 5;
				}
				
			}
			
			if keyCheckPressed(global.keyDiscard) {
				if oDiscard.isFull {
					createAlertMessage("Trash Is Full");
					shake += 5;
				} else {
					removeFromHand();
					discardCard();
				}
					

			}
			
			
		}
	
		//Set State
		state = CARD_STATES.HAND;
	
	} else { //Slot Placement
	
		//Set Placement To Slot
		placedX = slot.x;
		placedY = slot.y;
		
		//Shadow
		maxShadow = 5;
	
		//Remove Card
		if keyCheckPressed(global.keyPlace) and hover and grabbable and !global.holdingCard and canMove and gameState == GAMESTATES.PREPARE {
			state = CARD_STATES.GRABBED;
			slot.card = noone;
			slot.filled = false;
			slot = noone;
			putCardInHand();
		}
	
		//Set State
		state = CARD_STATES.PLACED;
	}
} else maxShadow = baseMaxShadow;

//Set Angle
if state == CARD_STATES.HAND {
	targetAngle = (ROOM_CENTER.x - x) * .02;
} else targetAngle = 0;