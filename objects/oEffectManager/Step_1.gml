//Update List
for (var k = 0; k < 2; k++) {
    
    var _targetList = playerEffects;
    if k == 1 then _targetList = enemyEffects;
    
	for (var i = 0; i < ds_list_size(_targetList); i++) {
    
        var _listValue = ds_list_find_value(_targetList,i);

		//Clamp
		_listValue.value = clamp(_listValue.value,-10,100);

		//Ease Percent
		if _listValue.healthInst != noone and _listValue.info.type == EFFECT_TYPE.HARM
		{
			with _listValue.healthInst
			{	
				if startHitStun then _listValue.value = lerp(_listValue.value,-2,.03);
                _listValue.value = clamp(_listValue.value,0,100);
                _listValue.showPercent = _listValue.value;
			}
		}
		
		if _listValue.info.type == EFFECT_TYPE.ASS
		{
			_listValue.showPercent = lerp(_listValue.showPercent,_listValue.value,0.3);
			if k == 1
			{
				global.enemyTempHp = _listValue.value;
			} else global.playerTempHp = _listValue.value;	
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

