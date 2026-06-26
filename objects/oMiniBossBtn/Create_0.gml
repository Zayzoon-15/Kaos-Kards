//Inherit
event_inherited();

//Info
isMenuButton = true;
drawInfo = false;

//Text
sizeToText = true;
text = " Start Battle ";

//Image
drawShadow = false;
image_alpha = 0;
alpha = 1;
alphaTime = .05;
//TweenEasyFade(0,1,10,20,EaseLinear);

//Anim Curve
animate = true;
animPos = 0;
animSpd = 0.03;

//Position
easePos = false;
distance = 250;
y += distance;

//Action
action = function()
{
    oMiniBossAlert.alarm[1] = 20;
    
    //Don't Hover
    canHover = false;
}

//Check Condition
condition = function()
{
    //Allow Press
    canPress = true;
}