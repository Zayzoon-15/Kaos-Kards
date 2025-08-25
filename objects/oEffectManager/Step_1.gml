

//Update List
for (var k = 0; k < 1; k++) {
    
    var _targetList = playerEffects;
    if k == 1 then _targetList = enemyEffects;
    
	for (var i = 0; i < ds_list_size(_targetList); i++) {
    
        var _listValue = ds_list_find_value(_targetList,i);
        
        //Ease Percent
        _listValue.showPercent = lerp(_listValue.showPercent,_listValue.percent,.2);
        
        //Delete If Lower Than 0
    	if _listValue.showPercent <= .5
        {
            ds_list_delete(_targetList,i);
            
            var _targetArray = global.playerHpIcons;
            if k == 1 then _targetArray = global.enemyHpIcons;
            var _arrayIndex = array_get_index(_targetArray,_listValue);
            array_delete(_targetArray,_arrayIndex,1);
        }
    }
}

