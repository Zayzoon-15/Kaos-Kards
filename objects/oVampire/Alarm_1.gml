///@desc Activate Enemy Cards
for (var i = 1; i < ds_list_size(enemyActions); i++) {
	var _index = ds_list_find_value(enemyActions,i);
    _index.value = values[i-1];
    ds_list_set(enemyActions,i,_index);
}