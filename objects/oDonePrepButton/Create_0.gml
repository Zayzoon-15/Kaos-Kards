// Inherit the parent event
event_inherited();

//Button
canHover = false;

//Info
infoText = "Press when you are done preparing";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Done";

//Action
action = function()
{
    
    //Show Card Values
    var _timeBetween = 0;
    
    //Add If Dice
    with oCard
    {
        if state == CARDSTATE.PLACED and info.type == CARDTYPES.DICE
        {
            _timeBetween = 1;
        }
    }
    
    with oCard
    {
        if state == CARDSTATE.PLACED
        {
            //Make Card Get Value
            if info.type != CARDTYPES.KAOS
            {
                alarm[0] = 30*(slot.slotId+_timeBetween);
            }
        }
    }
    
    //Empty Slot
    with oActionSlot
    {
        alarm[0] = 30*(slotId+_timeBetween);
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
        if info == diceCards.reroll and state == CARDSTATE.PLACED
        {
            createAlertMessage("You haven't used your reroll");
            other.canPress = false;
            exit;
        }
    }
    
    //Check If One Action Slot Filled
    var _slotsFilled = 0;
    with oCard //Add To Slots Filled
    {
        if state == CARDSTATE.PLACED and info.type == CARDTYPES.ACTION
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
