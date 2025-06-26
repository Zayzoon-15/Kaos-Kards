if canPress
{
    var _growAmount = .2;
    xscale -= _growAmount;
    yscale -= _growAmount;

    audio_play_sound(snButtonPress1,0,false);
    
    if arrowId == 1
    {
        oTutManager.nextPage();
    } else oTutManager.lastPage();
}