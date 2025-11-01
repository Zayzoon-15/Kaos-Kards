
applyEffect = function()
{
	//Get List
    var _targetList = playerEffects;
    if targetEnemy then _targetList = enemyEffects;
	
    print("TargetList",_targetList);
    
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
                print("VALUE", _value);
				if _value < 0 then _value = 0;
			}
			
            //Add To Value
            _listValue.value += _value;
            print("List Value",_listValue.value);
            print("AttackValue",value);
            //ITS NOT ADDING TO LIST VALUE FOR HARM
            
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

//Create Icon
var _createIcon = function(_effect)
{
	//No Value
	//var _targetList = playerEffects;
    //if targetEnemy then _targetList = enemyEffects;
	//var _value = 0;
    //for (var i = 0; i < ds_list_size(_targetList); i++) {
        //var _listValue = ds_list_find_value(_targetList,i);
    	//if _listValue.info == effect
        //{
			//_value = _listValue.value;
        //}
    //}
	//
    
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

print("Created")

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
		
        var _array = global.playerHpIcons;
        if target == "Enemy" then _array = global.enemyHpIcons;
        
        iconId ++;
        iconId = clamp(iconId,0,array_length(_array));
        
        if info == other.effect
        {
            print("SAME EFFECT",info);
            iconId = 0;
            _create = false;
        } else _create = true;
		
		}
    }
    print(_create);
    
    if _create then _createIcon(effect);
    
} else _createIcon(effect);