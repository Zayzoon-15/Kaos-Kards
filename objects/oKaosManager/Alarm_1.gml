///@desc Do An Enemy Action

var _listLength = ds_list_size(enemiesActions);
var _struct = ds_list_find_value(enemiesActions,currentEnemyAction);

var _value = _struct.value;
var _action = _struct.cardAction;
var _name = _struct.cardInfo.info.name;

enemyAttackCard(_struct);

currentEnemyAction ++;

if _listLength > currentEnemyAction
{
    randomize();
    //random_range(60,130);
    enemyPauseTime = playerPauseTime + 20;
    
    alarm[1] = enemyPauseTime;
} else enemyDone = true;