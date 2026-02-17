// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Info
infoText = "Press to start the kaos";
text = "Ready?";

//Action
action = function()
{
    //Go To Kaos Room
    transStart(rKaos);
    
    //Don't Hover
    canHover = false;
}