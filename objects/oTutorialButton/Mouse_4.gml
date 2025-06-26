if canPress and !global.midTrans
{
    var _growSize = .5;
    
    setSize(xscaleStart+_growSize,yscaleStart+_growSize);
    textScale += _growSize;
    audio_play_sound(snButtonPress2,0,false);
    
    transStart(rTutorial,seqLoadOut,seqLoadIn);
    canPress = false;
}