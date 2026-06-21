//@desc Enemy Begin Show

var _time = 50;

TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,_time,"enemyShake",0,8);
TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,0,_time,"enemyXScale",enemyXScale,2);
TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,0,_time,"enemyYScale",enemyYScale,2);
TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,0,_time,"flashAlpha",0,.5);

alarm[1] = _time;