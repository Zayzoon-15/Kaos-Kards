//Inherit Delta Time Object (For delta time ooooo)
event_inherited();

//Image
d_image_speed = 0;
targetScale = 1;

//Set Dice Stats
diceType = diceTypes.d6;
diceNum = undefined;
targetSlot = undefined;

//Set Dice States
enum DICE_STATES {
    IDLE, //When the dice is not interacted with yet
    ROLLING, //When the dice is rolling duhh
    DONE, //When the dice is done rolling is ready to combine
    SKIPPED, //When the dice has been skipped
    COMBINE //When the dice is combining with the cards
}
state = DICE_STATES.IDLE;

//Targeted 
isTargeted = false;

#region --- Custom Functions ---

rollDice = function() {
    
    //Roll Dice Visually WOAH
    d_image_speed = 1;
    
    //Set State
    state = DICE_STATES.ROLLING;
    diceNum = undefined;
    
    //Finish Roll
    d_alarm[0] = diceId * 20;
    
}

diceJuice = function(_sound = true) {
    
    //Move Down
    y += 10;
    
    //Set Size
    setSize(targetScale+1,targetScale+1);
    
    //Stars
    effectStar(x,y,5,_sound);
    
}

combineValues = function() {
    
    
    //Get Target Slot
    with oSlot {
        if slotId == other.diceId and filled {
            other.targetSlot = self.id;
        }
    }
    
    //Check If We Should Combine More
    var _extraCombine = 0;
    with oCardPrepare {
        if state == CARD_STATES.PLACED and info.type == CARDTYPES.DICE {
            _extraCombine = 1;
        }
    }
    
    //Combine The Dice
    d_alarm[1] = 30 * (diceId + _extraCombine);
}

#endregion

/*
scale = 1;

//Targeted
isTargeted = false;
lockOnFrames = 0;
lockOnAlpha = 0;

//Events
diceFullyDone = false;
