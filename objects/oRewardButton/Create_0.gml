//Inherit
event_inherited();

//Button
canHover = true;
isMenuButton = true;

//Info
drawInfo = false;
text = "Okay";

//Text
textXScale = 0;
TweenEasyFade(0,1,0,10,EaseOutCubic);


//Action
action = function()
{
    instance_destroy(oReward);
}