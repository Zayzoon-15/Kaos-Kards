///@desc Check If Dice Card Used

if instance_exists(slot) and slot.used and info.type == CARDTYPES.DICE
{
    print("DICE CARD USED");
    global.lastCardsPlayed.player[3] = {
        info : info,
        value : currentValue,
        index : index
    };
}