//Can Hover
with oDice
{
    if diceId == 3
    {
        other.canHover = state == DICE_STATES.DONE;
    }
}

if buttonUsed then canHover = false;