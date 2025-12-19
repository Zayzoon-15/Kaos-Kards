///@desc Button Pressed
if canClick
{
	//Scale
	squash(xscale+.3);
	
	//Sound
	audioPlaySfx(snBtnPress);
	
	//Set Pressed
	pressed = true;
}