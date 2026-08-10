///@desc Check If Dice Card Used

if instance_exists(slot) and slot.used and info.type == CARDTYPES.DICE
{
    global.lastCardsPlayed.player[3] = info;
}