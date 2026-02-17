// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Scale
image_xscale += .5;

//Info
infoText = "Press to change your deck";
text = "Deck Builder";

//Action
action = function()
{
    //Go To Room
    transStart(rDeckBuilder2);
    
    //Don't Hover
    canHover = false;
}