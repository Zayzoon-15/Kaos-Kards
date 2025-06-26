///@desc Check if Last

//Check if Last
var _targetSlot = 3;

with oPlayerCardSlot
{
    if slotId == 3 and !filled
    {
        _targetSlot = 2;
        
        if slotId == 2 and !filled
        {
            _targetSlot = 1;
        } else if slotId == 1 and !filled
        {
            _targetSlot = 0;
        }
    }
}

if diceId == _targetSlot
{
    oGame.alarm[4] = 40;
}
