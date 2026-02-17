// Inherit the parent event
event_inherited();

//Fade
image_alpha = 0;

//Info
infoText = "Press to toggle combo";
text = "Combo";

//Toggle
toggle = true;

//Action
action = function()
{
    toggle = !toggle;
}