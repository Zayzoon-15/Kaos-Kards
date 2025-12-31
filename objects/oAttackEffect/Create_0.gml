//Change Value
if info.type == EFFECT_TYPE.HARM then value *= .55;
value = clamp(value,1,99);

//Effect
applyEffect = function()
{
	//Get List
    var _targetList = playerEffects;
    if targetEnemy then _targetList = enemyEffects;
    
	//Get Temp Hp
	var _tempHp = global.playerTempHp;
	if targetEnemy then _tempHp = global.enemyTempHp;

    for (var i = 0; i < ds_list_size(_targetList); i++) {
        
        var _listValue = ds_list_find_value(_targetList,i);
    	if _listValue.info == effect
        {
			
			//Set Value
			var _value = value;
			if _listValue.info.type == EFFECT_TYPE.HARM
			{
				_value = value - _tempHp;
				if _value < 0 then _value = 0;
			}
			
            //Add To Value
            _listValue.value += _value;
            
            //Decrease Hp
            if _listValue.info.type == EFFECT_TYPE.HARM
            {
                if targetEnemy then hurtEnemy(value); else hurtPlayer(value);
            }
            
        }
    }

}

//Start Effect
applyEffect();

//Time
timeUp = true;
setupTime = function()
{
	if info.totalTime != undefined
	{
		//Set Time
		randomize();
		timeBetween = random_range(info.timeBetween[0],info.timeBetween[1])*60;
		totalTime = random_range(info.totalTime[0],info.totalTime[1])*60;
		timeUp = false;

		//Start Times
		alarm[0] = timeBetween;
		alarm[1] = totalTime;
	}
}
setupTime();


setupIcons = function()
{
//Create Icon
var _createIcon = function(_effect)
{
	//Get Target
    var _target = "Player";
    if targetEnemy then _target = "Enemy";
    
	//Get Array
    var _array = global.playerHpIcons;
    if targetEnemy then _array = global.enemyHpIcons;
    
	//Add To Array
    array_insert(_array,0,_effect);

	//Create Icon
    instance_create_layer(0,0,"Ui",oHealthIcon,{
        info : _effect,
        target : _target,
        sprite_index : _effect.sprite,
    });
}


//Change Existing Icon
if instance_exists(oHealthIcon)
{
	var _target = "Player";
	if targetEnemy then _target = "Enemy";
    var _create = true;
    with oHealthIcon
    {
        if _target == target and healthInst != noone
		{
			//Get Array
	        var _array = global.playerHpIcons;
	        if target == "Enemy" then _array = global.enemyHpIcons;
		
			//Same Effect Exists
	        if info.name == other.effect.name
	        {
				//Set Position Of Effect
				var _index = array_get_index(_array,info);
				arraySwapIndex(_array,_index,0);
				
	            _create = false;
	        } else _create = true;
			
			//Array Contains Effect
			if array_contains(_array,other.effect) then _create = false;
		}
    }
    
    if _create then _createIcon(effect);
    
} else _createIcon(effect);

}
setupIcons();