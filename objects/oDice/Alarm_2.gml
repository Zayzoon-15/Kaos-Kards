///@desc Combine With Cards

//Combine NOOOWWW
with oCardPrepare {
    if state == CARD_STATES.PLACED and slot == other.targetSlot {
        //Juice Ooooo
        cardJuice();
        effectStar(x, y, 10);
        
        //Add Range
        currentValue += other.diceNum;
    }
}

//Destroy
instance_destroy();

//with oCard
//{
    //if state == CARDSTATE.PLACED and slot == other.targetSlot
    //{
        ////Juice
        //cardJuice();
        //effectStar(x,y,10);
        //
        ////Add Range
        //currentValue += other.diceNum;
    //}
//}
//
//instance_destroy();
