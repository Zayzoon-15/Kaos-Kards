///@desc Apply Effect

//Shield Countered
var _shieldValue = targetEnemy ? global.enemyTempHp : global.playerTempHp;
if info.shieldCounter and floor(_shieldValue) > 0
{
    //DEBUG
    print(info.name,"EFFECT COUNTERD BY SHIELD");
    
    //Destroy Effect
    instance_destroy();
    
    //Exit Code
    exit;
}

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