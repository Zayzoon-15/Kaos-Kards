
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
    squash(1.2*imageDir,1.2);
    
    //Sound
    audioPlaySfx(soundPressed);
    
    //Set Pressed
    pressed = true;
    mobilePress = false;
} else {
	audioPlaySfx(snDeny);
    shake += 5;
}