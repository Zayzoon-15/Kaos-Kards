///@desc Apply Effect

print("EFFECT")

//Times Up
if timeUp then exit;

//Reduce Value
value *= .6;
value = clamp(value,1,999);

//Effect
applyEffect();

//Set Time
randomize();
timeBetween = random_range(info.timeBetween[0],info.timeBetween[1])*60;

//Start Time Again
alarm[0] = timeBetween;