///@desc Attack Player Create Event

//Get Position
var _x = room_width/2;
var _y = room_height/2;

//Set Angle
dir = choose(-1,1);
image_angle = 90;

//Turn Speed
turnSpd = random_range(.5,1);

//Tween
var _speed = 30;
TweenEasyScale(.5,.5,40,40,0,_speed-5,EaseInQuint);
TweenEasyMove(_x,room_height,_x,_y,0,_speed,EaseOutCubic);

//Hit
alarm[0] = _speed-5;