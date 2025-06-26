



//Players Functions
function hurtPlayer(_value)
{
    _value = round(_value);
    
    //Reduce Hp
    if global.playerTempHp > 0
    {
        var _tempValue = global.playerTempHp - _value;
        global.playerTempHp = _tempValue;
        
        if _tempValue < 0
        {
            global.playerHp += _tempValue;
        }
        
    } else global.playerHp -= _value;
    
    //Set Photo
    if instance_exists(oEnemyPhoto)
    {
        with oEnemyPhoto
        {
            win();
        }
    };
    
    //Health Bar
    if instance_exists(oPlayerHealth)
    {
        with oPlayerHealth
        {
            hitEffect();
        }
    }
}

function healPlayer(_value)
{
    //Reduce Hp
    global.playerHp += round(_value);
    
    //Health Bar
    if instance_exists(oPlayerHealth)
    {
        with oPlayerHealth
        {
            gainEffect();
        }
    }
}


//Enemies Functions
function hurtEnemy(_value)
{
    _value = round(_value);
    
    //Reduce Hp
    if global.enemyTempHp > 0
    {
        var _tempValue = global.enemyTempHp - _value;
        global.enemyTempHp = _tempValue;
        
        if _tempValue < 0
        {
            global.enemyHp += _tempValue;
        }
        
    } else global.enemyHp -= _value;
    
    //Set Photo
    if instance_exists(oEnemyPhoto)
    {
        with oEnemyPhoto
        {
            hurt();
        }
    };
    
    //Health Bar
    if instance_exists(oEnemyHealth)
    {
        with oEnemyHealth
        {
            hitEffect();
        }
    }
    
}

function healEnemy(_value)
{
    //Reduce Hp
    global.enemyHp += round(_value);
    
    //Set Photo
    if instance_exists(oEnemyPhoto)
    {
        with oEnemyPhoto
        {
            win();
        }
    };
    
    //Health Bar
    if instance_exists(oEnemyHealth)
    {
        with oEnemyHealth
        {
            gainEffect();
        }
    }
    
}