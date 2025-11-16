
//Position
boxX = x;
boxY = y;
targetX = x;
targetY = y;

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

//Info
drawInfo = true;
showInfoTop = true;
infoText = "This button does something";

//Text
sizeToText = false;
textTargetSize = 2;
textSize = textTargetSize;
text = "Button";

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