
function CardsDice() {
    
    #region --- Usable Functions ---
    
    //Functions that all dice cards can use
    _changeDiceType = function(_card = oCardPrepare, _targetDiceType = global.diceTypes.d6) {
        with oDice {
            if diceId == _card.targetDiceId {
                changeDiceType(_targetDiceType);
            }
        }
    }
    
    #endregion
    
	static Reroll = new createCardDice("Reroll", "Reroll all the [aq]dice[s][lg](Can ONLY be placed after roll)", sCardReroll);
	Reroll.use = function(_card = oCardPrepare, _targetEnemy = false) {
        
        //Set Roll Button As Hoverable
		oRollBtn.canHover = true;
        
        if !_card.canMove and oDice.state == DICE_STATES.DONE {
            _card.destroy();
        }
	}
    Reroll.update = function(_card = oCardPrepare, _targetEnemy) {
        
        //Set As Placeable
        if _card.canMove {
            if oDice.state == DICE_STATES.DONE {
                _card.canPlace = true;
            } else _card.canPlace = false;
        }
        
        //Set Roll Button As Not Hoverable
        if _card.canPlace and _card.state != CARDSTATE.PLACED {
            oRollBtn.canHover = false;
        }
        
        //Can't Move If Rolling
        if oDice.state == DICE_STATES.ROLLING and _card.state == CARD_STATES.PLACED {
            _card.canMove = false;
        }
        
        //Destroy After Roll Done
        if oDice.state == DICE_STATES.DONE and _card.state == CARD_STATES.PLACED and !_card.canMove {
            _card.destroy();
        }
    }
	
	static Upgrade = new createCardDice("Dice Upgrade", "Adds a random amount to a random [aq]dice[/] roll", sCardUpgrade, true, [1, 6]);
    Upgrade.use = function(_card = oCardPrepare, _targetEnemy = false) {
		
	}
	
	static AllNothin = new createCardDice("All or Nothin'", "If all [aq]dice[/] roll [o]higher[/] than half of their maximum value, set all [aq]dice[/] to their maximum value. Otherwise, set all [aq]dice[/] to 0[s][lg](Can ONLY be placed before roll)", sCardAllNothin);
	AllNothin.use = function(_card = oCardPrepare, _targetEnemy = false) {
        
    }
	AllNothin.update = function(_card = oCardPrepare, _targetEnemy = false) {
        
        //Don't Let Escape If Rolling 
        if _card.state == CARD_STATES.PLACED {
            if oDice.state == DICE_STATES.ROLLING {
                _card.canMove = false;
            }
            if oDice.state == DICE_STATES.DONE {
                
                //Check Dice To See How Many Succeeded
                var _diceAboveNum = 0;
                with oDice {
                    if diceNum >= diceType.range.max/2 {
                        _diceAboveNum ++;
                    }
                }
                //Change Dice Values
                with oDice {
                    if _diceAboveNum >= 3 {
                        diceNum = dice.range.max;
                    } else diceNum = 0;
                    
                    //Juice
                    diceJuice(diceId == 3);
                }
                
                //Destroy Card
                _card.destroy();
            }
        } else if oDice.state != DICE_STATES.IDLE { //Can't Place If Not Idle
            _card.canPlace = false;
        }
	}
	
	///Dice Changes
	static Dice8 = new createCardDice("8 Sided Dice", "Changes one random [aq]dice[/] to an 8 sided [aq]dice[s][lg](Can ONLY be placed before roll)", sCardDice8, true, undefined, 9);
    Dice8.use = function(_card = oCardPrepare, _targetEnemy = false) {
        _changeDiceType(_card, global.diceTypes.d8);
	}
    Dice8.update = function(_card = oCardPrepare, _targetEnemy) {
        //Don't Let Escape If Rolling 
        if _card.state == CARD_STATES.PLACED {
            if oDice.state == DICE_STATES.ROLLING {
                _card.canMove = false;
            }
            if oDice.state == DICE_STATES.DONE {
                _card.destroy();
            }
        } else if oDice.state != DICE_STATES.IDLE { //Can't Place If Not Idle
            _card.canPlace = false;
        }
    }
	
	static Dice12 = new createCardDice("12 Sided Dice", "Changes one random [aq]dice[/] to a 12 sided [aq]dice[s][lg](Can ONLY be placed before roll)", sCardDice12, true, undefined, 6);
	Dice12.use = function(_card = oCardPrepare, _targetEnemy = false) {
		_changeDiceType(_card, global.diceTypes.d12);
	}
    Dice12.update = Dice8.update;
	
	static Dice20 = new createCardDice("20 Sided Dice", "Changes one random [aq]dice[/] to a 20 sided [aq]dice[s][lg](Can ONLY be placed before roll)", sCardDice20, true, undefined, 4);
	Dice20.use = function(_card = oCardPrepare, _targetEnemy = false) {
		_changeDiceType(_card, global.diceTypes.d20);
	}
    Dice20.update = Dice8.update;
	
}