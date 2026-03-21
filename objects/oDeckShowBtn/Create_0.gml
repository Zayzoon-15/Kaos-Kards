// Inherit the parent event
event_inherited();

//Button
canHover = true;
isMenuButton = true;

//Info
drawInfo = false;
text = "Done";

//Text
textXScale = 0;


//Action
action = function()
{
    instance_destroy(oDeckShowMenu);
}