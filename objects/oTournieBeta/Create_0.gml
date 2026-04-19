// Inherit the parent event
event_inherited();

//Button
canHover = true;
sizeToText = true;

//Info
infoText = "Go to tourney Selector  menu (Not done yet)";
text = "Tournaments";

//Action
action = function()
{
    //Go To Room
    transStart(rTourneySelector );
    gameReset();
    
    //Don't Hover
    canHover = false;
}