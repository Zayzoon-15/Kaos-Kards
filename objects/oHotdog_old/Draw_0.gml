//Set Timer
var _value = (timer / timerMax) * 100;

//Draw Timer
var _height = 20;
var _width = 200;
var _x = ROOM_CENTER.x;
var _y = 120;
draw_healthbar(_x - _width,_y - _height,_x + _width,_y + _height,_value,c_black,c_red,c_aqua,0,true,true);

//Draw Text
textSetup(fnMain,fa_center,fa_middle);
draw_text(_x,_y,timer/60);