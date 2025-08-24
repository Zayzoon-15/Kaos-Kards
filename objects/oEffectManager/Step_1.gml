

//Update List
for (var i = 0; i < ds_list_size(playerEffects); i++) {
    
    var _listValue = ds_list_find_value(playerEffects,i);
    
    //Ease Percent
    _listValue.showPercent = lerp(_listValue.showPercent,_listValue.percent,.2);
    
    //Delete If Lower Than 0
	if _listValue.showPercent <= .5
    {
        ds_list_delete(playerEffects,i);
    }
}