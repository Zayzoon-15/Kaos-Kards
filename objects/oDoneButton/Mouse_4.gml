//Check If Used Reroll
if instance_exists(oCardReroll) and room == rPlayerRoom
{
    with oCardReroll{
        if state == CARDSTATE.PLACED
        {
            showMessage("You haven't used your reroll yet!");
            other.cardUnused = true;
        }
    }
}

var _filled = 0;
with oPlayerCardSlot
{
    if filled
    {
        _filled += 1;
    }
}

if _filled <= 1 and room == rPlayerRoom and canPress
{
    showMessage("You have to fill in at least 2 Action slots!");
    cardUnused = true;
}

if !canPress
{
    cardUnused = true;
}


if canPress and !cardUnused and room == rPlayerRoom
{
    var _growSize = .5;
    
    setSize(xscaleStart+_growSize,yscaleStart+_growSize);
    textScale += _growSize;
    
    buttonPressed();
    
    audio_play_sound(snButtonPress2,0,false);
    
    canPress = false;
}

if cardUnused and room == rPlayerRoom
{
    shake = 5;
    
    audio_play_sound(snDeny,0,false);
    
    cardUnused = false;
}