
//Effect
starEffect(x,y,8,10,15);

//Get Target
randomize();
targetEnemy = choose(0,1);

//Get Angle
var _angle = -90;
if targetEnemy then _angle = 90;

//Tween
var _time = 70;
TweenEasyRotate(500,_angle,0,_time,EaseInOutBack);

//Attack
alarm[0] = _time + 30;