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
    transStart(rPrepare);
    gameReset();
    
    //Don't Hover
    canHover = false;
}