
if target == "Enemy"
{
    image_angle = 0;
    attackY = 200;
    startY = room_height;
    dir = 1;
} else {
    image_angle = 180;
    attackY = room_height-200;
    startY = -10;
    dir = -1;
}

value = round(value);
value *= 1.5;

canHurt = true;

//Punch
var _delay = 0;
if cardId == 3
{
    _delay = 20;
}

TweenEasyScale(1,0,1,.5,0,30,EaseOutBack);
alarm[2] = 40+_delay;

//Punch
//var _delay = 35;
//TweenEasyMove(x,startY,x,attackY,_delay,30,EaseOutElastic);
//alarm[0] = 6+_delay;
//alarm[1] = 30+_delay;