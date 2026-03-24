// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Info
drawInfo = false;
text = "Resume";

//Text
textXScale = 0;


//Action
action = function()
{
    if global.paused
    {
        oPause.unpauseGame();
    }
}