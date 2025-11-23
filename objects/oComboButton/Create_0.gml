// Inherit the parent event
event_inherited();

//Fade
image_alpha = 0;

//Info
infoText = "Press to toggle combo";

//Text
textTargetSize = 2;
textSize = textTargetSize;
text = "Combo";

//Toggle
toggle = true;

//Action
action = function()
{
    toggle = !toggle;
}