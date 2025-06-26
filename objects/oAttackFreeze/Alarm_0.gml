///@desc Ice Effect
var _dir,_y;
if target == "Enemy" {_dir = 1;} else _dir = -1;

if _dir
{
    _y = {min:60,max:90};
} else _y = {min:-90,max:-60};

snowflakeEffect(x,y,3,_dir,-60,60,_y.min,_y.max);

alarm[0] = 5;