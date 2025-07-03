///@desc Card Conditions

#region Dice Cards

//Reroll
if info == diceCards.reroll
{
    with oDice
    {
        if diceId == 3
        {
            if rollDone then other.canPlace = true; else other.canPlace = false;
        }
    }
    
    if state == CARDSTATE.PLACED and !oRollButton.canHover
    {
        oRollButton.canHover = true;
    }
    
    if wasOnSlot and oRollButton.canHover and state != CARDSTATE.PLACED
    {
        oRollButton.canHover = false;
        wasOnSlot = false;
    }
}

//8 Sided Dice
if info == diceCards.dice8
{
    diceCardSwapDice(oDice.diceTypes.dice8);
}

//12 Sided Dice
if info == diceCards.dice12
{
    diceCardSwapDice(oDice.diceTypes.dice12);
}

//20 Sided Dice
if info == diceCards.dice20
{
    diceCardSwapDice(oDice.diceTypes.dice20);
}

#endregion