///@desc Outcome

//Value
var _healValue = irandom_range(10,20);
var _poisonValue = clamp(_healValue/5,1,100);

//Win Outcome
if winner
{
    if playerId == 0 then healPlayer(_healValue); //Player Won
    if playerId == 1 then healEnemy(_healValue); //Enemy Won
} else { //Lose Outcome
    if playerId == 0 then addEffect(attackEffects.poison,_poisonValue,false); //Player Lost
    if playerId == 1 { //Enemy Lost
        enemyPlayAnim("kaosHotDogLose",180,"idle");
        addEffect(attackEffects.poison,_poisonValue,true);
    }
}

//Destroy Hotdog Action
if playerId == 0
{
    oHotdog.alarm[2] = 120;
}