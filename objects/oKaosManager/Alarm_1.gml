///@desc Place Cards

print("KAOS START NORMAL CARD");

#region --- Functions ---

//Combo
var _createCombo = function(_card,_targetEnemy)
{
    //Position
    var _startY = _targetEnemy ? room_height+sprite_get_height(sCardBlank) : -sprite_get_height(sCardBlank);
    var _targetY = _targetEnemy ? room_height - yOffset : yOffset;
    
    //Change Value
    _card.value *= global.valueMult;
    
    //Create Cards
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

//Normal Cards (Creates ALL the cards for the player or enemy)
var _createNormalCards = function(_targetEnemy = true)
{
    //Position
    var _x = ROOM_CENTER.x;
    var _y = _targetEnemy ? room_height+sprite_get_height(sCardBlank) : -sprite_get_height(sCardBlank);
    var _targetY = _targetEnemy ? room_height - yOffset : yOffset;
    
    //Setup
    var _list = _targetEnemy ? playerActions : enemyActions;
    var _totalTime = 0;
    
    for (var i = 1; i < 4; i++) {
        
        //Get Card
        var _card = ds_list_find_value(_list,i);
        
        //Create Card
        if _card != undefined and _card != 0
        {
            //Change Value
            _card.value *= global.valueMult;
            
            //Get Speed
            var _speed = _card.info.showSpd * (_targetEnemy ? global.cardsSpeed.player : global.cardsSpeed.enemy);
            var _showTime = _speed + (40 * (i-1));
            _totalTime += _showTime;
            
            //PRINT FOR DEBUG
            print($"CARDPLAYED: {_card.info.name}",$"TARGET ENEMY: {_targetEnemy}",$"SPEED: {_speed}",$"SHOW TIME: {_showTime}",$"VALUE: {_card.value}");
            
            //Create Cards Later Based On Speed
            timeSourceCreate(_showTime,function(){
                
                instance_create_layer(argument[0],argument[1],"Cards",oAttackCard,{
                    targetX : argument[2],
                    targetY : argument[3],
                    targetEnemy : argument[4],
                    card : argument[5],
                    cardId : argument[6]
                });
                
                
            },[_x,_y,getXPos(i-1),_targetY,_targetEnemy,_card,i-1],time_source_units_frames);
        }
        
    }
    
    //End Kaos
    alarm[2] = _totalTime/2 + 30;
}

#endregion


//Play Normal Cards
if !ds_list_find_value(playerActions,0) and !ds_list_find_value(enemyActions,0)
{
    _createNormalCards(true);
    _createNormalCards(false);
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