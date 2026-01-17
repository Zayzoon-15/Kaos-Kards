// Inherit the parent event
event_inherited();

//Page
curPage = 1;

//Button
canHover = true;

//Info
infoText = "Press to start the match";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Start";

//Action
action = function()
{
    //Go To Room
    transStart(rPrepare);
    gameReset();
    
    //Don't Hover
    canHover = false;
}