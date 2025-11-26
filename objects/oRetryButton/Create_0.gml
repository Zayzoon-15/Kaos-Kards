// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Image
image_alpha = 0;
alphaTime = .03;
scaleTime = .5;

//Info
infoText = "Press to Retry";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Retry";

//Action
action = function()
{
    //Start Game Again
	game_restart();
}