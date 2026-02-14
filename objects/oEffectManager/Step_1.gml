//Update List
for (var k = 0; k < 2; k++) {
    
    var _targetList = k == 1 ? playerEffects : enemyEffects;
    var _maxHp = k == 1 ? global.playerMaxHp : global.enemyMaxHp;
    
	for (var i = 0; i < ds_list_size(_targetList); i++) {
    
        var _listValue = ds_list_find_value(_targetList,i);

		//Clamp
		_listValue.value = clamp(_listValue.value,-10,_maxHp);

		//Ease Percent
		if _listValue.healthInst != noone and _listValue.info.type == EFFECT_TYPE.HARM
		{
			with _listValue.healthInst
			{	
				if startHitStun then _listValue.value = lerp(_listValue.value,-2,.03);
                _listValue.value = clamp(_listValue.value,0,_maxHp);
                _listValue.showPercent = (_listValue.value/_maxHp)*100;
			}
		}
		
		if _listValue.info.type == EFFECT_TYPE.ASS
		{
			_listValue.showPercent = lerp(_listValue.showPercent,(_listValue.value/_maxHp)*100,0.3);
			if k == 1
			{
				global.playerTempHp = _listValue.value;
			} else global.enemyTempHp = _listValue.value;	
		}
		
		if _listValue.value <= 0
		{
			with oAttackEffect
			{
				if timeUp
				{
					if _listValue.info == effect
                    {
                        ds_list_delete(_targetList,i);
                        instance_destroy();
                    }
				}
				
			}
		}
    }
}

