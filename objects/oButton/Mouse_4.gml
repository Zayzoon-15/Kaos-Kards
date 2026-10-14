///@desc Press Button Duh

//Ignore
if ignore then exit;

//Mobile Press
if global.mobile and global.mobilePress and !mobilePress and canPress and !global.midTrans
{
    mobilePress = true;
    exit;
}

//Press
if canHover and canPress and !global.midTrans and condition()
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
    audioPlaySfx(soundDeny);
    shake += 5;
}