//Inherit
event_inherited();

//Info
infoText = "Reminder the current tournaments are still in work";

//Text
sizeToText = false;
text = "End Break";

//Action
action = function()
{
    //Change Enemy
    global.currentEnemy = global.currentTourney.enemies[global.tourneyEnemiesBeaten];
    
    //Go To Room
    transStart(rPrepare);
    gameReset(false);
    
    //Don't Hover
    canHover = false;
}