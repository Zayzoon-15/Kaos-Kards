//Apply Options 
timeSourceCreate(2,function()
{
	if stickToScreen
	{
		x = getPosToWindow(stickToScreenRight,stickToScreenOffset);
		targetX = x;
		boxX = x;
	}
	
},[],time_source_units_frames);

//Position
boxX = x;
boxY = y;
targetX = x;
targetY = y;
stickToScreen = false; //Makes the position change based on the screen
stickToScreenRight = true; //If it should stick the the right side or left side of the screen
stickToScreenOffset = xstart; //The offset of the x position to the screen

//Image
xscale = image_xscale;
yscale = image_yscale;
scaleTime = .3;
alpha = 1;
alphaTime = .3;
shake = 0;
shadowX = 0;
shadowY = 0;

//Hover
canHover = true;

//Clicking
pressed = false;
canPress = true;
buttonUsed = false;
mobilePress = false;

//Info
drawInfo = true;
showInfoTop = true;
infoText = "This button does something";

//Text
sizeToText = false;
textTargetSize = 2;
textSize = textTargetSize;
text = "Button";

//Sound
soundHover = [snBtnHover1,snBtnHover2];
soundPressed = snBtnPress;

//Size
setSize(2,.85);

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