///@desc Goto Dice

var _targetX,_targetY;

with oDice
{
    if diceId == other.targetDice
    {
        _targetX = x;
        _targetY = y;
    }
}

var _time = 30;

TweenEasyMove(x,y,_targetX,_targetY,0,_time,EaseInBack);
alarm[2] = _time;


