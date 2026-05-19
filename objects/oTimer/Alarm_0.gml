///@desc Tick Timer Down

global.gameTimer -= 1;

//Check Time
if global.gameTimer <= 0 //Times Up
{
    //Show Message
    createAlertMessage("TIMES UP",200);
    
    //Stop Grabbing Card
    with oCard {
    	if state == CARDSTATE.GRABBED
        {
            event_perform(ev_mouse,ev_global_left_release);
        }
    }
    
    #region Force Select A Card If No Cards
    
    //Check Slots
    var _slotsFilled = 0;
    with oActionSlot {
    	if filled then _slotsFilled ++;
    }
    
    //Place A Card
    if _slotsFilled == 0
    {
        //Get Slot
        var _targetSlot = noone;
        with oActionSlot
        {
            if slotId == 1 then _targetSlot = self.id;
        }
        
        //Choose A Card
        var _choosenCard = false;
        with oCard
        {
            if state == CARDSTATE.HAND and info.type == CARDTYPES.ACTION and !_choosenCard
            {
                //Remove From Hand
                removeCardFromHand();
                
                //Set Slot
                slot = _targetSlot.id;
                
                //Set State
                state = CARDSTATE.PLACED;
                
                //Set Choosen
                _choosenCard = true;
            }
        }
    }
    
    #endregion
    
    //Get Values
    gameState = GAMESTATES.GETVALUES;
    
    //Set Timer
    global.gameTimer = 0;
    
} else alarm[0] = 60; //Start Timer Again