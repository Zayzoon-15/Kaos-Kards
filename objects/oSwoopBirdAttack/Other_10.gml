///@desc Attack Player Create Event

//Set Position
var _margin = 20;
x = random_range(_margin,room_width-_margin);
y = random_range(_margin,room_height-_margin);

//Tween
var _speed = 20;
TweenEasyScale(0,0,4,4,0,_speed-5,EaseLinear);

//Hit
alarm[0] = _speed-5;