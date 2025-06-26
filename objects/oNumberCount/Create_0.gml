
//Set Values
var _scaleTime = 40;
var _alphaTime = 30;

var _startScale = .5;
var _endScale;

if isString
{
    _endScale = 5;
} else _endScale = 2;

//Tween
TweenEasyScale(_startScale,_startScale,_endScale,_endScale,0,_scaleTime,EaseOutElastic);
TweenEasyFade(1,0,_scaleTime-20,_alphaTime,EaseLinear);

//Destroy
alarm[0] = _scaleTime + _alphaTime;

//Check Num
if isString
{
    font = fnMain;
} else font = fnNumber;