//Check Condition
if canHover then condition();

//Press
if canHover and canPress and !global.midTrans
{
    //Juice
    var _growSize = .5;
    squash(image_xscale+_growSize,image_yscale+_growSize);
    textSize += _growSize;
    
    //Sound
    audioPlaySfx(soundPressed);
    
    //Set Pressed
    pressed = true;
    
} else {
    audioPlaySfx(snDeny);
    shake += 5;
}
