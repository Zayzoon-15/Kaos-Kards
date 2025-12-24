///@desc Preform Combo

//Create Card
var _createCombo = function(_card,_targetEnemy)
{
    //Position
    var _startY = _targetEnemy ? room_height+sprite_get_height(sCardBlank) : -sprite_get_height(sCardBlank);
    var _targetY = _targetEnemy ? room_height - yOffset : yOffset;
    
    for (var i = 0; i < 3; i++) {
        instance_create_layer(room_width/2,_startY,"Cards",oAttackCard,{
            card : _card,
            targetX : getXPos(i),
            targetY : _targetY,
            targetEnemy : _targetEnemy,
            combo : true,
            cardId : i
        });
    }

}


//Play Normal Cards
if !ds_list_find_value(playerActions,0) and !ds_list_find_value(enemyActions,0)
{
    alarm[1] = 10;
    alarm[2] = 10; 
}


//Play Player
if (playerFirst or !ds_list_find_value(enemyActions,0)) and ds_list_find_value(playerActions,0)
{
	//Set Combo Value
	var _ogInfo = ds_list_find_value(playerActions,1);
	for (var i = 2; i < ds_list_size(playerActions); ++i) {
		_ogInfo.value += ds_list_find_value(playerActions,i).value;
	    ds_list_set(playerActions,2,_ogInfo);
	}
	
    //Create Combos
    _createCombo(ds_list_find_value(playerActions,1),true);
    
    //Set Values
    ds_list_set(playerActions,0,false);
    
	//Remove Other Actions
	ds_list_clear(playerActions);
	
    //Stop Other Code
	exit;
} 

//Play Enemy
if (!playerFirst or !ds_list_find_value(playerActions,0)) and ds_list_find_value(enemyActions,0)
{
	//Set Combo Value
	var _ogInfo = ds_list_find_value(enemyActions,1);
	for (var i = 2; i < ds_list_size(enemyActions); ++i) {
		_ogInfo.value += ds_list_find_value(enemyActions,i).value;
	    ds_list_set(enemyActions,2,_ogInfo);
	}
	
    //Create Combos
    _createCombo(ds_list_find_value(enemyActions,1),false);
    
    //Set Values
    ds_list_set(enemyActions,0,false);
    
	//Remove Other Actions
	ds_list_clear(enemyActions);
}