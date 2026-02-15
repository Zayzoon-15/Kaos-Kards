// Inherit the parent event
event_inherited();

//Page
curPage = 1;

//Button
canHover = true;

//Info
drawInfo = false;

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Resume";

//Action
action = function()
{
    oPause.unpauseGame();
}