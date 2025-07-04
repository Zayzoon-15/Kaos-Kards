///@desc Combine With Cards

with oCard
{
    if state == CARDSTATE.PLACED and slot == other.targetSlot
    {
        //Juice
        cardJuice();
        starEffect(x,y,10);
        
        //Add Range
        currentValue += other.diceNum;
    }
}

instance_destroy();