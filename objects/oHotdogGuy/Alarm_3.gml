///@desc Outcome

//Value
var _healValue = irandom_range(10,20);
var _poisonValue = _healValue/3;

//Do Outcome
if playerId == 0 and winner
{
    //Player Won
    healPlayer(_healValue);
    
    //Enemy Lost
    enemyPlayAnim("kaosHotDogLose",180,"idle");
    addEffect(attackEffects.poison,_poisonValue,true);
    
} else if playerId == 1 and winner
{
    //Enemy Won
    healEnemy(_healValue);
    
    //Player Lost
    addEffect(attackEffects.poison,_poisonValue,false);
}

//Destroy Hotdog Action
if playerId == 0
{
    oHotdog.alarm[2] = 120;
}