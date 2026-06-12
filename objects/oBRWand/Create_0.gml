//Inherit
event_inherited();

//Info
tipBox = true;
tipBoxString = "A Wand";

//Animation Curve
curvePos = 1;
curveSpd = .03;
angleDir = 1;

//Skew
xOffset = -1;
yOffset = 12;
skewX = 3;
skewY = 4;
skewAngle = -1;
skewScaleX = 1;
skewScaleY = 1;

//Functions
action = function()
{
    //Set Curve Pos
    curvePos = 0;
    angleDir = choose(-1,1);
    
    //Effect
    effectStar(bbox_right-10,y,5,true,0,0,10,5);
}