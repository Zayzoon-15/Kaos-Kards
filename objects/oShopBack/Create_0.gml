//Inherit
event_inherited();

//Position
stickToScreen = true;
stickToScreenRight = false;

//Action
action = function()
{
    transStart(rBreakRoom);
    
    //Don't Hover
    canHover = false;
}

//Play Song For Now
audioPlaySong("ShopIntro",30,"Pause");