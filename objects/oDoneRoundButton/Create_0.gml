// Inherit the parent event
event_inherited();

//Button
canHover = false;

//Info
infoText = "Press when you are ready to start";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Done";

//Action
action = function()
{
    
    //Set Gamestate
    gameState = GAMESTATES.ENEMEYTURN;
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
}