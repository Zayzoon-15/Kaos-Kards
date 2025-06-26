///@desc Do A Player Action

var _listLength = ds_list_size(playersActions);
var _struct = ds_list_find_value(playersActions,currentPlayerAction);

var _value = _struct.value;
var _action = _struct.cardAction;
var _name = _struct.cardInfo.info.name;

playerAttackCard(_struct);

currentPlayerAction ++;

if _listLength > currentPlayerAction
{
    playerPauseTime = 90;
    
    alarm[0] = playerPauseTime;
} else playerDone = true;


