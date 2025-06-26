///@desc Get Range


//Get Range
showRange = true;
if cardInfo.range != undefined
{
    currentRange = irandom_range(cardInfo.range.min,cardInfo.range.max);
}

//Audio
audio_play_sound(snShowCardStat,0,false);

//Juice
setSize(image_xscale+.5,image_yscale+.5);
image_angle += choose(random_range(-10,-5),random_range(5,10));
rangeTextSize += 1;


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

if cardInfo.type == "Action"
{
    if _targetSlot != 0 and slot.slotId == _targetSlot
    {
        with oDice
        {
            if diceId <= _targetSlot
            {
                combineValues();
            }
        }
    }
}