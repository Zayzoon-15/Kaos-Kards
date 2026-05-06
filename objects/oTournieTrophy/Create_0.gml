// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Scale
image_xscale += .5;

//Info
infoText = "Press to go to the trophy room";
text = "View Trophies";

//Action
action = function()
{
    //Go To Room
    transStart(rTrophyRoom);
    
    //Don't Hover
    canHover = false;
}