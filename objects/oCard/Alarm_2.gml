///@desc Combine With Dice ONLY FOR DICE CARD

//Change Dice
with oDice
{
    if diceId == other.targetDice
    {
        diceJuice();
        diceNum += other.currentValue;
    }
}

//Set Slot
slot.used = true;

//Destroy
instance_destroy();