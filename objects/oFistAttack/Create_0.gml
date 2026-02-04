//Inherit the parent event
event_inherited();

//Visual
posBasedOnCard = true;

//Stats
currentlyDamaging = false;

//Directiond
dir = 1;
if !targetEnemy then dir = -1;

//Show Up
TweenEasyFade(0,1,0,20/60,EaseOutCubic);
TweenEasyScale(1,0,1,1.5*dir,0,30/60,EaseOutBack);
alarm[1] = 50;

//Action
action = function()
{
    var _y = bbox_top;
    if !targetEnemy then _y = bbox_bottom;
    
    hurtEffect(x,_y);
    damageTarget();
}