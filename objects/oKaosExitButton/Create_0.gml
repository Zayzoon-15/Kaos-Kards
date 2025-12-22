// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Image
image_alpha = 0;
alphaTime = .03;
scaleTime = .5;

//Info
infoText = "Press to return to the menu";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Exit";

//Action
action = function()
{
    //Leave Game
	transStart(rTournies);
	timeSourceCreate(.3,gameReset);
}