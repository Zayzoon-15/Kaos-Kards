


//Update List
for (var k = 0; k < 2; k++) {
    
    var _targetList = playerEffects;
    if k == 1 then _targetList = enemyEffects;
    
	for (var i = 0; i < ds_list_size(_targetList); i++) {
    
        var _listValue = ds_list_find_value(_targetList,i);

		//Ease Percent
		if _listValue.healthInst != noone and _listValue.info.type == EFFECT_TYPE.HARM
		{
			with _listValue.healthInst
			{	
				if startHitStun then _listValue.value = lerp(_listValue.value,-2,.03);
			}
		}
		
		if _listValue.info.type == EFFECT_TYPE.ASS
		{
			_listValue.showPercent = lerp(_listValue.showPercent,_listValue.value,0.3);
			global.playerTempHp = _listValue.value;
		}
		
		if _listValue.value <= 0
		{
			with oAttackEffect
			{
				if timeUp
				{
					if _listValue.info == effect then instance_destroy();
					ds_list_delete(_targetList,i);
				}
				
			}
		}
    }
}

