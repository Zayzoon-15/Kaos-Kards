// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Image
image_alpha = 0;
alphaTime = .03;
scaleTime = .5;

//Info
infoText = "Press to go to next round";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Continue";

//Action
action = function()
{
    //Go To Kaos Room
	randomise();
	_trans = seqFadeOut;
	if irandom_range(0,10) == 0 then _trans = oTransSticker;
    
    //Don't Hover
    canHover = false;
}