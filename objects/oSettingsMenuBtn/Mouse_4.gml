//Mobile Press
if global.mobile and global.mobilePress and !mobilePress
{
    mobilePress = true;
    exit;
}

//Audio
audioPlaySfx(snBtnPress,.9,1.1);

//Juice
squash(1.2,.8);

//Press
if !selected then pressed = true;
