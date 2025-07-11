
//Position
boxX = x;
boxY = y;
targetX = x;
targetY = y;

//Image
xscale = image_xscale;
yscale = image_yscale;
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
showInfoTop = true;
infoText = "This button does something";

//Text
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