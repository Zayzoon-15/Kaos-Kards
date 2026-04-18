///@desc Apply Effect


//Change Useful Vars
timesUsed ++;
hitStun = 120;

//Change Value
if info.type == EFFECT_TYPE.HARM
{
    effectValue += targetEnemy ? round(hurtEnemy(value,info.ignoreShield)) : round(hurtPlayer(value,info.ignoreShield));
} else {
    effectValue += round(value);
    if targetEnemy
    {
        global.enemyTempHp += round(value);
    } else global.playerTempHp += round(value);
}


//Repeat
if info.timeBetween != undefined and !effectDone
{
    alarm[0] = random_range(info.timeBetween[0],info.timeBetween[1])*60;
}