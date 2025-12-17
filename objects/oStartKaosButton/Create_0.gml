// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Info
infoText = "Press to start the kaos";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Ready?";

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