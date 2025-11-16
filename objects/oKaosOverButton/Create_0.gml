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
    transStart(rPrepare,seqFadeOut,seqFadeIn);
    
    //Don't Hover
    canHover = false;
}