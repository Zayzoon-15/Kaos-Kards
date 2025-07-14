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
    transStart(rKaos,seqFadeOut,seqFadeIn);
    
    //Don't Hover
    canHover = false;
}