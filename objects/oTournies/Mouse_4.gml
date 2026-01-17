//Mobile Press
if global.mobile and global.mobilePress and !mobilePress and canHover
{
    mobilePress = true;
    exit;
}

if canHover
{
	//Scale
	squash(1.2);
	
	//Audio
	audioPlaySfx(snBtnPress);
	
	//Set Pressed
	pressed = true;
    mobilePress = false;
}