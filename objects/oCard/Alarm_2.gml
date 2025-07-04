///@desc Combine With Dice

with oDice
{
    if diceId == other.targetDice
    {
        diceJuice();
        diceNum += other.currentValue;
    }
}

instance_destroy();