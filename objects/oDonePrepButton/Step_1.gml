
//Can Hover
with oDice
{
    if diceId == 3
    {
        if rollDone then other.canHover = true; else other.canHover = false;
    }
}

if buttonUsed then canHover = false;