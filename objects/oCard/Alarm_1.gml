///@desc Go To Dice ONLY FOR DICE CARD

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
    
    TweenEasyMove(x,y,_target.x,_target.y,0,_time/60,EaseInBack);
    alarm[2] = _time;
}