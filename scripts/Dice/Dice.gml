


///@self oCard
function diceCardSwapDice(_info,_card,_dice)
{	
    //Can Place
    with oDice
    {
        if diceId == 3
        {
            if !rollDone then _card.canPlace = true; else _card.canPlace = false;
        }
    }
    
    //Swap Dice
    if _card.state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == _card.targetDice and dice != _dice
            {
                dice = _dice;
                diceJuice();
            }
        }
    } else { //Change Dice Back
        with oDice
        {
            if diceId == _card.targetDice and dice != diceTypes.d6 and _card.wasOnSlot
            {
                dice = diceTypes.d6;
                diceJuice();
                _card.wasOnSlot = false;
            }
        }
    }
    
    //Can Grab
    if _card.state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == 3
            {
                if rolling
                {
                    _card.canMove = false;
                }
                
                if rollDone
                {
                    _card.slot.used = true;
					starEffect(_card.x,_card.y,10);
                    instance_destroy(_card);
                }
            }
        }
    }
}


///@self oCard
function diceCardReroll(_info,_card)
{	
    with oDice
    {
        if diceId == 3
        {
            if rollDone then _card.canPlace = true; else _card.canPlace = false;
        }
    }
    
    if _card.state == CARDSTATE.PLACED and !oRollButton.canHover
    {
        oRollButton.canHover = true;
    }
    
    if _card.wasOnSlot and oRollButton.canHover and _card.state != CARDSTATE.PLACED
    {
        oRollButton.canHover = false;
        _card.wasOnSlot = false;
    }
}