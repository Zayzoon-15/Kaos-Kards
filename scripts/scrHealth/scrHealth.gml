
///@desc Hurts the enemy by the given amount
///@arg {real} _value The amount of damage
function hurtEnemy(_value)
{
    //Enemy Photo
    with oEnemyPhoto {hurt();}
    
    //Remove Temp Health
    var _tempHp = global.enemyTempHp - _value;
    global.enemyTempHp = _tempHp;
    
    //Remove Health
    if _tempHp < 0 then global.enemyHp += _tempHp;
}


///@desc Hurts the player by the given amount
///@arg {real} _value The amount of damage
function hurtPlayer(_value)
{
    //Enemy Photo
    with oEnemyPhoto {win();}
    
    //Remove Temp Health
    var _tempHp = global.playerTempHp - _value;
    global.playerTempHp = _tempHp;
    
    //Remove Health
    if _tempHp < 0 then global.playerHp += _tempHp;
    
}


function healEnemy(_value)
{
    //Enemy Photo
    with oEnemyPhoto 
    {
        //Happy
        win(false);
        
        //Health Effect
        var _healX = (sprite_width/2)-10;
        var _healY = (sprite_height/2)-15;
        healthEffect(x,y,10,-_healX,_healX,-_healY,_healY);
    }
    
    //Give Health
    global.enemyHp += _value;
}


function healPlayer(_value)
{
    //Give Health
    global.playerHp += _value;
}