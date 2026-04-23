// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Info
infoText = "Press to start the tournament";
text = "Start";

//Action
action = function()
{
    //Start Game
    transStart(rTourneyBreak);
    gameReset(true);
    
    //Don't Hover
    canHover = false;
}