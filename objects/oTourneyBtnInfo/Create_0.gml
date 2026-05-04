// Inherit the parent event
event_inherited();

//Button
canHover = true;

//Info
infoText = "Press to view the tournaments rules and information";
text = "Rules";

//Action
action = function()
{
    instance_create_depth(0,0,-1,oTourneyInfo);
}