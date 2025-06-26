///@desc Attack

//Show Message
showMessage($"Attacking The {target}",MESSAGE_X,MESSAGE_Y);

//Fade
var _tweenDelay = 60;
var _tweenTime = 50;
TweenEasyFade(1,0,_tweenDelay,_tweenTime,EaseOutCubic);

if target == "Enemy"
{
    instance_create_layer(-30,room_height,"Effects",oWheatBread,{
       target : target, 
    });
    alarm[1] = 30;
} else {
    instance_create_layer(room_width/2,room_height,"Effects",oWheatBread,{
       target : target, 
    });
    
    var _alarmTime;
    if global.breadFirst and target == "Player"
    {
        _alarmTime = 60*2;
    } else _alarmTime = 30;
	alarm[2] = _alarmTime;
}