//Inherit the parent event
event_inherited();

//Text
text = "Done";
infoText = "Press when you are done preparing";

//Button Version Setup (So it can switch between the values button and done button)
buttonVer = "Values";

//Set Hover 
canHover = false;

//Set Action
action = function () {
    
    if buttonVer == "Values" {
        
        //Show Card Values
        var _timeBetween = 0;
        
        //Add More Time If Theres A Dice Card To Add
        with oCardPrepare {
            if state == CARD_STATES.PLACED and info.type == CARDTYPES.DICE and info.range != undefined {
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
    else {
        
        //Set Gamestate
        gameState = GAMESTATES.ENEMEYTURN;
        
        //Add Combo
        ds_list_insert(playerActions, 0, false);
        if instance_exists(oComboBtn) then ds_list_insert(playerActions, 0, oComboBtn.toggle);
        
        //Add Players Actions In Order
        for (var i = 1; i < 3; i++) {
        	with oSlot {
                if slotId == i {
                    if i == 0 {
                        addPlayerKaos(card);
                    } else {
                        if filled {
                            addPlayerAction(card);
                        } else ds_list_insert(playerActions, slotId, undefined);
                    }
                }
            }
        }
        
        //Reset Last Used Cards EXCEPT FOR DICE
        global.lastCardsPlayed.player[0] = -1;
        global.lastCardsPlayed.player[1] = -1;
        global.lastCardsPlayed.player[2] = -1;
        global.lastCardsPlayed.enemy[0] = -1;
        global.lastCardsPlayed.enemy[1] = -1;
        global.lastCardsPlayed.enemy[2] = -1;
        with oSlot {
            if special and !filled and !used { 
                global.lastCardsPlayed.player[3] = -1; 
                global.lastCardsPlayed.enemy[3] = -1;
            }
        }
        
        //Go To Enemy Room
        transStart(rEnemy);
        
        //Don't Hover
        canHover = false;
    }
    
}

//Check Condition
condition = function()
{
    //Check If Reroll Used
    with oCardPrepare
    {
        if info.type == CARDTYPES.DICE and state == CARDSTATE.PLACED and info.range == undefined
        {
            createAlertMessage("You haven't used your dice card");
            return false;
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
        return false;
    }
    
    //Allow Press
    return true;
}