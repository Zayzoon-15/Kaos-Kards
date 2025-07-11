// Inherit the parent event
event_inherited();

//Button
canHover = false;

//Info
infoText = "Press when you are ready to start the round";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Start";

//Action
action = function()
{
    
    //Set Gamestate
    gameState = GAMESTATES.ENEMEYTURN;
    
    
    //Add Players Actions In Order
    for (var i = 0; i < 3; i++) {
        with oCard
        {
            if state == CARDSTATE.PLACED and slot.slotId == i + 1
            {
                //Add Player Action
                addPlayerAction(self);
            }
        }
    }
    
    //Add Player Kaos
    with oCard
    {
        if state == CARDSTATE.PLACED and info.type == CARDTYPES.KAOS
        {
            addPlayerKaos(self);
        }
    }
    
    //Go To Enemy Room
    transStart(rEnemy,seqFadeOut,seqFadeIn);
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
}