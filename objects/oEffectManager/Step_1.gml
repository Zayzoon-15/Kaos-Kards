
//Update List
for (var i = 0; i < ds_list_size(playerEffects); i++) {
    
    
    
    //Delete If Lower Than 0
	if ds_list_find_value(playerEffects,i).percent <= 0
    {
        ds_list_delete(playerEffects,i);
    }
}

