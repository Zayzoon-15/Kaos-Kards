///@desc Combine Values
state = DICESTATE.COMBINE;

var _targetX = undefined;
var _targetY = undefined;

with oPlayerCardSlot
{
    if slotId == other.diceId and filled
    {
        _targetY = y;
        _targetX = x;
    }
}


if _targetX != undefined and _targetY != undefined
{
    
    var _time = 30;
    
    TweenEasyMove(x,y,_targetX,_targetY,0,_time,EaseInBack);
    
    alarm[3] = _time;
    
}