///@desc Countdown

var _x = display_get_gui_width()/2;
var _y = display_get_gui_height()/2;

drawNumberCountdown(_x,_y,currentNumber);

currentNumber --;

if currentNumber > 0
{
    alarm[0] = 60;
} else alarm[1] = 60;