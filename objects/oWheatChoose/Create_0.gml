
//Stars
starEffect(x,y,10,-80,80,-60,60);

//Audio
var _sound = asset_get_index($"snStars{irandom_range(1,2)}");
audio_play_sound(_sound,0,false);

//Get Target
randomize();
target = choose("Player","Enemy");

//Set Angle
if target == "Player"
{
    targetAngle = -90;
} else targetAngle = 90;

//Tween
var _tweenTime = 70;
TweenEasyRotate(500,targetAngle,20,_tweenTime,EaseOutBack);

//Attack
alarm[0] = _tweenTime + 50;
birdAmount = 0;
