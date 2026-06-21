//Inherit
event_inherited();


//Position
stickToScreen = true;
stickToScreenRight = false;

//Info
isMenuButton = true;
drawInfo = false;

//Image
image_angle = 5;
TweenEasyFade(0,1,0,30,EaseOutCubic);

//Text
sizeToText = true;
text = " Start Battle ";

//Action
action = function()
{
    oBattleIntro.alarm[2] = 20;
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
}