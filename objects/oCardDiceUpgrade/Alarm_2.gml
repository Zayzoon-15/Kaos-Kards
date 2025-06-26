///@desc Upgrade Dice

with oDice
{
    if diceId == other.targetDice
    {
        diceJuice();
        diceNum += other.currentRange;
    }
}

with oPlayerSpecialSlot
{
    used = true;
}

instance_destroy();