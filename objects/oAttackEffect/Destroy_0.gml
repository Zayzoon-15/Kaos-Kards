///@desc Remove Icons

//Get Array
var _array = global.playerHpIcons;
if targetEnemy then _array = global.enemyHpIcons;

//Delete Index
var _index = array_get_index(_array,effect);
array_delete(_array,_index,1);