if !canRoll and room == rPlayerRoom
{
    shake = 5;
    
    audio_play_sound(snDeny,0,false);
    
}

if canRoll
{
    var _growSize = .5;
    
    setSize(xscaleStart+_growSize,yscaleStart+_growSize);
    textScale += _growSize;

    audio_play_sound(snButtonPress1,0,false);
    
    with oDice
    {
        rollDice();
    }
    canRoll = false;
}