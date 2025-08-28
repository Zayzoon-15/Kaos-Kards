
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
    var _lastHp = global.enemyHp;
    if _tempHp < 0 then global.enemyHp += _tempHp;
    
    //Health Bar
    with oHealthBar
    {
        if target == "Enemy" then hitEffect(_lastHp);
    }
}


///@desc Hurts the player by the given amount
///@arg {real} _value The amount of damage
function hurtPlayer(_value)
{
    //Enemy Photo
    with oEnemyPhoto {win();}
    
    //Remove Temp Health
    var _lastTemp = global.playerTempHp;
    var _tempHp = global.playerTempHp - _value;
    global.playerTempHp = _tempHp;
    
    //Remove Health
    var _lastHp = global.playerHp;
    if _tempHp < 0 then global.playerHp += _tempHp;
    
    //Health Bar
    if _tempHp < 0
    {
        with oHealthBar
        {
            if target == "Player" then hitEffect(_lastHp);
        }
    }
    
    if _lastTemp > 0
    {
    	with oTempHpBar
        {
            if target == "Player" then hitEffect();
        }
    }
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
    
    //Health Bar
    with oHealthBar
    {
        if target == "Enemy" then gainEffect();
    }
    
    //Give Health
    global.enemyHp += _value;
}


function healPlayer(_value)
{
    //Health Bar
    with oHealthBar
    {
        if target == "Player" then gainEffect();
    }
    
    //Give Health
    global.playerHp += _value;
}