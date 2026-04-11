///@desc Enemy Ai

//Game Not Started
if !oHotdog.gameStarted then exit;

//Chance
var _missed = irandom_range(1,30*global.currentEnemy.difficulty.gameSkill);
var _time = random_range(30,80)/global.currentEnemy.difficulty.gameSkill;

//Eat Or Miss
if _missed == 1
{
    missedFood();
} else eatFood();

//Click Again
alarm[1] = _time;