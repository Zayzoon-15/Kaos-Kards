/////////////////////////
//// ATTACK EFFECTS ////
///////////////////////






function createAttackEffect(_name,_sprite,_color,_type,_totalTime = undefined,_timeBetween = undefined) constructor 
{
    name = _name;
    sprite = _sprite;
    color = _color;
    type = _type;
    totalTime = _totalTime;
    timeBetween = _timeBetween;
}









//This is where all the effects that attacks can give go
/*
global.playerEffects = [];
global.enemyEffects = [];

enum EFFECTTYPES
{
    ASS,
    HARM
}

function createAttackEffect(_name,_sprite,_type,_totalTime = undefined,_timeBetween = undefined) constructor 
{
    name = _name;
    sprite = _sprite;
    type = _type;
    totalTime = _totalTime;
    timeBetween = _timeBetween;
}

#endregion


globalvar attackEffects;

attackEffects = {
    
    shield : new createAttackEffect("Shield",sShieldIcon,EFFECTTYPES.ASS,undefined),
    poison : new createAttackEffect("Poison",sPoisonIcon,EFFECTTYPES.HARM,
    {min:5,max:8},{min:.3,max:1.5}),
    fire : new createAttackEffect("Fire",sFireIcon,EFFECTTYPES.HARM,
    {min:3,max:5},{min:.6,max:2}),
};



function applyAttackEffect(_attack,_targetEnemy,_value)
{
    //Create Effect
    instance_create_depth(0,0,0,oAttackEffect,{
        info : _attack,
        targetEnemy : _targetEnemy,
        value : _value
    });
}


/*
 * HOW TO ADD AN EFFECT:
 * Sprite: The icon Sprite
 * Type: Assist Or Harm
 * Time: The min amount of time it applies it for in seconds
 * Time Example:
 *    totalTime = {min:3,max:5}; timeBetween = {min:1,max:2}
 *    leave undefined for it to be instant
 * 
 * 
 * Make 2 variables one for the player and enemy such as
 * Assist Effects and Hurt Effects
 * Assist Effects will give bonus health and Hurt Effects will remove health
 * So Assist Effects is like current TempHp
 * 
 * Create an object @oAttackEffect and make that manage the given effect it has
 * So if it has poison make an alarm that applies the effect
 * And if it has sheild make it be instant 
*/