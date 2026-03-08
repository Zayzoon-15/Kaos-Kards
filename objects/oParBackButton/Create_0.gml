//Apply Options 
timeSourceCreate(2,function()
{
	if stickToScreen
	{
		x = getPosToWindow(stickToScreenRight,stickToScreenOffset);
	}
	
},[],time_source_units_frames);

//Position
stickToScreen = true; //Makes the position change based on the screen
stickToScreenRight = true; //If it should stick the the right side or left side of the screen
stickToScreenOffset = xstart; //The offset of the x position to the screen

//Image
imageDir = sign(image_xscale);
targetAngle = 0;
scale = imageDir;
xscale = scale;
yscale = 1;
angle = 0;
shake = 0;

//Hover
canHover = true;
mousePos = 0;

//Clicking
pressed = false;
canPress = true;
buttonUsed = false;
mobilePress = false;

//Sound
soundHover = [snBtnHover1,snBtnHover2];
soundPressed = snBtnPress;

//Action
action = function()
{
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
}