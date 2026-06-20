///@desc Outcome

//Value
var _healValue = irandom_range(10,20)*global.valueMult;
var _poisonValue = clamp(_healValue/5,5,100)*global.valueMult;

//Win Outcome
if winner
{
    if playerId == 0 then healPlayer(_healValue); //Player Won
    if playerId == 1 then healEnemy(_healValue); //Enemy Won
} else { //Lose Outcome
    if playerId == 0 then attackEffectAdd(effectInfo.poison,_poisonValue,false); //Player Lost
    if playerId == 1 { //Enemy Lost
        oEnemyPhoto.anim.play("kaosHotDogLose","idle",180);
        attackEffectAdd(effectInfo.poison,_poisonValue,true);
    }
}

//Destroy Hotdog Action
if playerId == 0
{
    oHotdog_old.alarm[2] = 120;
}