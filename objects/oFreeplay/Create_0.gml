// Inherit the parent event
event_inherited();

//Button
canHover = true;
sizeToText = false;

//Info
infoText = "Go to tourney Selector  menu (Not done yet)";
text = "Freeplay";

//Action
action = function()
{
    //Go To Room
    transStart(rTournies);
    eventGameReset();
    
    //Don't Hover
    canHover = false;
}