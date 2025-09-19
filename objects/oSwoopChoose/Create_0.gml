
//Effect
var _starX = (sprite_width/2)-10;
var _starY = (sprite_height/2)-15;
starEffect(x,y,8,-_starX,_starX,-_starY,_starY);

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