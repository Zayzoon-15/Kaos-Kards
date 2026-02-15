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
text = "Settings";

//Action
action = function()
{
    instance_create_depth(0,0,depth,oSettings);
    oSettings.lastButton = oPause.settingsLastButton;
    oSettings.createSettings();
}