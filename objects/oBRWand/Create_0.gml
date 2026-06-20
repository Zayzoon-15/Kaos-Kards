//Inherit
event_inherited();

//Secret hehehe
if irandom_range(1,100) == 1 then sprite_index = sBRChud;

//Info
tipBox = true;
tipBoxString = sprite_index == sBRChud ? "A Chud Plush..." : "A Wand";

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
    if sprite_index == sBRWand
    {
        effectStar(bbox_right-10,y,5,true,0,0,10,5);
    } else effectStar(x,y - sprite_height/2,5);
    
}