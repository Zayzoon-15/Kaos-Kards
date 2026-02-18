// Inherit the parent event
event_inherited();

//Page
curPage = 1;

//Button
canHover = true;

//Info
drawInfo = false;
text = "Settings";

//Text
textXScale = 0;

//Action
action = function()
{
    instance_create_depth(0,0,depth-2,oSettings);
    oSettings.lastButton = oPause.settingsLastButton;
    oSettings.createSettings();
}