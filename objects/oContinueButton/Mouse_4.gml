if canPress
{
    var _growSize = .5;
    
    setSize(xscaleStart+_growSize,yscaleStart+_growSize);
    textScale += _growSize;
    audio_play_sound(snButtonPress2,0,false);
    
    currentRound += 1;
    
    gamestate = GAMESTATE.PREPARE;
    resetGame();
    transStart(rPlayerRoom,seqFadeOut,seqFadeIn);
    
    canPress = false;
}