//Mobile Press
if global.mobile and global.mobilePress and !mobilePress and canPress and !global.midTrans
{
    mobilePress = true;
    exit;
}

//Check Condition
if canHover then condition();

//Press
if canHover and canPress and !global.midTrans
{
    //Juice
    var _growSize = .5;
    squash(image_xscale+_growSize,image_yscale+_growSize);
    textXScale += _growSize;
    textYScale += _growSize;
    
    //Sound
    audioPlaySfx(soundPressed);
    
    //Set Pressed
    pressed = true;
    mobilePress = false;
    
} else {
    audioPlaySfx(snDeny);
    shake += 5;
}
