// Inherit the parent event
event_inherited();

//Button
canHover = false;

//Info
infoText = "Press when you are ready to start the round";
text = "Start";

//Action
action = function()
{
    
    //Set Gamestate
    gameState = GAMESTATES.ENEMEYTURN;
    
    //Add If Combo
    ds_list_insert(playerActions,0,false);
	if instance_exists(oComboButton) then ds_list_insert(playerActions,0,oComboButton.toggle);
    
    //Add Players Actions In Order
    for (var i = 0; i < 3; i++) {
        
        with oActionSlot
        {
            if slotId == i + 1
            {
                if filled
                {
                    addPlayerAction(card);
                } else ds_list_insert(playerActions,slotId,undefined);
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
    
    //Reset Last Used Cards EXCEPT FOR DICE
    global.lastCardsPlayed.player[0] = -1;
    global.lastCardsPlayed.player[1] = -1;
    global.lastCardsPlayed.player[2] = -1;
    global.lastCardsPlayed.enemy[0] = -1;
    global.lastCardsPlayed.enemy[1] = -1;
    global.lastCardsPlayed.enemy[2] = -1;
    
    //Reset Dice If None
    with oSpecialSlot
    {
        if !filled and !used
        {
            global.lastCardsPlayed.player[3] = -1;
            global.lastCardsPlayed.enemy[3] = -1;
        }
    }
    
    //Go To Enemy Room
    transStart(rEnemy);
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
}