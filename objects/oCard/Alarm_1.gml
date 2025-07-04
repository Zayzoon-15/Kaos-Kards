///@desc Go To Dice

var _target = undefined;

with oDice
{
    if diceId == other.targetDice
    {
        _target = self.id;
    }
}

if _target != undefined
{
    var _time = 30;
    followingDice = true;
    
    TweenEasyMove(x,y,_target.x,_target.y,0,_time,EaseInBack);
    alarm[2] = _time;
}