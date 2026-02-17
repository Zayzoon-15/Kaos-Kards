///@desc Enemy Ai

//Game Not Started
if !oHotdog.gameStarted then exit;

//Chance
var _missed = irandom_range(1,30*global.currentEnemy.gameDifficulty);
var _time = random_range(15,60)/global.currentEnemy.gameDifficulty;

//Eat Or Miss
if _missed == 1
{
    missedFood();
} else eatFood();

//Click Again
alarm[1] = _time;