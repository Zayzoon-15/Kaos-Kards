// Inherit the parent event
event_inherited();

//Button
canHover = false;

//Info
infoText = "Press when you are done preparing";
text = "Done";

//Action
action = function()
{
    
    //Show Card Values
    var _timeBetween = 0;
    
    //Add More Time If Theres A Dice Card To Add
    with oCardPrepare {
        if state == CARD_STATES.PLACED and info.type == CARDTYPES.DICE {
            _timeBetween = 1;
        }
    }
    
    //Make Card Get Values
    with oCardPrepare {
        if state == CARD_STATES.PLACED and info.type != CARDTYPES.KAOS {
            d_alarm[0] = 30 * (slot.slotId + _timeBetween);
        }
    }
    
    //Make Slots Get Notified
    with oSlot {
        if array_contains(types,CARDTYPES.ACTION) {
            d_alarm[0] = 30 * (slotId + _timeBetween);
        }
    }
    
    //Set Gamestate
    gameState = GAMESTATES.GETVALUES;
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
    
    //Check If Reroll Used
    with oCard
    {
        if info == CardsDice.Reroll and state == CARDSTATE.PLACED
        {
            createAlertMessage("You haven't used your reroll");
            other.canPress = false;
            exit;
        }
    }
    
    //Check If One Action Slot Filled
    var _slotsFilled = 0;
    with oCardPrepare //Add To Slots Filled
    {
        if state == CARD_STATES.PLACED and info.type == CARDTYPES.ACTION
        {
            _slotsFilled ++;
        }
    }
    
    if _slotsFilled < 1
    {
        createAlertMessage("You have to place at least one action card");
        canPress = false;
        exit;
    }
}
