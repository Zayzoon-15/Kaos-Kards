// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Info
infoText = "Press to go to the deck builder";
text = "Deck Builder";

//Image
sizeToText = true;

//Action
action = function()
{
    transStart(rDeckBuilder1);
    
    //Don't Hover
    canHover = false;
}