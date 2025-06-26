
with oDice
{
    if diceId == 3
    {
        if rollDone
        {
            other.canBePlaced = true;
        } else other.canBePlaced = false;
    }
}


if state == CARDSTATE.PLACED and !oRollButton.canRoll
{
    oRollButton.canRoll = true;
}

if wasPlaced and oRollButton.canRoll and state != CARDSTATE.PLACED
{
    oRollButton.canRoll = false;
}