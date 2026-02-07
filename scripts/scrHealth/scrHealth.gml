
///@desc Hurts the enemy by the given amount
///@param {real} _value The amount of damage
///@param {bool} _ignoreShield If it should ignore shield the shield and affect the health
function hurtEnemy(_value,_ignoreShield = false)
{	
    //Enemy Photo
    with oEnemyPhoto {hurt();}
	
    //Give Combo
    global.playerComboMeter += _value*global.comboMult;
    
    //Performance
    global.playerPerformance += _value;
    global.enemyPerformance -= _value;
    
	////Add Mult
	//_value *= global.valueMult;
	
    //Remove Temp Health
    var _lastTemp = global.enemyTempHp;
    var _tempHp = global.enemyTempHp - _value;
    global.enemyTempHp = _tempHp;
    
    //Ignore Temp Hp
    if _ignoreShield then _tempHp = -_value;
    
    //Remove Health
    var _lastHp = global.enemyHp;
    if _tempHp < 0 then global.enemyHp += _tempHp;
    
    //Health Bar
    with oHealthBar
    {
        if target == "Enemy" then hitEffect(_lastTemp);
    }
	
	//Remove Assist Effect
	for (var i = 0; i < ds_list_size(enemyEffects); ++i) {
	    var _list = ds_list_find_value(enemyEffects,i);
		if _list.info.type == EFFECT_TYPE.ASS
		{
			_list.value -= _value;
		}
	}
}


///@desc Hurts the player by the given amount
///@param {real} _value The amount of damage
///@param {bool} _ignoreShield If it should ignore shield the shield and affect the health
function hurtPlayer(_value,_ignoreShield = false)
{
    //Enemy Photo
    with oEnemyPhoto {win();}
    
    //Give Combo
    global.enemyComboMeter += _value*global.comboMult;
    
    //Performance
    global.playerPerformance -= _value;
    global.enemyPerformance += _value;

	////Add Mult
	//_value *= global.valueMult;
    
    //Remove Temp Health
    var _lastTemp = global.playerTempHp;
    var _tempHp = global.playerTempHp - _value;
    global.playerTempHp = _tempHp;
    
    //Ignore Temp Hp
    if _ignoreShield then _tempHp = -_value;
    
    //Remove Health
    var _lastHp = global.playerHp;
    if _tempHp < 0 then global.playerHp += _tempHp;
    
    //Health Bar
    with oHealthBar
    {
        if target == "Player" then hitEffect(_lastTemp);
    }
	
	//Remove Assist Effect
	for (var i = 0; i < ds_list_size(playerEffects); ++i) {
	    var _list = ds_list_find_value(playerEffects,i);
		if _list.info.type == EFFECT_TYPE.ASS
		{
			_list.value -= _value;
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
        effectHealth(x,y,10,false,10,15);
    }
	
	//Add Mult
	_value *= global.valueMult;
    
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
	
	//Add Mult
	_value *= global.valueMult;
    
    //Give Health
    global.playerHp += _value;
}