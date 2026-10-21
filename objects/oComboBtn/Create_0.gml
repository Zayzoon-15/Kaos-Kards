//Inherit the parent event
event_inherited();

//Image
sizeToText = true;
image_alpha = 0;
image_yscale = 0.85;
yscale = image_yscale;

//Text
text = "Combo";
infoText = "Press to toggle combo";

//Toggle
canHover = true;
toggle = true;

//Set Action
action = function () {
    toggle = !toggle;
}
