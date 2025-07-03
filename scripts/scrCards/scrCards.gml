
///@self oCard
function diceCardSwapDice(_dice){
    
    //Can Place
    with oDice
    {
        if diceId == 3
        {
            if !rollDone then other.canPlace = true; else other.canPlace = false;
        }
    }
    
    //Swap Dice
    if state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == other.targetDice and dice != _dice
            {
                dice = _dice;
                diceJuice();
            }
        }
    } else { //Change Dice Back
        with oDice
        {
            if diceId == other.targetDice and dice != diceTypes.dice6 and other.wasOnSlot
            {
                dice = diceTypes.dice6;
                diceJuice();
                other.wasOnSlot = false;
            }
        }
    }
    
    //Can Grab
    if state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == 3
            {
                if rolling
                {
                    other.canMove = false;
                }
                
                if rollDone
                {
                    other.slot.used = true;
                    instance_destroy(other);
                    starEffect(other.x,other.y,10);
                }
            }
        }
    }

}