///@desc Apply Effect


applyEffect();

//Leave If No Time
if effect.totalTime == undefined then exit;

//Start Time Again
randomize();
var _timeBetween = effect.timeBetween;
var _time = random_range(_timeBetween[0],_timeBetween[1])*60;
alarm[0] = _time;